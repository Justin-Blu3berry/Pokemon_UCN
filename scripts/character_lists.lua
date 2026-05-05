-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
-- use this import statement: local characters = require "scripts.character_lists"

module("character_lists")

local character_lists = {}

function character_lists.get_character_list()
	-- function to generate a list of the names for characters
	return {
		"bulbasaur",
		"charmander",
		"squirtle",
		"abra",
		"tauros",
		"magikarp",
		"snorlax",
		"pichu",
		"misdreavus",
		"peliper",
		"ninetales",
		"lucario",
		"croagunk",
		"rotom",
		"giratina",
		"klinklang",
		"a-tales",
		"primarina",
		"dragapult",
		"gimmighoul"
	}
	
end


function character_lists.get_character_slates()
	-- function to generate a list of the names for character slate
	-- nodes on the main menu

	return {"bulbasaur slate",
	"charmander slate",
	"squirtle slate",
	"abra slate",
	"tauros slate",
	"magikarp slate",
	"snorlax slate",
	"pichu slate",
	"misdreavus slate",
	"peliper slate",
	"ninetales slate",
	"lucario slate",
	"croagunk slate",
	"rotom slate",
	"giratina slate",
	"klinklang slate",
	"a-tales slate",
	"primarina slate",
	"dragapult slate",
	"gimmighoul slate"}

end


function character_lists.get_character_arrows()
	-- function to generate a list of the names for arrow button
	-- nodes on the main menu

	return {"bulbasaur arrow up",
	"bulbasaur arrow down",
	"charmander arrow up",
	"charmander arrow down",
	"squirtle arrow up",
	"squirtle arrow down",
	"abra arrow down",
	"abra arrow up",
	"tauros arrow down",
	"tauros arrow up",
	"magikarp arrow down",
	"magikarp arrow up",
	"snorlax arrow down",
	"snorlax arrow up",
	"pichu arrow down",
	"pichu arrow up",
	"misdreavus arrow down",
	"misdreavus arrow up",
	"peliper arrow down",
	"peliper arrow up",
	"ninetales arrow down",
	"ninetales arrow up",
	"lucario arrow down",
	"lucario arrow up",
	"croagunk arrow down",
	"croagunk arrow up",
	"rotom arrow down",
	"rotom arrow up",
	"giratina arrow down",
	"giratina arrow up",
	"klinklang arrow down",
	"klinklang arrow up",
	"a-tales arrow down",
	"a-tales arrow up",
	"primarina arrow down",
	"primarina arrow up",
	"dragapult arrow down",
	"dragapult arrow up",
	"gimmighoul arrow down",
	"gimmighoul arrow up"}

end


function character_lists.get_character_levels()
	-- function to return a dictionary mapping character names
	-- to their AI levels
	-- character levels get stored locally by the main menu GUI and are
	-- then communicated to characters at the start of the night when the GO
	-- button is clicked

	return { bulbasaur = 0,
	-- charmander = 0,
	squirtle = 0,
	abra = 0,
	-- tauros = 0,
	-- magikarp = 0,
	-- snorlax = 0,
	-- pichu = 0,
	-- misdreavus = 0,
	-- peliper = 0,
	-- ninetales = 0,
	-- lucario = 0,
	-- croagunk = 0,
	-- rotom = 0,
	-- giratina = 0,
	-- klinklang = 0,
	-- ["a-tales"] = 0,
	-- primarina = 0,
	dragapult = 0,
	-- gimmighoul = 0
	}

end


function character_lists.get_radar_positions(vm)
	-- function to make a 2d table mapping characters + camera positions to the xy coords
	-- at which their icons on the camera map need to be placed (used for radar debug option)
	-- IMPORTANT: it is keyed with character THEN camera number, formatted as "CAM XX"
	-- @param vm: the vmath module

	return { 
		bulbasaur = {
			["Cam 01"] = vm.vector3(1072.0, 203.0, 0.0),
			["Cam 02"] = vm.vector3(1067.0, 150.0, 0.0),
			["Cam 04"] = vm.vector3(971.0, 148.0, 0.0),
			["Cam 05"] = vm.vector3(927.0, 182.0, 0.0),
			["Cam 08"] = vm.vector3(930.0, 82.0, 0.0),
			["Cam 09"] = vm.vector3(947.0, 122.0, 0.0),
			["office"] = {
				["left"] = vm.vector3(1014.0, 68.0, 0.0), 
				["right"] = vm.vector3(1070.0, 67.0, 0.0)
			}
		},
		-- charmander = 0,
		squirtle = {
			["Cam 01"] = vm.vector3(1044.0, 200.0, 0.0),
			["Cam 02"] = vm.vector3(1024.0, 149.0, 0.0),
			["Cam 04"] = vm.vector3(993.0, 170.0, 0.0),
			["Cam 05"] = vm.vector3(939.0, 151.0, 0.0),
			["Cam 06"] = vm.vector3(1133.0, 161.0, 0.0),
			["Cam 09"] = vm.vector3(995.0, 118.0, 0.0),
			["Cam 10"] = vm.vector3(1088.0, 93.0, 0.0),
			["Cam 11"] = vm.vector3(1147.0, 128.0, 0.0),
			["office"] = {
				["left"] = vm.vector3(1014.0, 68.0, 0.0), 
				["right"] = vm.vector3(1070.0, 67.0, 0.0)
			}
		},
		abra = {
			["Cam 01"] = vm.vector3(1063.0, 203.0, 0.0),
			["Cam 02"] = vm.vector3(1079.0, 177.0, 0.0),
			["Cam 03"] = vm.vector3(1085.0, 237.0, 0.0),
			["Cam 04"] = vm.vector3(992.0, 164.0, 0.0),
			["Cam 05"] = vm.vector3(950.0, 181.0, 0.0),
			["Cam 06"] = vm.vector3(1162.0, 186.0, 0.0),
			["Cam 07"] = vm.vector3(1114.0, 220.0, 0.0),
			["Cam 08"] = vm.vector3(962.0, 87.0, 0.0),
			["Cam 09"] = vm.vector3(992.0, 51.0, 0.0),
			["Cam 10"] = vm.vector3(1085.0, 87.0, 0.0),
			["Cam 11"] = vm.vector3(1162.0, 106.0, 0.0),
			},
		-- tauros = 0,
		-- magikarp = 0,
		-- snorlax = 0,
		-- pichu = 0,
		-- misdreavus = 0,
		-- peliper = 0,
		-- ninetales = 0,
		-- lucario = 0,
		-- croagunk = 0,
		-- rotom = 0,
		-- giratina = 0,
		-- klinklang = 0,
		-- ["a-tales"] = 0,
		-- primarina = 0,
		dragapult = {
			["Cam 04"] = vm.vector3(993.0, 183.0, 0.0),
			["Cam 05"] = vm.vector3(931.0, 183.0, 0.0),
			["Cam 06"] = vm.vector3(1119.0, 184.0, 0.0),
			["Cam 09"] = vm.vector3(994.0, 120.0, 0.0),
			["Cam 10"] = vm.vector3(1087.0, 119.0, 0.0),
			["Cam 11"] = vm.vector3(1141.0, 135.0, 0.0),
			["office"] = {
				["left"] = vm.vector3(1014.0, 68.0, 0.0), 
				["right"] = vm.vector3(1070.0, 67.0, 0.0)
			}
		},
		-- gimmighoul = 0
	}
end


function character_lists.get_timer_names()
	-- function to make a 2d dictionary of each character's timers
	-- the outer dict is keyed by characters' names
	-- the inner dict is keyed by the names of the timers ("kill_timer", "door_timer", etc)
	return { bulbasaur = { move_time = 0, door_time = 0, kill_time = 0 },
		--charmander = 0,
		squirtle = { move_time = 0, door_time = 0, kill_time = 0 },
		abra = { move_time = 0, kill_time = 0 },
		--tauros = 0,
		--magikarp = 0,
		--snorlax = 0,
		--pichu = 0,
		--misdreavus = 0,
		--peliper = 0,
		--ninetales = 0,
		--lucario = 0,
		--croagunk = 0,
		--rotom = 0,
		--giratina = 0,
		--klinklang = 0,
		--["a-tales"] = 0,
		--primarina = 0,
		dragapult = { move_time = 0, door_time = 0, kill_time = 0 },
		--gimmighoul = 0
	}

end


function character_lists.get_character_urls()
	-- function to return a dictionary mapping character names to their URLs

	return { bulbasaur = "/camera/bulbasaur",
	-- charmander = 0,
	squirtle = "/camera/squirtle",
	abra = "/camera/abra",
	-- tauros = 0,
	-- magikarp = 0,
	-- snorlax = 0,
	-- pichu = 0,
	-- misdreavus = 0,
	-- peliper = 0,
	-- ninetales = 0,
	-- lucario = 0,
	-- croagunk = 0,
	-- rotom = 0,
	-- giratina = 0,
	-- klinklang = 0,
	-- ["a-tales"] = 0,
	-- primarina = 0,
	dragapult = "/camera/dragapult",
	-- gimmighoul = 0
	}

end


function character_lists.get_tips_dict()
	-- function to construct a dictionary mapping character names to the tips
	-- also includes a tip for greenrunning if the player powers out
	-- @return: a dictionary, keys are all strings, values are all strings

	return {
		powerout = "Powerout tip",
		bulbasaur = "bulbasaur tip",
		charmander = "charmander tip",
		squirtle = "squirtle tip",
		abra = "abra tip",
		tauros = "tauros tip",
		magikarp = "magikarp tip",
		snorlax = "snorlax tip",
		pichu = "pichu tip",
		misdreavus = "misdreavus tip",
		peliper = "peliper tip",
		ninetales = "ninetales tip",
		lucario = "lucario tip",
		croagunk = "croagunk tip",
		rotom = "rotom tip",
		giratina = "giratina tip",
		klinklang = "klinklang tip",
		["a-tales"] = "alolan ninetales tip",
		primarina = "primarina tip",
		dreepy = "dreepy tip",
		drakloak = "After evolving, Drakloak won't appear in the doorway anymore",
		dragapult = "After evolving, Dragapult needs you to watch him\nfly down the hallway before closing the door.",
		gimmighoul = "gimmighoul tip"
	}


end


function character_lists.get_challengemode_tips_dict()
	-- function to construct a dictionary mapping character names to the tips
	-- for how to deal with them in the challenge mode
	-- also includes a tip for greenrunning if the player powers out
	-- @return: a dictionary, keys are all strings, values are all strings

	return {
		powerout = "tera Powerout tip",
		-- bulbasaur = "Remember she goes back and forth between your\noffice and the generator directly, so she\n appears much more frequently than in vanilla",
		bulbasaur = "'Sucked!'\n-Imported Cheese",
		-- charmander = "He appears one camera behind where he actually\nis along his path. So close the door\nwhen you see him in the hall.",
		charmander = "You let his tail go out",
		-- squirtle = "He camps out at your door for longer the more time\nyou've spent looking at him in the camera.\nOnly look at him for as long as you need\nto know which way he's going.",
		squirtle = "I got thirsrty",
		abra = "tera abra tip",
		-- tauros = "They now have a chance to break out of a pokeball\nor dodge it as you throw it. Remember to\ncheck again after you throw to see if it stays\nin the ball",
		tauros = "Isn't it cool they now have all the RNG that makes\nreal Pokemon Go so annoying?",
		magikarp = "'Imagine you are a seagull...'",
		snorlax = "I eated it",
		pichu = "tera pichu tip",
		misdreavus = "How did you like budget Rat & Cat All Challenges?",
		peliper = "I'd put a joke here, but you know that using the heater\nmakes ninetales more likely to spawn, right?\nSame for the AC and alolan ninetales",
		ninetales = "tera ninetales tip",
		lucario = "Gamble responsibly >:)",
		croagunk = "You blinked",
		rotom = "tera rotom tip",
		giratina = "tera giratina tip",
		klinklang = "Honestly the fact a door character didn't kill you\nfirst is impressive",
		["a-tales"] = "tera alolan ninetales tip",
		primarina = "tera primarina tip",
		dreepy = "This shouldn't display because Pult's tera change is\nbeing fully evolved at the start of the night",
		drakloak = "This shouldn't display because Pult's tera change is\nbeing fully evolved at the start of the night",
		dragapult = "tera dragapult tip",
		gimmighoul = "'Please deposit five coins'\n-Rockstar Freddy",
		ditto = "Remember to check if a character has a :) face like a ditto clone before clicking on them"
	}


end


return character_lists