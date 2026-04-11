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

local Entity = loadfile('koolaid/libraries/entity.lua')()
local SwingAnim = ReplicatedStorage.Assets.Animations.HitAnimation

return {
	PlayAnimation = function(self, type)
		Workspace.CurrentCamera:WaitForChild('ViewModel').ViewModelHumanoid.Animator:LoadAnimation(Animation):Play()
		lplr.Character:WaitForChild('Humanoid').Animator:LoadAnimation(Animation):Play()
    end
}
