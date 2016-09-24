throwPoAttack = {}

function throwPoAttack.enter()
  if not hasTarget() or not canStartSkill("throwPoAttack") then return nil end

  if self.minions == nil then self.minions = {} end

  for i = #self.minions, 1, -1 do
    if not world.entityExists(self.minions[i]) then
      table.remove(self.minions, i)
    end
  end

  if #self.minions < entity.configParameter("throwPoAttack.maxMinions") then
    return {
      minionIndex = #self.minions+1,
      timer = entity.configParameter("throwPoAttack.startTime")
    }
  end

  return nil
end

function throwPoAttack.update(dt, stateData)
  if not hasTarget() then return true end

  local position = mcontroller.position()
  local toTarget = world.distance(world.entityPosition(self.target), position)
  mcontroller.controlFace(toTarget[1])

  entity.setAnimationState("attack", "melee")

  stateData.timer = stateData.timer - dt

  if stateData.timer <= 0 then
    if stateData.thrown then
      return true, entity.configParameter("throwPoAttack.cooldown")
    else
      local entityId = world.spawnMonster("micropo", entity.toAbsolutePosition(entity.configParameter("projectileSourcePosition")), {level = entity.level()})
      world.callScriptedEntity(entityId, "setSpawnDirection", mcontroller.facingDirection())
      self.minions[stateData.minionIndex] = entityId

      stateData.thrown = true
      stateData.timer = entity.configParameter("throwPoAttack.endTime")
    end
  end

  return false
end
