require "Util"

local largura = love.graphics.getWidth()
local altura = love.graphics.getHeight()

local audioPulo
local audioFundo
local tam = 32 
local world = Util:LoadMap("mapaPlataforma.txt")
local images = {}
local imagemBase
local chao = 504

local world_config = {
  worldTamanho_x = 44,
  worldTamanho_y = 24,
  worldDisplay_x = 14, 
  worldDisplay_y = 10
}

local camera = {
  pos_x = 1,
  pos_y = 1,
  speed = 3
}


local personagem = {
      posX = camera.pos_x + 300,
      posY = 1,
      altura = 20,
      largura = 20,
      velocidadePulo = 0,
      alturaPulo = 300,
      gravidade = 400,
      pulando = false,
      colisao = false
}
    
    
function Colisao (x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end


--function capituraChao () 
  --for i=1, 19, 1 do
    --for j=1, 45, 1 do
    --if(world[math.floor(camera.pos_x/32)][i] == "P") then
      --return math.floor((i * tam) - tam)
    
  --else
    --return 600
  --end
--end
--end



function love.load()
  love.window.setTitle("Game LF")
  imageBase = love.graphics.newImage("Image/platformertiles.png")
  love.mouse.setVisible ( false )  
  
  images = Util:LoadTiles(imageBase, 8, 3 ,tam) 
  
  audioFundo = love.audio.newSource
  colisãoBaixo = false;
  colisãoCima = false;
  colisãoDireita = false;
  colisãoEsquerda = false;
  audioFundo = love.audio.newSource("Sound/found.mp3", "static")
  audioPulo = love.audio.newSource("Sound/Jump.mp3", "static")
  end
  
function love.update (dt)
  

  
  if personagem.velocidadeP ~= 0 then
    personagem.posY = personagem.posY - personagem.velocidadePulo * dt
    personagem.velocidadePulo = personagem.velocidadePulo - personagem.gravidade * dt
  end
  
  if personagem.posY > chao then
      personagem.velocidadePulo = 0
      personagem.pulando=false
    end
    
  
  if love.keyboard.isDown('right') then
    if camera.pos_x > -1599 then
    camera.pos_x = camera.pos_x - camera.speed
    end
    --personagem.posX = personagem.posX + 100 * dt
  end
  if love.keyboard.isDown('left') then
    --personagem.posX = personagem.posX - 100 * dt
     if camera.pos_x < 0 then
    camera.pos_x = camera.pos_x + camera.speed
   end
  end
end

function love.draw()
  --love.graphics.draw(imageBase, images [1], 20 , 1) --Quina pedra esquerda
  --love.graphics.draw(imageBase, images [2], 60 , 1) --  Lateral esquerda parede pedra
  --love.graphics.draw(imageBase, images [3], 100 , 1) -- Quina para baixo esquerda
  --love.graphics.draw(imageBase, images [4], 140 , 1) -- nada
  --love.graphics.draw(imageBase, images [5], 180 , 1) -- Chão pedra
  --love.graphics.draw(imageBase, images [6], 20 , 40) -- Interior pedra (cor solida)
  --love.graphics.draw(imageBase, images [7], 60 , 40) -- Teto pedra
  --love.graphics.draw(imageBase, images [8], 100 , 40) --  Nada
  --love.graphics.draw(imageBase, images [9], 140 , 40) -- Quina pedra direita superior
  --love.graphics.draw(imageBase, images [10], 180 , 40) -- Parede pedra direita
  --love.graphics.draw(imageBase, images [11], 20 , 80) -- Quina pedra inferior direita
  --love.graphics.draw(imageBase, images [12], 60 , 80) -- Nada
  --love.graphics.draw(imageBase, images [13], 100 , 80) -- Lua
  --love.graphics.draw(imageBase, images [14], 140 , 80) -- Azul sólido
  --love.graphics.draw(imageBase, images [15], 180 , 80) -- Terra chão
  --love.graphics.draw(imageBase, images [16], 20 , 120) -- Nada
  --love.graphics.draw(imageBase, images [17], 60 , 120) -- Pico pedra superior
  --love.graphics.draw(imageBase, images [18], 100 , 120) -- Pico pedra meio
  --love.graphics.draw(imageBase, images [19], 140 , 120) -- Pico pedra inferior
  --love.graphics.draw(imageBase, images [20], 180 , 120) -- Nada
  --love.graphics.draw(imageBase, images [21], 20 , 160) -- Chão estranho
  --love.graphics.draw(imageBase, images [22], 60 , 160) -- Estrelas 1
  --love.graphics.draw(imageBase, images [23], 100 , 160) -- Grama
  --love.graphics.draw(imageBase, images [24], 140 , 160) -- Nada
  --love.graphics.draw(imageBase, images [25], 180 , 160) -- Chão diferente pedras
  --love.graphics.draw(imageBase, images [26], 180 , 200) -- Grama pequena
  --love.graphics.draw(imageBase, images [27], 20 , 200) -- Nada
  --love.graphics.draw(imageBase, images [28], 60 , 200) -- Chão diferente
  --love.graphics.draw(imageBase, images [29], 100 , 200) -- Estrelas 3
  --love.graphics.draw(imageBase, images [30], 140 , 200) -- Estrelas 2
  --love.graphics.draw(imageBase, images [31], 180 , 240)
  --love.graphics.draw(imageBase, images [32], 20 , 240) 
  --love.graphics.draw(imageBase, images [33], 60 , 240)
  --love.graphics.draw(imageBase, images [34], 100 , 240) 
  --love.graphics.draw(imageBase, images [35], 140 , 240) 
  
  
  for i=1, 19, 1 do
    for j=1, 45, 1 do
      if (world[i][j] == "G") then -- Grama
        love.graphics.draw(imageBase, images [14], ((j * tam)-tam) + camera.pos_x, (i * tam) - tam)
        love.graphics.draw(imageBase, images [23], ((j * tam)-tam) + camera.pos_x, (i * tam) - tam)
        
      elseif (world[i][j] == "A") then --Céu
        love.graphics.draw(imageBase, images [14], ((j * tam)-tam) + camera.pos_x, (i * tam) - tam)
      elseif(world[i][j] == "P") then --Chão Pedra
        boxChao = love.graphics.rectangle("fill", ((j * tam)-tam) + camera.pos_x, (i * tam) - tam, 32, 32)
        love.graphics.draw(imageBase, images [5],  ((j * tam)-tam) + camera.pos_x, (i * tam) - tam)
      elseif(world[i][j] == "I") then --Pico Superior
        boxParede = love.graphics.rectangle("fill", ((j * tam)-tam) + camera.pos_x, (i * tam) - tam, 32, 32)
        love.graphics.draw(imageBase, images [14], ((j * tam)-tam) + camera.pos_x, (i * tam) - tam)
        love.graphics.draw(imageBase, images [17],  ((j * tam)-tam) + camera.pos_x, (i * tam) - tam)
      elseif(world[i][j] == "K") then --Corpo pico
        boxParede = love.graphics.rectangle("fill", ((j * tam)-tam) + camera.pos_x, (i * tam) - tam, 32, 32)
        love.graphics.draw(imageBase, images [14], ((j * tam)-tam) + camera.pos_x, (i * tam) - tam)
        love.graphics.draw(imageBase, images [18],  ((j * tam)-tam) + camera.pos_x, (i * tam) - tam)
      elseif(world[i][j] == "L") then --Intero Chão
        love.graphics.rectangle("fill", ((j * tam)-tam) + camera.pos_x, (i * tam) - tam, 32, 32)
        love.graphics.draw(imageBase, images [6],  ((j * tam)-tam) + camera.pos_x, (i * tam) - tam)
      elseif(world[i][j] == "T") then --Terra
        love.graphics.rectangle("fill", ((j * tam)-tam) + camera.pos_x, (i * tam) - tam, 32, 32)
        love.graphics.draw(imageBase, images [15],  ((j * tam)-tam) + camera.pos_x, (i * tam) - tam)
      end
    end
  end
  love.graphics.rectangle("fill", personagem.posX, personagem.posY, 24, -24)
end

function love.keypressed(key)
  if key == "space" then
    if personagem.velocidadePulo == 0 then
      personagem.velocidadePulo = personagem.alturaPulo
    end
  end
end
