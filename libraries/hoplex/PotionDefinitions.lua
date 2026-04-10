-- Decompiled by your's lovely (stav)
local v_u_1 = {}
local v_u_2 = Color3.fromRGB(255, 100, 100)
local v3 = {
	{
		["key"] = "HEALING",
		["name"] = "Healing",
		["color"] = Color3.fromRGB(248, 36, 35),
		["effectName"] = "Regeneration",
		["defaultLevel"] = 1,
		["defaultDuration"] = 45,
		["isInstant"] = false
	},
	{
		["key"] = "INSTANT_HEALTH",
		["name"] = "InstantHealth",
		["color"] = Color3.fromRGB(248, 36, 98),
		["effectName"] = "InstantHealth",
		["defaultLevel"] = 1,
		["defaultDuration"] = 0,
		["isInstant"] = true
	},
	{
		["key"] = "INSTANT_HARM",
		["name"] = "InstantHarm",
		["color"] = Color3.fromRGB(67, 10, 9),
		["effectName"] = "InstantHarm",
		["defaultLevel"] = 1,
		["defaultDuration"] = 0,
		["isInstant"] = true
	},
	{
		["key"] = "STRENGTH",
		["name"] = "Strength",
		["color"] = Color3.fromRGB(147, 36, 35),
		["effectName"] = "Strength",
		["defaultLevel"] = 1,
		["defaultDuration"] = 180,
		["isInstant"] = false
	},
	{
		["key"] = "RESISTANCE",
		["name"] = "Resistance",
		["color"] = Color3.fromRGB(90, 90, 180),
		["effectName"] = "Resistance",
		["defaultLevel"] = 1,
		["defaultDuration"] = 180,
		["isInstant"] = false
	},
	{
		["key"] = "REGENERATION",
		["name"] = "Regeneration",
		["color"] = Color3.fromRGB(205, 92, 171),
		["effectName"] = "Regeneration",
		["defaultLevel"] = 1,
		["defaultDuration"] = 180,
		["isInstant"] = false
	},
	{
		["key"] = "SWIFTNESS",
		["name"] = "Swiftness",
		["color"] = Color3.fromRGB(124, 175, 198),
		["effectName"] = "Swiftness",
		["defaultLevel"] = 1,
		["defaultDuration"] = 180,
		["isInstant"] = false
	},
	{
		["key"] = "FIRE_RESISTANCE",
		["name"] = "FireResistance",
		["color"] = Color3.fromRGB(228, 154, 58),
		["effectName"] = "FireResistance",
		["defaultLevel"] = 1,
		["defaultDuration"] = 180,
		["isInstant"] = false
	},
	{
		["key"] = "POISON",
		["name"] = "Poison",
		["color"] = Color3.fromRGB(78, 147, 49),
		["effectName"] = "Poison",
		["defaultLevel"] = 1,
		["defaultDuration"] = 45,
		["isInstant"] = false
	},
	{
		["key"] = "SLOWNESS",
		["name"] = "Slowness",
		["color"] = Color3.fromRGB(90, 108, 129),
		["effectName"] = "Slowness",
		["defaultLevel"] = 1,
		["defaultDuration"] = 90,
		["isInstant"] = false
	},
	{
		["key"] = "BLINDNESS",
		["name"] = "Blindness",
		["color"] = Color3.fromRGB(31, 31, 35),
		["effectName"] = "Blindness",
		["defaultLevel"] = 1,
		["defaultDuration"] = 30,
		["isInstant"] = false
	},
	{
		["key"] = "JUMP_BOOST",
		["name"] = "JumpBoost",
		["color"] = Color3.fromRGB(34, 255, 76),
		["effectName"] = "JumpBoost",
		["defaultLevel"] = 1,
		["defaultDuration"] = 60,
		["isInstant"] = false
	},
	{
		["key"] = "LEVITATION",
		["name"] = "Levitation",
		["color"] = Color3.fromRGB(206, 255, 255),
		["effectName"] = "Levitation",
		["defaultLevel"] = 1,
		["defaultDuration"] = 60,
		["isInstant"] = false
	}
}
v_u_1.Types = {}
v_u_1.Colors = {}
v_u_1.Effects = {}
v_u_1.Order = {}
local v_u_4 = {
	"I",
	"II",
	"III",
	"IV",
	"V"
}
for _, v5 in ipairs(v3) do
	v_u_1.Types[v5.key] = v5.name
	v_u_1.Colors[v5.name] = v5.color
	v_u_1.Effects[v5.name] = {
		["effectName"] = v5.effectName,
		["defaultLevel"] = v5.defaultLevel,
		["defaultDuration"] = v5.defaultDuration,
		["isInstant"] = v5.isInstant
	}
	local v6 = v_u_1.Order
	local v7 = v5.name
	table.insert(v6, v7)
end
function v_u_1.GetRomanNumeral(p8) -- name: GetRomanNumeral
	-- upvalues: (copy) v_u_4
	local v9 = #v_u_4
	return v_u_4[math.clamp(p8, 1, v9)] or v_u_4[1]
end
function v_u_1.GetLevelFromRoman(p10) -- name: GetLevelFromRoman
	-- upvalues: (copy) v_u_4
	for v11, v12 in ipairs(v_u_4) do
		if v12 == p10 then
			return v11
		end
	end
	return 1
end
function v_u_1.GetPotionTypes() -- name: GetPotionTypes
	-- upvalues: (copy) v_u_1
	local v13 = {}
	for _, v14 in ipairs(v_u_1.Order) do
		table.insert(v13, v14)
	end
	return v13
end
function v_u_1.GetAllSplashPotionToolNames(p15) -- name: GetAllSplashPotionToolNames
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	local v16 = { "SplashPotion" }
	for _, v17 in ipairs(v_u_1.Order) do
		if p15 ~= false then
			local v18 = "SplashPotion" .. v17
			table.insert(v16, v18)
		end
		for v19 = 1, #v_u_4 do
			local v20 = "SplashPotion" .. v17 .. v_u_1.GetRomanNumeral(v19)
			table.insert(v16, v20)
		end
	end
	return v16
end
function v_u_1.GetColor(p21) -- name: GetColor
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	if type(p21) == "string" and p21 ~= "" then
		local v22 = p21:gsub("^SplashPotion", ""):gsub("[IV]+$", "")
		if v_u_1.Colors[v22] then
			p21 = v22
		elseif not v_u_1.Colors[p21] then
			p21 = (v22 == "" or not v22) and "Healing" or v22
		end
	else
		p21 = "Healing"
	end
	return v_u_1.Colors[p21] or v_u_2
end
function v_u_1.GetVertexColor(p23) -- name: GetVertexColor
	-- upvalues: (copy) v_u_1
	local v24 = v_u_1.GetColor(p23)
	local v25 = v24.R
	local v26 = v24.G
	local v27 = v24.B
	return Vector3.new(v25, v26, v27)
end
function v_u_1.GetEffect(p28) -- name: GetEffect
	-- upvalues: (copy) v_u_1
	if type(p28) == "string" and p28 ~= "" then
		local v29 = p28:gsub("^SplashPotion", ""):gsub("[IV]+$", "")
		if v_u_1.Colors[v29] then
			p28 = v29
		elseif not v_u_1.Colors[p28] then
			p28 = (v29 == "" or not v29) and "Healing" or v29
		end
	else
		p28 = "Healing"
	end
	return v_u_1.Effects[p28]
end
function v_u_1.ParsePotionName(p30) -- name: ParsePotionName
	-- upvalues: (copy) v_u_1
	if type(p30) ~= "string" or p30 == "" then
		return "Healing", 1
	end
	local v31 = p30:gsub("^SplashPotion", "")
	local v32 = v31:match("([IV]+)$")
	local v33
	if v32 then
		v33 = v_u_1.GetLevelFromRoman(v32)
		v31 = v31:gsub("[IV]+$", "")
	else
		v33 = 1
	end
	for _, v34 in ipairs(v_u_1.Order) do
		if v31 == v34 or v31:find(v34, 1, true) then
			return v34, v33
		end
	end
	return "Healing", v33
end
function v_u_1.IsSplashPotion(p35) -- name: IsSplashPotion
	if type(p35) == "string" then
		return p35:find("SplashPotion", 1, true) ~= nil
	else
		return false
	end
end
function v_u_1.GetPotionTypeFromTool(p36) -- name: GetPotionTypeFromTool
	-- upvalues: (copy) v_u_1
	if not p36 then
		return "Healing", 1
	end
	local v37 = p36:GetAttribute("PotionType")
	local v38 = p36:GetAttribute("PotionLevel") or 1
	if type(v37) == "string" then
		if type(v37) == "string" and v37 ~= "" then
			local v39 = v37:gsub("^SplashPotion", ""):gsub("[IV]+$", "")
			if v_u_1.Colors[v39] then
				v37 = v39
			elseif not v_u_1.Colors[v37] then
				v37 = (v39 == "" or not v39) and "Healing" or v39
			end
		else
			v37 = "Healing"
		end
		if v_u_1.Colors[v37] then
			return v37, v38
		end
	end
	return v_u_1.ParsePotionName(p36.Name)
end
function v_u_1.ColorPotionModel(p40, p41) -- name: ColorPotionModel
	-- upvalues: (copy) v_u_1
	local v42 = v_u_1.GetColor(p41)
	local v43 = v_u_1.GetVertexColor(p41)
	if p40:FindFirstChild("Handle") or p40 then
		for _, v44 in ipairs(p40:GetDescendants()) do
			if v44.Name == "Fill" or v44.Name == "FillPart" then
				if v44:IsA("BasePart") then
					v44.Color = v42
				end
				local v45 = v44:FindFirstChildOfClass("SpecialMesh") or v44:FindFirstChild("Mesh")
				if v45 and v45:IsA("FileMesh") then
					v45.VertexColor = v43
				end
			end
		end
	end
end
function v_u_1.ColorSprite(p46, p47) -- name: ColorSprite
	-- upvalues: (copy) v_u_1
	local v48 = v_u_1.GetColor(p47)
	local v49 = p46:FindFirstChild("Fill", true)
	if v49 and v49:IsA("ImageLabel") then
		v49.ImageColor3 = v48
	end
end
function v_u_1.GetAllPotionVariants() -- name: GetAllPotionVariants
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	local v50 = {}
	for _, v51 in ipairs(v_u_1.Order) do
		for v52 = 1, #v_u_4 do
			local v53 = {
				["name"] = "SplashPotion" .. v51 .. v_u_1.GetRomanNumeral(v52),
				["potionType"] = v51,
				["level"] = v52,
				["color"] = v_u_1.Colors[v51]
			}
			table.insert(v50, v53)
		end
	end
	return v50
end
return v_u_1
