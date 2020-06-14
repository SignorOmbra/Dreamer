local Effects = {}

local Class = require("Libraries/Class")

local WindowX = love.graphics.getWidth()
local WindowY = love.graphics.getHeight()

Effects.NumberOfStars = WindowX
Effects.StarPixelOffset = WindowX / 5.4
Effects.CurrentPixelBetweenStar = Effects.StarPixelOffset
Effects.Transparency = 4

local FirstTime = true
local RandomMax = 1
local Music = love.audio.newSource("Music/Dreaming.mp3", "stream")
local MusicPlaying = false



function Effects:CreateStars(Stars, DeltaTime)
    if not FirstTime then
        for i = 1, Effects.NumberOfStars do
            if Stars["Star" .. (i + Effects.NumberOfStars)].Speed.X >= 0 then
                Stars["Star" .. (i + Effects.NumberOfStars)].Speed.X = Stars["Star" .. (i + Effects.NumberOfStars)].Speed.X - 0.8
            elseif Stars["Star" .. (i + Effects.NumberOfStars)].Speed.X < 0 and i == Effects.NumberOfStars then
                Stars["Star" .. (i + Effects.NumberOfStars)].Speed.X = 0
                
                if not MusicPlaying then
                    Music:setLooping(true)
                    love.audio.play(Music)
                    MusicPlaying = true
                end
            end
        end
    end

    if Effects.CurrentPixelBetweenStar >= Effects.StarPixelOffset then
        if FirstTime == true then
            for i = 1, Effects.NumberOfStars do 
                Stars["Star" .. (i + Effects.NumberOfStars)] = Class:CreateObject(
                    -10, -- Position X
                    love.math.random((WindowY + 10), 0), -- Position Y
                    1, -- Size X
                    1, -- Size Y
                    false, -- Is circle
                    love.math.random(300, 10), -- Speed X
                    0 -- Speed Y
                )
            end
        end

        FirstTime = false
        Effects.CurrentPixelBetweenStar = 0
    end

    for i = 1, Effects.NumberOfStars do 
        if Stars["Star" .. (i + Effects.NumberOfStars)] then
            Stars["Star" .. (i + Effects.NumberOfStars)]:Update(DeltaTime) -- Updates position based on speed.
        end
    end

    Effects.CurrentPixelBetweenStar = Effects.CurrentPixelBetweenStar + 1

    return Stars
end


function Effects:UpdateTransparency()
    if Effects.Transparency >= 0.01 then
        Effects.Transparency = Effects.Transparency - 0.01
    end
end

return Effects