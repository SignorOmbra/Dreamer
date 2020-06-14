--REQUIRE MODULES--
local Class = require("Libraries/Class")
local Effects = require("Effects")
local Charset = require("Libraries/Charset")



--FUNCTIONS FOR STUFF--
local function ToFontFolder(ImageName)
    return "Images/Font/" .. ImageName
end



--DEFINE VARIABLES--
local WindowX = love.graphics.getWidth()
local WindowY = love.graphics.getHeight()
local NumberOfStars = WindowX 

local LetterSizeX = 16
local LetterSizeY = 33

local Characters = "                                             HELLO! AND WELCOME TO MY AWFUL DEMO [DREAMER]... THREE YEARS AND I STILL CAN'T MAKE A DECENT DEMO ON ANY PLATFORM.              IT'S NOTHING SPECIAL, BUT I WROTE THE CODE MYSELF IN A DAY AND A HALF! DIDN'T USE ANYBODY ELSE'S LIBRARIES OR CODE FOR ONCE.              ANYWAYS, I THINK IT'S TIME FOR CREDITS BEFORE I GO ON ANY TANGENTS.     ----------     MUSIC - DREAMING > THIS SONG IS LOST MEDIA! IT WAS FOUND IN AN OLD SHOCKWAVE GAME THAT DIDN'T CREDIT THE ORIGINAL ARTIST AND CUT THE SONG TO SAVE FILE SIZE... TRULY A SHAME.     CHARSET - JOYRIDE > PHENOMENA MADE THIS AND I JUST GOT IT OFF OF KESTRA BITWORLD SINCE I COULDN'T BE BOTHERED TO MAKE ONE. [SORRY PHENOMENA!]     ----------     HOW ABOUT GREETINGS? ISN'T THAT MANDATORY FOR A SCROLLTEXT DEMO?     ----------     HERE THEY ARE <               SCENE PEOPLE - CRT, SHIFTY, NOM DE NOM, INVERSE PHASE, AND DR. CLAW.     NON SCENE PEOPLE - D3, SYL, SIR, AND BUNG.     ----------     LET'S GET TO RAMBLING! THIS DEMO WAS FUN TO MAKE, FOR MY FIRST PROPER PRODUCTION. I INITIALLY CHOSE THE SONG BECAUSE OF IT HAVING NO LICENSE AND THAT IT'S CATCHY, BUT IT REALLY FIT THE DEMO THE MORE I WORKED ON IT. >-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-<>-< GETTING AN ACA500 PLUS SOON, SO I AM OBVIOUSLY VERY EXCITED AND GETTING READY TO CODE FOR IT. DON'T REALLY HAVE MUCH ELSE TO SAY OTHER THAN ENJOY THE PARTY HERE ON SCENESAT, DISCORD, AND MOST IMPORTANTLY[?] IRC.                           COMPO TEAM, YOU MAY TURN OFF THE DEMO.                           WHAT ARE YOU WAITING FOR, TURN IT OFF!                           OKAY, I'M JUST GONNA GO NOW."

local ScrollerCountdown = 100
local ScrollAdd = 3
local ScrollOffset = 0

local LuaImage = love.graphics.newImage("Images/Lua-Logo.png")
local LuaLogoWidth, LuaLogoHeight = LuaImage:getDimensions()
local LuaLogoQuad = love.graphics.newQuad(0, 0, 512, 512, LuaImage:getDimensions())

local FontImage = love.graphics.newImage(ToFontFolder(Charset["A"]))
local FontWidth, FontHeight = FontImage:getDimensions()
local FontQuad = love.graphics.newQuad(0, 0, LetterSizeX, LetterSizeY, FontImage:getDimensions())



--DEFINE MAIN OBJECTS--
local Stars = {}
local FontLetters = {}

for i = 1, #Characters do
    FontLetters[i] = love.graphics.newImage(ToFontFolder(Charset[string.sub(Characters, i, i)]))
end


--DEFINE LOVE FUNCTIONS--
function love.load()
    love.window.setTitle("Dreamer")

    function love.keypressed(Key)
        if Key == "return" then
            Effects.Transparency = 0
        end
    end
end

function love.update(DeltaTime)
    if Effects.Transparency <= 0.1 then
        Stars = Effects:CreateStars(Stars, DeltaTime)
    end
end

function love.draw()
    if Effects.Transparency >= 0.01 then
        love.graphics.setColor(1, 1, 1, Effects.Transparency)
        love.graphics.draw(LuaImage, (WindowX - LuaLogoWidth) / 2, (WindowY - LuaLogoHeight) / 2)
        love.graphics.setColor(1, 1, 1)

        Effects:UpdateTransparency()
    else
        for i = 1, NumberOfStars do 
            Stars["Star" .. (i + NumberOfStars)]:Draw() -- Draws the object on screen.
        end

        for i = 1, #Characters do            
            love.graphics.draw(
                FontLetters[i],
                WindowX + (LetterSizeX * i) + ScrollOffset, 
                (WindowY - LetterSizeY) / 2
            )
        end

        print(ScrollOffset)
        ScrollOffset = ScrollOffset - ScrollAdd
    end
end

function love.quit()

end