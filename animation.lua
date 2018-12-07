local anim = require 'anim8'
local imagem, animation 

local posX = 50
local direcao = true

function love.load()
	imagem = love.graphics.newImage("imagem/sprite.png")
	local g = anim.newGrid(180, 247, imagem:getWidth(),imagem:getHeight() )
	animation = anim.newAnimation( g('1-5', 1, '1-5', 2), 0.09)
end
function love.update( dt )
	if love.keyboard.isDown('left') then
		posX = posX - 150 * dt
		direcao = false
		animation:update( dt )
	end
	if love.keyboard.isDown('right') then
		posX = posX + 150 * dt
		direcao = true
		animation:update( dt )
	end 
end

function love.draw()
	love.graphics.setBackgroundColor(255,255,255)
	if direcao then
		animation:draw(imagem,posX,50,0,1,1,123.5,0)
	elseif not direcao then
		animation:draw(imagem, posX, 50,0,-1,1,123.5,0)
	end
end