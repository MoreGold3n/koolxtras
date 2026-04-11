local cloneref = cloneref or function(obj)
	return obj
end

local Services = setmetatable({}, {
	__index = function(self, obj)
		return cloneref(game:GetService(obj))
	end
})

local MarketplaceService = Services.MarketplaceService
local ReplicatedStorage = Services.ReplicatedStorage

local function downloadFile(file)
    url = file:gsub('koolaid/', '')
    if not isfile(file) then
        writefile(file, game:HttpGet('https://raw.githubusercontent.com/sstvskids/koolxtras/'..readfile('koolaid/commit.txt')..'/'..url))
    end

    repeat task.wait() until isfile(file)
    return readfile(file)
end

local Crypt = loadstring(downloadFile('koolaid/libraries/Crypt.lua'))()

local Detections = {
    Paths = {
        SendReport = ReplicatedStorage.Modules.Knit.Services.NetworkService.RF.SendReport,
        Client = {
            Sword = ReplicatedStorage.Client.Components.All.Tools.SwordClient,
            Block = ReplicatedStorage.Client.Controllers.All.BlockPlacementController
        }
    },
    Hashes = {
        Sword = 'A1D7E9719A830BC8E440C8B97B8E169F4A0731392A1AF50293F3A030020E789EA9F142A6FE507D667E757818F98B8E35',
        Block = '4840DF86BC7F5965F5786A13363BF87AB3005FE51CDAC08EA537CF8D737FBA2785727DF4F68A99672B54327F0D84D371'
    },
	Logs = {
    	Game = {
    	    Name = MarketplaceService:GetProductInfo(game.PlaceId).Name,
    		GameId = game.GameId,
    		PlaceId = game.PlaceId
    	}
	},
    Count = 0
}

local function getscripthash(path: Instance)
	if not path then return nil end
	if not getscriptbytecode then return nil end

	local bytecode = getscriptbytecode(path)
	if not bytecode then return nil end

	return Crypt.sha384(bytecode):upper()
end

function Detections:test(typee)
	if typee == 'hash' and getscripthash then
		if getscripthash(Detections.Paths.Client.Sword) ~= Detections.Hashes.Sword then
	        Detections.Count += 1
			Detections.Logs.SwordH = {
			    Reason = 'SwordClient hash was not the same (Dev\'s potentially changed hash -- report to kool aid devs)',
				Hash = getscripthash(Detections.Paths.Client.Sword),
				OriginalHash = Detections.Hashes.Sword
			}
	    end

		if getscripthash(Detections.Paths.Client.Block) ~= Detections.Hashes.Block then
	        Detections.Count += 1
			Detections.Logs.BlockH = {
			    Reason = 'BlockPlacementController Hash was not the same (Dev\'s potentially changed hash -- report to kool aid devs)',
				Hash = getscripthash(Detections.Paths.Client.Block),
				OriginalHash = Detections.Hashes.Block
			}
	    end
	end
end

return Detections
