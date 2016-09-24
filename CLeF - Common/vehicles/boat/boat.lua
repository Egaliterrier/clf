--
--Contains boat code fixes by LoPhatKao
--
require "/scripts/vec2.lua"
require "/scripts/util.lua"

function init()
  self.specialLast = false
  self.rockingTimer = 0 
  self.facingDirection = 1
  self.angle = 0
  animator.setParticleEmitterActive("bubbles", false)
  self.damageEmoteTimer = 0
  self.spawnPosition = mcontroller.position()

  self.maxHealth =1
  self.maxBuoyancy =1
  self.waterFactor=0 --how much water are we in right now

  self.rockingInterval = vehicle.configParameter("rockingInterval")
  self.maxHealth = vehicle.configParameter("maxHealth")
  self.protection = vehicle.configParameter("protection")

  self.damageStateNames = vehicle.configParameter("damageStateNames")
  self.damageStateDriverEmotes = vehicle.configParameter("damageStateDriverEmotes")
  self.materialKind = vehicle.configParameter("materialKind")


  self.windLevelOffset = vehicle.configParameter("windLevelOffset")
  self.rockingWindAngleMultiplier = vehicle.configParameter("rockingWindAngleMultiplier")
  self.maxRockingAngle = vehicle.configParameter("maxRockingAngle")
  self.angleApproachFactor = vehicle.configParameter("angleApproachFactor")

  self.speedRotationMultiplier = vehicle.configParameter("speedRotationMultiplier")

  self.targetMoveSpeed = vehicle.configParameter("targetMoveSpeed")
  self.moveControlForce = vehicle.configParameter("moveControlForce")

  mcontroller.resetParameters(vehicle.configParameter("movementSettings"))

  self.minWaterFactorToFloat=vehicle.configParameter("minWaterFactorToFloat")
  self.sinkingBuoyancy=vehicle.configParameter("sinkingBuoyancy")
  self.sinkingFriction=vehicle.configParameter("sinkingFriction")

  self.bowWaveParticleNames=vehicle.configParameter("bowWaveParticles")
  self.bowWaveMaxEmissionRate=vehicle.configParameter("bowWaveMaxEmissionRate")

  self.splashParticleNames=vehicle.configParameter("splashParticles")
  self.splashEpsilon=vehicle.configParameter("splashEpsilon")

  self.maxGroundSearchDistance = vehicle.configParameter("maxGroundSearchDistance")

  local bounds = mcontroller.localBoundBox()
  self.frontGroundTestPoint={bounds[1],bounds[2]}
  self.backGroundTestPoint={bounds[3],bounds[2]}

  --setup the store functionality
  self.ownerKey = vehicle.configParameter("ownerKey")
  vehicle.setPersistent(self.ownerKey)

  message.setHandler("store", function(_, _, ownerKey)
 
                        local animState=animator.animationState("base")

                        if (animState=="idle" or animState=="sinking" or animState=="sunk") then
                          if (self.ownerKey and self.ownerKey == ownerKey) then
                             self.spawnPosition = mcontroller.position()
                            animator.setAnimationState("base", "warpOutPart1")
                            local localStorable = (self.driver ==nil)
                            return {storable = true, healthFactor = storage.health / self.maxHealth}
                          end  
                        end
  end)

 --assume maxhealth
  if (storage.health) then
    animator.setAnimationState("base", "idle")     
  else
    local startHealthFactor = vehicle.configParameter("startHealthFactor")

    if (startHealthFactor == nil) then
        storage.health = self.maxHealth 
    else
       storage.health = math.min(startHealthFactor * self.maxHealth, self.maxHealth)
    end    
    animator.setAnimationState("base", "warpInPart1")  
  end

  --set up any damage efects we have...
  updateDamageEffects(0, true)


end

function update()
  local sinkAngle=-math.pi*0.4

  local animState=animator.animationState("base")
  local waterFactor = mcontroller.liquidPercentage();


  if (animState=="warpedOut") then
    vehicle.destroy()
  elseif (animState=="warpInPart1" or animState=="warpOutPart2") then
    world.debugText("warping",mcontroller.position(),"red")

    --lock it solid whilst spawning/despawning
    mcontroller.setPosition(self.spawnPosition)
    mcontroller.setVelocity({0,0})
  elseif (animState=="sunk") then
--    world.debugText("sunk",mcontroller.position(),"red")
    -- not much here.
    local targetAngle=calcGroundCollisionAngle(self.maxGroundSearchDistance)
    self.angle = self.angle + (targetAngle - self.angle) * self.angleApproachFactor

  elseif (animState=="sinking") then
    world.debugText("sinking",mcontroller.position(),"red")
  
    self.angle=updateSinking(waterFactor, self.angle,sinkAngle)

  elseif (animState=="idle") then

    world.debugText("idle",mcontroller.position(),"green")

    local healthFactor = storage.health / self.maxHealth
    local waterSurface = self.maxGroundSearchDistance
    self.waterBounds=mcontroller.localBoundBox()

    --work out water surface
    if (waterFactor>0) then
      waterSurface=(self.waterBounds[4] * waterFactor) + (self.waterBounds[2] * (1.0-waterFactor))
    end

    self.waterBounds[2] = waterSurface +0.25
    self.waterBounds[4] = waterSurface +0.5

    world.debugText(string.format("WaterSurface=%s", self.waterBounds[2]),mcontroller.position(),"yellow")


    local facing
    local moving

    moving,facing = updateDriving()

    --Rocking in the wind, and rotating up when moving
    local floating = updateFloating(waterFactor, moving,facing)
    updateMovingEffects(floating,moving)
    updatePassengers(healthFactor)

    if storage.health<=0 then
      vehicle.setLoungeEnabled("titanicPose",false)
      animator.setAnimationState("base", "sinking")
    end

    self.facingDirection = facing
    self.waterFactor=waterFactor --how deep are we in the water right now ?
  end

  --take care of rotating and flipping
  animator.resetTransformationGroup("flip")
  animator.resetTransformationGroup("rotation")


  if self.facingDirection < 0 then
    animator.scaleTransformationGroup("flip", {-1, 1})
  end

  animator.rotateTransformationGroup("rotation", self.angle)

  mcontroller.setRotation(self.angle)

end



function updateDriving()
  local moving = false
  local facing = self.facingDirection

  local driverThisFrame = vehicle.entityLoungingIn("drivingSeat")
  if (driverThisFrame ~= nil) then
    vehicle.setDamageTeam(world.entityDamageTeam(driverThisFrame))

    if vehicle.controlHeld("drivingSeat", "left") then
      mcontroller.approachXVelocity(-self.targetMoveSpeed, self.moveControlForce)
      moving = true
      facing = -1
    end

    if vehicle.controlHeld("drivingSeat", "right") then
      mcontroller.approachXVelocity(self.targetMoveSpeed, self.moveControlForce)
      moving = true
      facing = 1
    end
  else
    vehicle.setDamageTeam({type = "passive"})
  end

  return moving,facing
end

function updateSinking(waterFactor, currentAngle, sinkAngle)

  if (mcontroller.onGround()) then
    --not floating any more. Must have touched bottom.
    animator.setAnimationState("base", "sunk")  

    animator.setParticleEmitterActive("bubbles", false)
    vehicle.setLoungeEnabled("drivingSeat",false)

    local targetAngle=calcGroundCollisionAngle(self.maxGroundSearchDistance)
    currentAngle = currentAngle + (targetAngle - currentAngle) * self.angleApproachFactor
  else
    if (waterFactor> self.minWaterFactorToFloat) then
      if (currentAngle~=sinkAngle) then

        currentAngle = currentAngle + (sinkAngle - currentAngle) * self.angleApproachFactor

        local lerpFactor=math.cos(currentAngle)
        local finalBuoyancy=(self.maxBuoyancy * lerpFactor) + (self.sinkingBuoyancy* (1.0-lerpFactor))
        mcontroller.applyParameters({ liquidBuoyancy=finalBuoyancy,
                                      liquidFriction=self.sinkingFriction,
                                      frictionEnabled=true})
      end
      animator.setParticleEmitterActive("bubbles", true)
    end
  end

  return currentAngle
end

function updateFloating(waterFactor, moving, facing)
  local floating = waterFactor > self.minWaterFactorToFloat

  local targetAngle=0

  if (floating) then
    self.rockingTimer = self.rockingTimer + script.updateDt()
    if self.rockingTimer > self.rockingInterval then
--      self.rockingTImer = self.rockingTimer - self.rockingInterval
      self.rockingTimer = self.rockingTimer - self.rockingInterval--lpk:bugfix:misCAP TImer->Timer
    end

    local speedAngle = mcontroller.xVelocity() * self.speedRotationMultiplier

    local windPosition = vec2.add(mcontroller.position(), self.windLevelOffset)
    local windLevel = world.windLevel(windPosition)
--    local windMaxAngle = self.rockingWindAngleMultiplier * windLevel
    local windMaxAngle = math.max(self.rockingWindAngleMultiplier * windLevel, self.maxRockingAngle)--lpk:add:gently rock in no wind
    local windAngle= windMaxAngle * (math.sin(self.rockingTimer / self.rockingInterval * (math.pi * 2)))

--    targetAngle = windMaxAngle + speedAngle
    targetAngle = windAngle + speedAngle--lpk:bugfix:wrong wind angle parameter
  else
    targetAngle=calcGroundCollisionAngle(self.waterBounds[2]) --pass in the water surtface
  end

  self.angle = self.angle + (targetAngle - self.angle) * self.angleApproachFactor

    
  if waterFactor > (self.waterFactor + self.splashEpsilon) then
    local floatingLiquid=mcontroller.liquidId()

    if (floatingLiquid>0 and  floatingLiquid<=#self.splashParticleNames) then
      local splashEmitter=self.splashParticleNames[floatingLiquid]

      animator.setParticleEmitterOffsetRegion(splashEmitter,self.waterBounds)

      animator.burstParticleEmitter(splashEmitter)
    end
  end
  return floating
end



function updateMovingEffects(floating,moving)
  if moving then
    animator.setAnimationState("propeller", "turning")

    if floating then
      local floatingLiquid=mcontroller.liquidId()

      if (floatingLiquid>0 and  floatingLiquid<=#self.bowWaveParticleNames) then
        local bowWaveEmitter=self.bowWaveParticleNames[floatingLiquid]

        local rateFactor=math.abs(mcontroller.xVelocity())/self.targetMoveSpeed
        rateFactor=rateFactor * self.bowWaveMaxEmissionRate     
        animator.setParticleEmitterEmissionRate(bowWaveEmitter, rateFactor)

        local bowWaveBounds=self.waterBounds
--        bowWaveBounds[3]=bowWaveBounds[1]-0.5
        animator.setParticleEmitterOffsetRegion(bowWaveEmitter,bowWaveBounds)

        animator.setParticleEmitterActive(bowWaveEmitter, true)        
      end
    end

  else
    animator.setAnimationState("propeller", "still")
    for i, emitter in ipairs(self.bowWaveParticleNames) do
       animator.setParticleEmitterActive(emitter, false)
    end
  end
end



--make the driver emote according to the damage state of the vehicle
function updatePassengers(healthFactor)
  if healthFactor >= 0 then
    --if we have a scared face on becasue of taking damage
    if self.damageEmoteTimer > 0 then
      self.damageEmoteTimer = self.damageEmoteTimer - script.updateDt()
      if (self.damageEmoteTimer < 0) then
        maxDamageState = #self.damageStateDriverEmotes
        damageStateIndex = maxDamageState
        damageStateIndex = (maxDamageState - math.ceil(healthFactor * maxDamageState))+1
        vehicle.setLoungeEmote("drivingSeat",self.damageStateDriverEmotes[damageStateIndex])
      end
    end
  end
end


function applyDamage(damageRequest)
  local damage = 0
  if damageRequest.damageType == "Damage" then
    damage = damage + root.evalFunction2("protection", damageRequest.damage, self.protection)
  elseif damageRequest.damageType == "IgnoresDef" then
    damage = damage + damageRequest.damage
  else
    return
  end

  updateDamageEffects(damage, false)
  storage.health = storage.health - damage

  return {{
    sourceEntityId = damageRequest.sourceEntityId,
    targetEntityId = entity.id(),
    position = mcontroller.position(),
    damage = damage,
    hitType = "Hit",
    damageSourceKind = damageRequest.damageSourceKind,
    targetMaterialKind = self.materialKind,
    killed = storage.health <= 0
  }}
end

function setDamageEmotes()
  local damageTakenEmote=vehicle.configParameter("damageTakenEmote")
  self.damageEmoteTimer=vehicle.configParameter("damageEmoteTime")
  vehicle.setLoungeEmote("drivingSeat",damageTakenEmote)
end


function updateDamageEffects(damage, initialise)
  local maxDamageState = #self.damageStateNames
  local healthFactor = (storage.health-damage) / self.maxHealth
  local prevhealthFactor = storage.health / self.maxHealth

  local prevDamageStateIndex =util.clamp( maxDamageState - math.ceil(prevhealthFactor * maxDamageState)+1, 1, maxDamageState)
  self.damageStateIndex =util.clamp( maxDamageState - math.ceil(healthFactor * maxDamageState)+1, 1, maxDamageState)

  if ((self.damageStateIndex > prevDamageStateIndex) or initialise==true) then
    animator.setGlobalTag("damageState", self.damageStateNames[self.damageStateIndex])

    --change the floatation
    local settingsNameList=vehicle.configParameter("damageMovementSettingNames")
    local settingsObject = vehicle.configParameter(settingsNameList[self.damageStateIndex])

    --self.maxBuoyancy =mcontroller.parameters.liquidBuoyancy()
    self.maxBuoyancy = 1

    mcontroller.applyParameters(settingsObject)
  end

  if (self.damageStateIndex > prevDamageStateIndex) then
     --people in the vehicle change thier faces when the vehicle is damaged.
    setDamageEmotes(healthFactor)

    --burstparticles.
    animator.burstParticleEmitter("damageShards")
    animator.playSound("changeDamageState")
  end
end

function calcGroundCollisionAngle(waterSurface)

  local frontDistance = math.min(distanceToGround(self.frontGroundTestPoint),waterSurface)
  local backDistance = math.min(distanceToGround(self.backGroundTestPoint),waterSurface)


--   world.debugText(string.format("front=%s, back=%s",frontDistance,backDistance),mcontroller.position(),"yellow")


  if frontDistance == self.maxGroundSearchDistance and backDistance == self.maxGroundSearchDistance then
      return 0
  else
    local groundAngle=-math.atan(backDistance - frontDistance) 

    return groundAngle
  end
end

function distanceToGround(point)
  -- to worldspace
  point = vec2.rotate(point, self.angle)
  point = vec2.add(point, mcontroller.position())

  local endPoint = vec2.add(point, {0, -self.maxGroundSearchDistance})
  local intPoint = world.lineCollision(point, endPoint)

  if intPoint then
    world.debugPoint(intPoint, {255, 255, 0, 255})
    return point[2] - intPoint[2]
  else
    world.debugPoint(endPoint, {255, 0, 0, 255})
    return self.maxGroundSearchDistance
  end

end




