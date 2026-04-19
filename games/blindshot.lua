local cloneref = cloneref or function(obj)
	return obj
end

local Services = setmetatable({}, {
	__index = function(self, obj)
		return cloneref(game:GetService(obj))
	end
})

local RunService = Services.RunService
local Players = Services.Players
local lplr = Players.LocalPlayer

local function downloadFile(file)
    url = file:gsub('koolaid/', '')
    if not isfile(file) then
        writefile(file, game:HttpGet('https://raw.githubusercontent.com/matchaonmydih/koolxtras/'..readfile('koolaid/commit.txt')..'/'..url))
    end

    repeat task.wait() until isfile(file)
    return readfile(file)
end

local Library = shared.Library

local Execution = loadstring(downloadFile('koolaid/libraries/Execution.lua'))()
local Raycast = loadstring(downloadFile('koolaid/libraries/raycast.lua'))()
local Entity = loadstring(downloadFile('koolaid/libraries/entity.lua'))()

do
    Execution:Send()
end

-- Combat
do
    local AntiHit, HitConn
    AntiHit = Library.Tabs.Combat:CreateModule({
        Name = 'AntiHit',
        Function = function(callback)
            if callback then
                HitConn = Library.Signal:newconn(RunService.Heartbeat, function()
                    lplr.Character.Humanoid.HipHeight = -2
                end)
            else
				if HitConn then
					HitConn:Disconnect()
				end
                lplr.Character.Humanoid.HipHeight = 0
            end
        end
    })
end

do
    local Velocity
    Velocity = Library.Tabs.Combat:CreateModule({
        Name = 'Velocity',
        Function = function(callback)
            if callback then
                repeat
                    if Entity.isAlive(lplr) then
                        if lplr.Character.Humanoid.PlatformStand then
                            lplr.Character.Humanoid.Velocity = Vector3.new(lplr.Character.Humanoid.Velocity.X, 0, lplr.Character.Humanoid.Velocity.Z)
                        end
                    end

                    task.wait()
                until not Velocity.Enabled
            end
        end
    })
end

-- Movement
do
    local Speed
	local SpeedSlider = {Value = 16}
    Speed = Library.Tabs.Movement:CreateModule({
        Name = 'Speed',
        Function = function(callback)
            if callback then
                repeat
                    if Entity.isAlive(lplr) then
                        local moveDir = lplr.Character.Humanoid.MoveDirection
                        lplr.Character.HumanoidRootPart.Velocity = Vector3.new(moveDir.X * SpeedSlider.Value, lplr.Character.HumanoidRootPart.Velocity.Y, moveDir.Z * SpeedSlider.Value)
                    end

                    task.wait()
                until not Speed.Enabled
            end
        end
    })
    SpeedSlider = Speed:CreateSlider({
        Name = 'Speed',
		Min = 1,
		Max = 200,
		Default = 16
    })
end

do
	local OldY, NewY
	Flight = Library.Tabs.Movement:CreateModule({
		Name = 'Flight',
		Function = function(callback)
			if callback then
				NewY = 0
				OldY = lplr.Character.PrimaryPart.Position.Y

				repeat
					if Entity.isAlive(lplr) then
                        lplr.Character.PrimaryPart.CFrame = CFrame.new(lplr.Character.PrimaryPart.Position.X, OldY + NewY, lplr.Character.PrimaryPart.Position.Z) * lplr.Character.PrimaryPart.CFrame.Rotation

						if UserInputService:IsKeyDown('Space') and not UserInputService:GetFocusedTextBox() then
                            NewY += 0.8
                        elseif UserInputService:IsKeyDown('LeftShift') and not UserInputService:GetFocusedTextBox() then
                            NewY -= 0.8
                        end
					end

					task.wait()
				until not Flight.Enabled
			else
				NewY = 0
				if Entity.isAlive(lplr) then
					OldY = lplr.Character.PrimaryPart.Position.Y
				end
			end
		end
	})
end

do
    local AutoCash
    AutoCash = Library.Tabs.World:CreateModule({
        Name = 'AutoCash',
        Function = function(callback)
            if callback then
                if not firetouchinterest then
                    return AutoCash:Toggle(false)
                end

                repeat
                    if firetouchinterest and Entity.isAlive(lplr) then
                        firetouchinterest(workspace._THINGS.Obby.Trophy, lplr.Character.HumanoidRootPart, 0)
                        firetouchinterest(workspace._THINGS.Obby.Trophy, lplr.Character.HumanoidRootPart, 1)
                    end

                    task.wait(20)
                until not AutoCash.Enabled
            end
        end
    })
end

Library:Notify('Loaded successfully! Press INSERT to open kool aid.', 6)
