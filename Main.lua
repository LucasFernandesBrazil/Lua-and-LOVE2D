require "Util"
local largura = love.graphics.getWidth()
local altura = love.graphics.getHeight()
local tam = 100

local world = Util:LoadMap("mapa.txt")

local world_config = {
  worldTamanho_x = 28,
  worldTamanho_y = 20,
  worldDisplay_x = 14, 
  worldDisplay_y = 10
}

local camera = {
  pos_x = 1,
  pos_y = 1,
  speed = 300
}


function love.load()
  love.window.setTitle("Game LF")
  imageBase = love.graphics.newImage("Image/Castel/sheet.png")
  love.mouse.setVisible ( false )  
  
  images = Util:LoadTiles(imageBase, 2, 2, tam) 
            
  
    personagem = {
      posX = 100,
      posY = altura/2,
      largura = 20,
      altura = 20,
      velocidadePulo = 0
    }
    gravidade = 400
    alturaPulo = 300
  end
  
function love.update (dt)
  
  if personagem.velocidadeP ~= 0 then
    personagem.posY = personagem.posY - personagem.velocidadePulo * dt
    personagem.velocidadePulo = personagem.velocidadePulo - gravidade * dt
    
    if personagem.posY > altura / 2 then
      personagem.velocidadePulo = 0
      personagem.posY = altura / 2
    end
  end
  
  
  if love.keyboard.isDown('right') then
    personagem.posX = personagem.posX + 100 * dt
  end
  if love.keyboard.isDown('left') then
    personagem.posX = personagem.posX - 100 * dt
  end
end

function love.draw()
  offset_x = math.floor(camera.pos_x % tam)
  first_tile_x = math.floor(camera.pos_x / tam)
  
    for y=1, world_config.worldDisplay_y , 1 do
    for x=1, world_config.worldDisplay_x , 1 do
      if (world[y][first_tile_x + x] == "G") then
        love.graphics.draw(imageBase, images [1], ((x - 1)  * tam) - offset_x, ((y-1)* tam))
      elseif (world[y][first_tile_x + x]== "T") then
        love.graphics.draw(imageBase, images [4], ((x - 1)  * tam) - offset_x, ((y-1)* tam))
      elseif (world[y][first_tile_x + x] == "A") then
        love.graphics.draw(imageBase, images [7], ((x - 1)  * tam) - offset_x, ((y-1)* tam))
      elseif(world[y][first_tile_x + x] == "P") then
        love.graphics.draw(imageBase, images [8], ((x - 1)  * tam) - offset_x, ((y-1)* tam))
      elseif (world[y][first_tile_x + x] == "B") then
        love.graphics.draw(imageBase, images [6], ((x - 1)  * tam) - offset_x, ((y-1)* tam))
      end
    end
  end
end


function love.keypressed(key)
  if key == "space" then
    if personagem.velocidadePulo == 0 then
      personagem.velocidadePulo = alturaPulo
      end
  end
  end
