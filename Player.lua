Player = {}

function Player:new(x,y,jump,jump_time, errorX, errorY)
  local obj = {
      px = x,
      py = y,
      pulando = jump,
      pulando_tempo = jump_time,
      erro_x = errorX,
      erro_y= errorY
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end
--
function Player:MoveX(x)
  self.px = self.px + x
end

function Player:MoveY(y)
  self.py = self.py + y
end

function Player:GetX()
  return self.px
end

function Player:GetY()
  return self.py
end

function Player:GetWidth()
  return self.width
end

function Player:GetHeight()
  return self.height
end

function Player:IsCollided()
  return self.collided
end

function Player:SetCollided(vNewValue)
  self.collided = vNewValue
end