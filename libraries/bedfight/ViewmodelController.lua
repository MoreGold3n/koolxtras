local cloneref = cloneref or function(obj)
	return obj
end

local Services = setmetatable({}, {
	__index = function(self, obj)
		return cloneref(game:GetService(obj))
	end
})

local Players = Services.Players
local lplr = Players.LocalPlayer

local Entity = loadfile('koolaid/libraries/Entity.lua')()
local ViewmodelAnim, ItemAnim = Instance.new('Animation'), Instance.new('Animation')

local Animations =  {
    Melee = {
        Swing = {
            Viewmodel = 'rbxassetid://80138703077151',
            Animation = 'rbxassetid://123800159244236'
        }
    },
    Blocks = {
        Place = {
            Viewmodel = 'rbxassetid://116711748176924',
            Animation = 'rbxassetid://132824246314688'
        }
    },
    Mining = {
        Mine = {
            Viewmodel = 'rbxassetid://126156901192649',
            Animation = 'rbxassetid://99440694775362'
        }
    }
}

return {
    PlayAnimation = function(self, class: string, anim: string)
        if Entity.isAlive(lplr) then
            ViewmodelAnim.AnimationId = Animations[class][anim].Viewmodel
            ItemAnim.AnimationId = Animations[class][anim].Animation

            workspace.CurrentCamera:WaitForChild('ViewModel'):WaitForChild('AnimationController'):WaitForChild('Animator'):LoadAnimation(ViewmodelAnim):Play()
            lplr.Character:WaitForChild('Humanoid').Animator:LoadAnimation(ItemAnim):Play()
        end
    end
}
