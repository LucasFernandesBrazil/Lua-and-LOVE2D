Util = {}

function Util:new()
  local obj = {}
  
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Util:LoadMap(filename)  
  local mapa = {}
  local file = io.open(filename)
  local i = 1
  
  for line in file:lines() do
    mapa[i] = {}
    for j=1, #line, 1 do
      mapa[i][j] = line:sub(j,j)
    end
    i = i + 1
  end
  
  file:close()
  
  return mapa
end

function Util:LoadTiles(image, nx, ny, quadroTam)
  local count = 1
  local tileQuads = {}
  
  for i = 0, nx, 1 do
    for j = 0, ny, 1 do
      tileQuads[count] = love.graphics.newQuad(i * quadroTam , j * quadroTam, quadroTam, quadroTam,
                                          image:getWidth(), image:getHeight())
      count = count + 1
    end
  end
  
  return tileQuads
end