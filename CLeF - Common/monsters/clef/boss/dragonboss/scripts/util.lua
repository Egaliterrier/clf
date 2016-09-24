util = {}

--------------------------------------------------------------------------------
function util.blockSensorTest(sensorGroup, direction)
  local reverse = false
  if direction ~= nil then
    reverse = util.toDirection(direction) ~= mcontroller.facingDirection()
  end

  for i, sensor in ipairs(entity.configParameter(sensorGroup)) do
    if reverse then
      sensor[1] = -sensor[1]
    end

    if world.pointTileCollision(entity.toAbsolutePosition(sensor), {"Null", "Block", "Dynamic"}) then
      return true
    end
  end

  return false
end

--------------------------------------------------------------------------------
function util.toDirection(value)
  if value < 0 then
    return -1
  else
    return 1
  end
end

--------------------------------------------------------------------------------
function util.clamp(value, min, max)
  return math.max(min, math.min(value, max))
end

--------------------------------------------------------------------------------
function util.round(value)
  return math.floor(value + 0.5)
end

--------------------------------------------------------------------------------
function util.incWrap(value, max)
  if value >= max then
    return 1
  else
    return value + 1
  end
end

--------------------------------------------------------------------------------
function util.wrapAngle(angle)
  while angle >= 2 * math.pi do
    angle = angle - 2 * math.pi
  end

  while angle < 0 do
    angle = angle + 2 * math.pi
  end

  return angle
end

--------------------------------------------------------------------------------
function util.filter(table, predicate)
  local newTable = {}
  for _,value in ipairs(table) do
    if predicate(value) then
      newTable[#newTable+1] = value
    end
  end
  return newTable
end

--------------------------------------------------------------------------------
function util.trackTarget(distance, switchTargetDistance, keepInSight)
  local targetIdWas = self.targetId

  if self.targetId == nil then
    self.targetId = entity.closestValidTarget(distance)
  end

  if switchTargetDistance ~= nil then
    -- Switch to a much closer target if there is one
    local targetId = entity.closestValidTarget(switchTargetDistance)
    if targetId ~= 0 and targetId ~= self.targetId then
      self.targetId = targetId
    end
  end

  util.trackExistingTarget(keepInSight)

  return self.targetId ~= targetIdWas and self.targetId ~= nil
end

--------------------------------------------------------------------------------
function util.trackExistingTarget(keepInSight)
  if keepInSight == nil then keepInSight = true end

  -- Lose track of the target if they hide (but their last position is retained)
  if self.targetId ~= nil and keepInSight and not entity.entityInSight(self.targetId) then
    self.targetId = nil
  end

  if self.targetId ~= nil then
    self.targetPosition = world.entityPosition(self.targetId)
  end
end

--------------------------------------------------------------------------------
function util.easeInOutQuad(ratio, initial, delta)
  ratio = ratio * 2
  if ratio < 1 then
    return delta / 2 * ratio^2 + initial
  else
    return -delta / 2 * ((ratio - 1) * (ratio - 3) - 1) + initial
  end
end

--------------------------------------------------------------------------------
function util.randomDirection()
  return util.toDirection(math.random(0, 1) - 0.5)
end

--------------------------------------------------------------------------------
-- Useful in coroutines to wait for the given duration, optionally performing
-- some action each update
function util.wait(duration, action)
  local timer = duration
  local dt = script.updateDt()
  while timer > 0 do
    if action ~= nil and action(dt) then return end
    timer = timer - dt
    coroutine.yield(false)
  end
end

--------------------------------------------------------------------------------
function util.hashString(str)
  -- FNV-1a algorithm. Simple and fast.
  local hash = 2166136261
  for i = 1, #str do
    hash = hash ~ str:byte(i)
    hash = (hash * 16777619) & 0xffffffff
  end
  return hash
end

--------------------------------------------------------------------------------
function util.isTimeInRange(time, range)
  if range[1] < range[2] then
    return time >= range[1] and time <= range[2]
  else
    return time >= range[1] or time <= range[2]
  end
end

--------------------------------------------------------------------------------
--get the firing angle to hit a target offset with a ballistic projectile
function util.aimVector(targetVector, v, gravityMultiplier, useHighArc)
  local x = targetVector[1]
  local y = targetVector[2]
  local g = gravityMultiplier * world.gravity(mcontroller.position())
  local reverseGravity = false
  if g < 0 then
    reverseGravity = true
    g = -g
    y = -y
  end

  local term1 = v^4 - (g * ((g * x * x) + (2 * y * v * v)))

  if term1 >= 0 then
    local term2 = math.sqrt(term1)
    local divisor = g * x
    local aimAngle = 0

    if divisor ~= 0 then
      if useHighArc then
        aimAngle = math.atan(v * v + term2, divisor)
      else
        aimAngle = math.atan(v * v - term2, divisor)
      end
    end

    if reverseGravity then
      aimAngle = -aimAngle
    end

    return {v * math.cos(aimAngle), v * math.sin(aimAngle)}, true
  else
    --if out of range, normalize to 45 degree angle
    return {(targetVector[1] > 0 and v or -v) * math.cos(math.pi / 4), v * math.sin(math.pi / 4)}, false
  end
end


function util.weightedRandom(options, seed)
  if seed then
    math.randomseed(seed)
  end

  local totalWeight = 0
  for _,pair in ipairs(options) do
    totalWeight = totalWeight + pair[1]
  end

  local choice = math.random() * totalWeight
  for _,pair in ipairs(options) do
    choice = choice - pair[1]
    if choice < 0 then
      return pair[2]
    end
  end
  return nil
end

function parseArgs(args, defaults)
  local parsed = {}
  for k,v in pairs(args) do
    parsed[k] = v
  end
  for k,v in pairs(defaults) do
    if parsed[k] == nil then
      parsed[k] = v
    end
  end
  return parsed
end

function extend(base)
  return {
    __index = function(t,k)
      local raw = rawget(t,k)
      if raw == nil then
        return base[k]
      else
        return raw
      end
    end
  }
end

-- Debug functions
function util.debugPoint(...) return self.debug and world.debugPoint(...) end
function util.debugLine(...) return self.debug and world.debugLine(...) end
function util.debugText(...) return self.debug and world.debugText(...) end
function util.debugLog(...) return self.debug and world.logInfo(...) end
function util.debugRect(rect, color)
  if self.debug then
    world.debugLine({rect[1], rect[2]}, {rect[3], rect[2]}, color)
    world.debugLine({rect[3], rect[2]}, {rect[3], rect[4]}, color)
    world.debugLine({rect[3], rect[4]}, {rect[1], rect[4]}, color)
    world.debugLine({rect[1], rect[4]}, {rect[1], rect[2]}, color)
  end
end
function util.debugPoly(poly, color)
  if self.debug then
    local current = poly[1]
    for i = 2, #poly do
      world.debugLine(current, poly[i], "red")
      current = poly[i]
    end
    world.debugLine(current, poly[1], "red")
  end
end

--Table helpers
function copy(v)
  if type(v) ~= "table" then
    return v
  else
    local c = {}
    for k,v in pairs(v) do
      c[k] = copy(v)
    end
    return c
  end
end