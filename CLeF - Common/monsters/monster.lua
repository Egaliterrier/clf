require "/scripts/behavior.lua"
require "/scripts/pathing.lua"
require "/scripts/util.lua"
require "/scripts/vec2.lua"
require "/scripts/drops.lua"
require "/scripts/status.lua"

-- Engine callback - called on initialization of entity
function init()
  self.pathing = {}

  self.shouldDie = true
  self.notifications = {}
  if storage.spawnPosition == nil then
    local position = mcontroller.position()
    local groundSpawnPosition
    if mcontroller.baseParameters().gravityEnabled then
      groundSpawnPosition = findGroundPosition(position, -20, 3)
    end
    storage.spawnPosition = groundSpawnPosition or position
  end
  BData:setPosition("spawn", storage.spawnPosition)

  self.behaviorConfig = sb.jsonMerge(entity.configParameter("behaviorConfig", {}), skillBehaviorConfig())
  self.behavior = BTree:new(entity.configParameter("behavior"))

  self.collisionPoly = mcontroller.collisionPoly()

  if entity.hasSound("deathPuff") then    
    entity.setDeathSound("deathPuff")
  end
  if entity.configParameter("deathParticles") then
    entity.setDeathParticleBurst(entity.configParameter("deathParticles"))
  end
  
  mcontroller.setAutoClearControls(false)
  self.behaviorTickRate = 1
  self.behaviorTick = math.random(1, self.behaviorTickRate)

  entity.setGlobalTag("flipX", "")

  -- Listen to capture pods
  message.setHandler("capture", function()
    status.setResource("health", 0)
    spawnCapturePod()
  end)

  -- Listen to damage taken
  self.damageTaken = damageListener("damageTaken", function(notifications)
    for _,notification in pairs(notifications) do
      if notification.damage > 0 then
        self.damaged = true
        BData:setEntity("damageSource", notification.sourceEntityId)
      end
    end
  end)

  self.debug = true

  local deathBehavior = entity.configParameter("deathBehavior")
  if deathBehavior then
    self.deathBehavior = BTree:new(deathBehavior)
  end
end

-- This is called in update() using pcall
-- to catch errors
local _update = function(dt)
  if status.resourcePositive("stunned") then
    entity.setAnimationState("damage", "stunned")
    entity.setGlobalTag("hurt", "hurt")
    self.stunned = true
    mcontroller.clearControls()
    return 
  else
    entity.setGlobalTag("hurt", "")
    entity.setAnimationState("damage", "none")
  end

  self.damageTaken:update()

  if self.behaviorTick >= self.behaviorTickRate then
    self.behaviorTick = self.behaviorTick - self.behaviorTickRate
    mcontroller.clearControls()

    self.tradingEnabled = false
    self.setFacingDirection = false

    BData:setEntity("self", entity.id())
    BData:setPosition("self", mcontroller.position())
    BData:setNumber("facingDirection", mcontroller.facingDirection())

    if self.behavior and self.behavior:run(dt * self.behaviorTickRate) ~= "running" then
      self.behavior:reset()
    end

    self.interacted = false
    self.damaged = false
    self.stunned = false
    self.notifications = {}
  end
  self.behaviorTick = self.behaviorTick + 1

  setDamageSources()
  overrideCollisionPoly()

  runWorkers()
end

-- Engine callback - called on each update
-- Update frequencey is dependent on update delta
function update(dt)
  local status, result = pcall(_update, dt)
  if not status then
    error(string.format("Lua Error in monster type '%s'\n %s", entity.type(), result))
  end
end

function uninit()
  self.behavior:uninit()
end

function die()
  if self.deathBehavior then
    self.deathBehavior:run()
  end
  spawnDrops()
end

function setDamageSources()
  local damageSources = {}

  local partSources = entity.configParameter("damageParts", {})
  for part,ds in pairs(partSources) do
    local damageArea = entity.partPoly(part, "damageArea")
    if damageArea then
      ds.poly = damageArea
      ds.damage = ds.damage * root.evalFunction("monsterLevelPowerMultiplier", entity.level())
      table.insert(damageSources, ds)
    end
  end

  entity.setDamageSources(damageSources)
end

function overrideCollisionPoly()
  local collisionParts = entity.configParameter("collisionParts", {})

  for _,part in pairs(collisionParts) do
    local collisionPoly = entity.partPoly(part, "collisionPoly")
    if collisionPoly then
      mcontroller.controlParameters({collisionPoly = collisionPoly, standingPoly = collisionPoly, crouchingPoly = collisionPoly})
      break
    end
  end
end

function skillBehaviorConfig()
  local skills = entity.configParameter("skills", {})
  local config = {}

  for _,skillName in pairs(skills) do
    local skillHostileActions = root.skillConfigParameter(skillName, "hostileActions")
    if skillHostileActions then
      construct(config, "hostileActions")
      util.appendLists(config.hostileActions, skillHostileActions)
    end
  end

  return config
end

function spawnCapturePod()
  world.spawnItem("filledcapturepod", mcontroller.position(), 1, {
    projectileConfig = {
      speed = 40,
      level = 1,
      actionOnReap = {
        {
          action = "spawnmonster",
          offset = {0, 0},
          type = entity.type();
          arguments = { persistent = true, seed = entity.seed() }
        }
      }
    }
  })
end

function setupTenant(...)
  require("/scripts/tenant.lua")
  tenant.setHome(...)
end

function suicide(args, output)
  status.setResource("health", 0)
end

function wasDamaged(args, output)
  return self.damaged == true
end

function wasStunned(args, output)
  return self.stunned == true
end

function shouldDie()
  return self.shouldDie and status.resource("health") <= 0
end

function attackNotification(args, output)
  return false
end

-- param type
-- param state
function setAnimationState(args, output)
  args = parseArgs(args, {
    type = nil,
    state = nil
  })
  if args.type == nil or args.state == nil or args.type == "" or args.state == "" then
    return false
  end

  entity.setAnimationState(args.type, args.state)
  return true
end

-- param type
-- param tag
function setGlobalTag(args, output)
  args = parseArgs(args, {
    type = nil,
    tag = nil  
  })
  if args.type == nil or args.type == ""then
    return false
  end

  entity.setGlobalTag(args.type, args.tag or "")
  return true
end

-- param entity
function isValidTarget(args, output)
  args = parseArgs(args, {
    entity = nil
  })
  local entityId = BData:getEntity(args.entity)
  if entityId == nil then return false end

  return entity.isValidTarget(entityId)
end

-- param angle
-- param vector
-- param immediate
function rotate(args, output)
  args = parseArgs(args, {
    angle = 0,
    vector = nil,
    a = 0
  })

  local goalAngle = 0
  local angle = mcontroller.rotation()
  repeat
    if args.vector then
      local vector = vec2.norm(BData:getVec2(args.vector))
      if vector == nil then return false end
      goalAngle = math.atan(vector[2], vector[1])
    else
      goalAngle = BData:getNumber(args.angle)
    end
    goalAngle = (goalAngle + entity.configParameter("rotationOffset", 0)) % (math.pi*2)
    if args.rate == 0 then break end

    local diff = util.angleDiff(angle, goalAngle)
    local angleStep = args.rate * args.dt * util.toDirection(diff)
    -- break if the angle went past the goal angle
    if util.angleDiff(angle + angleStep, goalAngle) * diff < 0 then break end

    angle = angle + angleStep
    entity.resetTransformationGroup("body")
    entity.rotateTransformationGroup("body", angle)
    mcontroller.setRotation(angle)

    coroutine.yield("running")
  until math.abs(util.angleDiff(angle, goalAngle)) < 0.02

  entity.resetTransformationGroup("body")
  entity.rotateTransformationGroup("body", goalAngle)
  mcontroller.setRotation(goalAngle)
  return true
end

-- param transformationGroup
function resetTransformationGroup(args, output)
  args = parseArgs(args, {
    transformationGroup = nil  
  })
  if args.transformationGroup == nil then return false end
  entity.resetTransformationGroup(args.transformationGroup)
  return true
end

-- param transformationGroup
-- param angle
-- param rotationCenter
function rotateTransformationGroup(args, output)
  args = parseArgs(args, {
    transformationGroup = nil,
    angle = 0,
    rotationCenter = nil
  })
  local angle = BData:getNumber(args.angle)
  if angle == nil or args.transformationGroup == nil or args.transformationGroup == "" then
    return false
  end

  local rotationCenter = BData:getVec2(args.rotationCenter)
  entity.rotateTransformationGroup(args.transformationGroup, angle, rotationCenter)
  return true
end

-- param touchDamage
function setDamageOnTouch(args, output)
  args = parseArgs(args, {
    touchDamage = false  
  })

  --Damage on touch? No, you don't, Chucklefish
  --entity.setDamageOnTouch(args.touchDamage)
  return true
end

-- param aggressive
function setAggressive(args, output)
  args = parseArgs(args, {
    aggressive = false  
  })

  entity.setAggressive(args.aggressive == true)
  return true
end

-- param skillName
function setActiveSkillName(args, output)
  args = parseArgs(args, {
    skillName = ""
  })

  entity.setActiveSkillName(args.skillName)
  return true
end

-- param emitter
function burstParticleEmitter(args, output)
  args = parseArgs(args, {
    emitter = nil
  })

  if args.emitter == nil or args.emitter == "" then return false end

  entity.burstParticleEmitter(args.emitter)
  return true
end

-- param emitter
-- param active
function setParticleEmitterActive(args, output)
  args = parseArgs(args, {
    active = true  
  })
  if args.emitter == nil then return false end

  entity.setParticleEmitterActive(args.emitter, args.active)
  return true
end

-- param sound
function playSound(args, output)
  args = parseArgs(args, {
    sound = nil
  })

  if args.sound == nil or args.sound == "" then return false end

  entity.playSound(args.sound)
  return true
end

function setLightActive(args, output)
  args = parseArgs(args, {
    light = nil,
    active = true  
  })
  if light == nil or active == nil then return false end

  entity.setLightActive(args.light, args.active)
  return true
end

function setDying(args, output)
  args = parseArgs(args, {
    shouldDie = true
  })
  self.shouldDie = args.shouldDie
  return true
end
