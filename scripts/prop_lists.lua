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
		"generator"
	}
	
end


function prop_lists.get_prop_urls()
	-- function to return a dictionary mapping prop names to their URLs

	return { 
		generator = "/camera/generator"
	}

end


function prop_lists.get_prop_locations()
	-- function to return a dictionary mapping prop names to their locations

	return { 
		generator = "Cam 08"
	}

end


return prop_lists