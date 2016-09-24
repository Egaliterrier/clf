flameThrowerAttack = {}

--allow force entering state without canStartSkill
function flameThrowerAttack.enterWith(args)
  if not args.flameThrowerAttack then return nil end

  return { 
    didAttack = false, 
    wasInRange = false,
    windupTimer = entity.configParameter("flameThrowerAttack.windupTime"),
    winddownTimer = entity.configParameter("flameThrowerAttack.windDownTime"),
    fireTimer = 0,
    shots = 0
  }
end

function flameThrowerAttack.enter()
  if not canStartSkill("flameThrowerAttack") then return nil end

  return { 
    didAttack = false, 
    wasInRange = false,
    windupTimer = entity.configParameter("flameThrowerAttack.windupTime"),
    winddownTimer = entity.configParameter("flameThrowerAttack.winddownTime"),
    fireTimer = 0,
    shots = 0
  }
end

function flameThrowerAttack.enteringState(stateData)
  setAggressive(true, false)
  entity.setAnimationState("attack", "melee")

  stateData.projectileSourcePosition = {
      entity.configParameter("projectileSourcePosition", {0, 0})[1],
      entity.configParameter("projectileSourcePosition", {0, 0})[2]
    }

  entity.setActiveSkillName("flameThrowerAttack")
end

function flameThrowerAttack.update(dt, stateData)
  if not canContinueSkill() or not hasTarget() then return true end

  local targetPosition = world.entityPosition(self.target)
  local toTarget = world.distance(targetPosition, mcontroller.position())

  local projectileName = entity.configParameter("flameThrowerAttack.projectile")
  local power = root.evalFunction("monsterLevelPowerMultiplier", entity.level()) * entity.configParameter("flameThrowerAttack.power")

  entity.setAnimationState("movement", "idle")

  --First wind up
  if stateData.windupTimer >= 0 then
    if stateData.windupTimer == entity.configParameter("flameThrowerAttack.windupTime") then
      entity.setAnimationState("attack", "windup")
    end

    stateData.windupTimer = stateData.windupTimer - dt
  --Then fire all projectiles
  elseif stateData.shots < entity.configParameter("flameThrowerAttack.shots") then
    if stateData.fireTimer <= 0 then
      world.spawnProjectile(projectileName, entity.toAbsolutePosition(stateData.projectileSourcePosition), entity.id(), {mcontroller.facingDirection(), 0}, false, {power = power})
      stateData.shots = stateData.shots + 1
      stateData.fireTimer = stateData.fireTimer + entity.configParameter("flameThrowerAttack.fireInterval")
    end

    stateData.fireTimer = stateData.fireTimer - dt
  --Then wind down
  elseif stateData.winddownTimer >= 0 then
    if stateData.winddownTimer == entity.configParameter("flameThrowerAttack.winddownTime") then
      entity.setAnimationState("attack", "winddown")
    end

    stateData.winddownTimer = stateData.winddownTimer - dt
  --Then done
  else
    return true, entity.configParameter("flameThrowerAttack.cooldownTime")
  end

  return false
end

function flameThrowerAttack.leavingState(stateData)
  
end
