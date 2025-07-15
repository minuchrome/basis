Camera = {}
Camera.ox = 0
Camera.oy = 0
Camera.tx = 0
Camera.ty = 0
Camera.x = 0
Camera.y = 0
Camera.dx = 0.1
Camera.dy = 0.1
Camera.s = {}
Camera.s.d = 0.1
Camera.s.x = 0
Camera.s.y = 0
Camera.s.dur = 0

function Camera:set(x, y)
    self.tx = x
    self.ty = y
end

function Camera:offset(x, y)
    self.ox = x
    self.oy = y
    self.x = self.ox-self.tx
    self.y = self.oy-self.ty
end

function Camera:shake(dur)
    self.s.dur = dur
end

function Camera:start()
    love.graphics.push()
    if self.s.dur > 0.1 then
        love.graphics.translate(self.s.x, self.s.y)
    end
    love.graphics.translate(self.x, self.y)
end

function Camera:stop()
    love.graphics.pop()
end

function Camera:update(dt)
    if self.s.dur > 0.1 then
        self.s.x = math.random(-self.s.dur, self.s.dur)
        self.s.y = math.random(-self.s.dur, self.s.dur)
    end
    self.s.dur = self.s.dur+(0-self.s.dur)*self.s.d*dt
    
    self.x = self.x+(self.ox+self.tx-self.x)*self.dx*dt
    self.y = self.y+(self.oy+self.ty-self.y)*self.dy*dt
end