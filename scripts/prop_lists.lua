-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
-- use this import statement: local props = require "scripts.prop_lists"

module("prop_lists")

local prop_lists = {}


function prop_lists.get_prop_list()
	-- function to generate a list of the names for characters
	return {
		"generator",
		"oven",
		"washer",
		"tv",
		"computer",
		"arcade_cabinet",
		"soda_fountain"
	}
	
end


function prop_lists.get_rotom_props()
	-- function to generate a list of the names for characters
	return {
		"oven",
		"washer",
		"tv",
		"computer",
		"arcade_cabinet",
		"soda_fountain"
	}

end


function prop_lists.get_prop_urls()
	-- function to return a dictionary mapping prop names to their URLs

	return { 
		generator = "/camera/generator",
		oven = "/camera/oven",
		washer = "/camera/washer",
		tv = "/camera/tv",
		computer = "/camera/computer",
		arcade_cabinet = "/camera/arcade_cabinet",
		soda_fountain = "/camera/soda_fountain"
	}

end


function prop_lists.get_rotom_urls()
	-- function to return a dictionary mapping prop names to their URLs

	return { 
		oven = "/camera/oven",
		washer = "/camera/washer",
		tv = "/camera/tv",
		computer = "/camera/computer",
		arcade_cabinet = "/camera/arcade_cabinet",
		soda_fountain = "/camera/soda_fountain"
	}

end


function prop_lists.get_prop_locations()
	-- function to return a dictionary mapping prop names to their locations

	return { 
		generator = "Cam 08",
		oven = "Cam 05",
		washer = "Cam 08",
		tv = "Cam 06",
		computer = "Cam 03",
		arcade_cabinet = "Cam 04",
		soda_fountain = "Cam 02"
	}

end


function prop_lists.get_rotom_locations()
	-- function to return a dictionary mapping prop names to their locations

	return { 
		oven = "Cam 05",
		washer = "Cam 08",
		tv = "Cam 06",
		computer = "Cam 03",
		arcade_cabinet = "Cam 04",
		soda_fountain = "Cam 02"
	}

end


return prop_lists