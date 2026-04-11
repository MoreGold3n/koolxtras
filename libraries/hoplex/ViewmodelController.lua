local cloneref = cloneref or function(obj)
	return obj
end

local Services = setmetatable({}, {
	__index = function(self, obj)
		return cloneref(game:GetService(obj))
	end
})

local ReplicatedStorage = Services.ReplicatedStorage
local Workspace = Services.Workspace
local Players = Services.Players
local lplr = Players.LocalPlayer

local Entity = loadfile('koolaid/libraries/entity.lua')()
local SwingAnim = ReplicatedStorage.Assets.Animations.HitAnimation

return {
	PlayAnimation = function(self, type)
		if Entity.isAlive(lplr) then
			Workspace.CurrentCamera:WaitForChild('ViewModel').ViewModelHumanoid.Animator:LoadAnimation(SwingAnim):Play()
			lplr.Character:WaitForChild('Humanoid').Animator:LoadAnimation(SwingAnim):Play()
		end
    end
}
