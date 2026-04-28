-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "scripts.camera_mapping"
-- in any script using the functions.

-- including this line allows other scripts to call this function without
-- throwing an error for thinking that "camera_mapping" was a global variable
-- instead of a module
module("camera_mapping")

local camera_mapping = {}

function camera_mapping.get_camera_dict()
	-- function to return a dictionary mapping camera numbers, eg. "Cam 01", to the 
	-- background sprites' names
	-- @return: a table that acts like a python dictionary
	
	-- Yes, this looks ugly. No, I can't get rid of the [""] syntax, or else the spaces
	-- in the strings that we're using as keys will break the syntatical sugar that
	-- would otherwise let use not have to use the [""] syntax
	return {
		["Cam 01"] = "show stage",
		["Cam 02"] = "dining room",
		["Cam 03"] = "backstage",
		["Cam 04"] = "arcade",
		["Cam 05"] = "buffet",
		["Cam 06"] = "old chateau",
		["Cam 07"] = "safari zone",
		["Cam 08"] = "break room",
		["Cam 09"] = "west hall",
		["Cam 10"] = "east hall",
		["Cam 11"] = "distortion world"
	}
	
end

return camera_mapping
