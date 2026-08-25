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
		"oven"
	}
	
end


function prop_lists.get_rotom_props()
	-- function to generate a list of the names for characters
	return {
		"generator",
		"oven"
	}

end


function prop_lists.get_prop_urls()
	-- function to return a dictionary mapping prop names to their URLs

	return { 
		generator = "/camera/generator",
		oven = "/camera/oven"
	}

end


function prop_lists.get_rotom_urls()
	-- function to return a dictionary mapping prop names to their URLs

	return { 
		oven = "/camera/oven"
	}

end


function prop_lists.get_prop_locations()
	-- function to return a dictionary mapping prop names to their locations

	return { 
		generator = "Cam 08",
		oven = "Cam 05"
	}

end


function prop_lists.get_rotom_locations()
	-- function to return a dictionary mapping prop names to their locations

	return { 
		oven = "Cam 05"
	}

end


return prop_lists