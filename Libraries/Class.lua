local ClassesLibrary = {}

function ClassesLibrary:CreateObject(PositionX, PositionY, SizeX, SizeY, IsCircle, SpeedX, SpeedY)
    local Object = {}

    if PositionX then
        Object.Position = {}
        Object.Position.X = PositionX

        if PositionY then
            Object.Position.Y = PositionY
        end
    else
        return nil
    end

    if SizeX then
        Object.Size = {}
        Object.Size.X = SizeX

        if PositionY then
            Object.Size.Y = SizeY

            if not SpeedX then
                return Object
            end
        end
    else
         return Object
    end

    if IsCircle then
        function Object:Draw()
            love.graphics.circle(
                "line",
                Object.Position.X,
                Object.Position.Y,
                10,
                16
            )
        end
    elseif IsCircle == false then
        function Object:Draw()
            love.graphics.rectangle(
                "line",
                Object.Position.X,
                Object.Position.Y,
                Object.Size.X,
                Object.Size.Y
            )
        end
    end

    if not SpeedX then
        return Object
    end

    if SpeedX then
        Object.Speed = {}
        Object.Speed.X = SpeedX

        if SpeedY then
            Object.Speed.Y = SpeedY

            function Object:Update(DeltaTime)
                Object.Position.X = Object.Position.X + Object.Speed.X * DeltaTime
                Object.Position.Y = Object.Position.Y + Object.Speed.Y * DeltaTime
            end

            return Object
        end
    else
         return Object
    end
end

function ClassesLibrary:CreateImageObject(Image, Quad, Orientation, ScaleX, ScaleY, OffsetX, OffsetY)
    local Object = {}
    
    if Image and Quad then
        Object.Image = Image
        Object.Quad = Quad
    else
        return nil
    end

    if Orientation then
        Object.Orientation = Orientation
    else
        return Object
    end

    if ScaleX then
        Object.Scale = {}
        Object.Scale.X = ScaleX

        if PositionY then
            Object.Scale.Y = ScaleY

            if not OffsetX then
                return Object
            end
        end
    else
         return Object
    end

    if OffsetX then
        Object.Offset = {}
        Object.Offset.X = OffsetX

        if OffsetY then
            Object.Offset.Y = OffsetY
        end
    else
         return Object
    end

    function Object:Draw()
        love.graphics.draw(
            Image,
            Quad,
            Object.Scale.X,
            Object.Scale.Y,
            Orientation
          )
    end

    return Object
end

return ClassesLibrary