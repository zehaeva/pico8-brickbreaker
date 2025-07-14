
bricks = { }
brick  = { }
paddle = { }
balls  = { }
ball   = { }

function brick:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.x = x
  self.y = y
  self.width = 8
  self.height = 4
  self.sprite = sprite or 1
  return o
end

function paddle:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.x = x
  self.y = y
  self.width = 12
  self.height = 4
  self.sprite = sprite or 2
  return o
end

function ball:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.x = x
  self.y = y
  self.vx = vx or 0
  self.vy = vy or 0
  self.width = 2
  self.height = 2
  self.sprite = sprite or 0
  return o
end

function collision(a, b)
  -- classic collision algo
  if (a.x) <= (b.x + b.width) and (a.x + a.width) >= b.x and (a.y) <= (b.y + b.height) and (a.y + a.height) >= b.y then
    return true
  else
    return false
  end
end
  
function _init()
  startx = 12
  starty = 10
  width = 8
  height = 4
  for i=0, 11 do
    for j=0, 10 do
	  add(bricks, brick:new{x=(i * (width + 1)) + startx, y=(j * (height + 1)) + starty, sprite=1})
	end
  end
  
  paddle = paddle:new{x = 58, y = 120, sprite = 2}
  
  add(balls, ball:new{x = 63, y = 117})
end

function _update()
  -- player inputs
  if btn(0) and paddle.x > 0 then 
    paddle.x = paddle.x - 1 
  end
  if btn(1) and paddle.x <= 120 then 
    paddle.x = paddle.x + 1 
  end
  
  for a in balls do
    -- if the ball hits a paddle send the ball back
    if collision(paddle, a) then
	  a.vx = a.vx * -1
	  a.vy = 
	end
	
	-- if the ball hits a block destroy it and reflect it
	for b in all(bricks) do
	  if collision(a, b) then
	  end
	end
  end
end

function _draw()
  -- clear screen
  cls(0)
  
  spr(paddle.sprite, paddle.x, paddle.y, 2, 1)
  
  for a in all(balls) do
    spr(a.sprite, a.x, a.y)
  end  
  
  for a in all(bricks) do
    spr(a.sprite, a.x, a.y)
  end
end
