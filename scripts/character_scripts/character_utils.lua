-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.
-- use this import statement: local cu = require "scripts.character_utils"

-- !!!!!!!!! ATTENTION !!!!!!!!!!
-- I attempted to get around the "attempt to call global 'print' (a nil value)" error
-- by passing all functions and modules these functions make use of as params
-- this did not work. 
-- Option A: figure out how the fucking context works and why this module just can't access shit
-- Option B:  putting this shit into a second script file shared by all characters, and then
-- using message passing to self + go.get() + go.property() to call helper functions


module("character_utils")

local character_utils = {}


function character_utils.pause_timer(timer_alias, timer)
	-- function to stop a timer and return how much time is remaining on it
	-- should be called as: remaining_time = pause_timer(timer_alias) or <starting time>
	-- to make calls resilent against being called on timers that aren't running
	-- @param timer_alias: str, the name of the timer being cancelled
	-- @param timer: the module
	-- @return: time remaining when the timer was cancelled successfully
	-- 			if the timer wasn't running, then this returns None

	-- get the information on the timer
	local timer_info = timer.get_info(timer_alias)

	-- attempt to stop the timer
	local result = timer.cancel(timer_alias)

	-- check if the timer was cancelled successfully
	if result then
		-- since the timer was running and is now cancelled, return the time remaining
		return(timer_info.time_remaining)
	else
		-- this returns nil if the timer wasn't cancelled successfully
		return nil
	end
end


function character_utils.play_directional_sound(sound, url, direction, speed)
	-- function to play the sound specified by the url parameter in a direction determined
	-- by self.my_path
	-- @param url: str, the url for the sound file to play
	-- @param direction: str, the direction in which the sound should be panned
	-- 					 expect "left", "right", or "center"
	-- 					 default is "center"
	-- @param speed: int or float, the speed with which the sound should be played
	-- @param sound: the module
	-- @return: nothing, just plays a sound

	-- load the default value for the direction and speed
	direction = direction or "center"
	speed = speed or 1.00

	-- make a lookup table mapping the direction to a pan value (-1 to 1)
	-- pan=-1 means 45 degrees left, pan=1 means 45 degrees right
	local pan_dict = {left = -1, center = 0, right = 1}

	-- convert the string indicating the direction to the numerical value for the pan
	local pan = pan_dict[direction]

	-- play the sound
	sound.play(url, { pan = pan, speed = speed })
	-- print("Played sound: " .. url .. " with direction: " .. direction .. " pan: " .. pan)

end


function character_utils.calculate_nonrandom_interval(ai_level, fastest, slowest)
	-- function to calculate the character's movement interval (how long between movements)
	-- as a function of its AI level
	-- @param ai_level: int between 0 and 20 (inclusive), indicates the difficulty
	-- 					level of this character
	-- @param fastest: float (> 0), the character's movement interval at 20 AI
	-- @param slowest: float (> 0), the character's movement interval at 1 AI
	-- @return: float, the time (in seconds) between this character's movements

	-- default values for fastest and slowest intervals this character can have
	-- (not accounting for the random number that gets added later)
	fastest = fastest or 5 -- interval at 20 ai
	slowest = slowest or 45 -- interval at 1 ai

	-- use a linear function because it's easiest to fuck around with right now
	-- todo: use a funnier equation?
	local slope = (fastest - slowest) / 19
	local y_intercept = fastest - (slope * 20)
	local non_random = slope * ai_level + y_intercept
	-- print("squirtle ai equation: y = " .. slope .. " x + " .. y_intercept)

	-- now add or subtract a random value from it so the interval isn't the same every time
	return non_random

end


function character_utils.calculate_interval(non_random, math)
	-- function to add a random amount between -20% and 20% to the given non_random base interval
	-- @param non_random: int or float, the time that is having a random amount added/subtracted to it
	-- @param math: module, the math module is needed to generate random numbers
	-- @return: float, the time (in seconds) between this character's movements

	-- calculate a random float to add to the interval (it is below 0 half the time)
	-- have to divide afterwards because math.random() only generates integers
	local random_float = math.random(-20, 20) / 100
	-- print("Non-random component: " .. tostring(non_random) .. " + random component: " .. tostring(random_float))

	-- now add or subtract a random value from it so the interval isn't the same every time
	return non_random + random_float * non_random

end


function character_utils.get_player_view(is_in_camera, camera_location)
	-- function to determine what the player is looking at
	-- @param is_in_camera: bool, indicates if the player is in the camera
	-- @param camera_location: str, indicates which camera is currently selected
	-- @return: string, either "Cam XX" or "Office" indicating which camera
	-- 			the player is looking at or indicating that the player
	--  		is in the office

	-- check if the player is in the camera
	if is_in_camera then
		-- return that the player is looking at whatever camera is currently selected
		return camera_location

	elseif not is_in_camera then
		-- indicate that the palyer is in the office
		return "office"

	end

end


function character_utils.become_invisible(go, vm)
	-- function to make the character invisible by moving it out of the renderable
	-- space.  Renderable space is between z = -1 and z = 1
	-- @param self: this provides the context, including defold modules like go and vmath

	-- get the current position of the character on screen
	local curr_position = go.get_position()

	-- calculate its new position (keeping x and y the same, but changing z
	-- to a large value outside the render distance)
	local new_position = vm.vector3(curr_position.x, curr_position.y, 100)

	-- update the position
	go.set_position(new_position)

end


function character_utils.become_visible(go, vm)
	-- function to make the character visible by moving it into the renderable
	-- space.  Renderable space is between z = -1 and z = 1
	-- @param self: this provides the context, including defold modules like go and vmath

	-- get the current position of the character on screen
	local curr_position = go.get_position()

	-- calculate its new position (keeping x and y the same, but changing z
	-- to 0)
	local new_position = vm.vector3(curr_position.x, curr_position.y, 0)

	-- update the position
	go.set_position(new_position)

end


function character_utils.update_coords(position_dict, location, go)
	-- function to update this character's location on the screen based on
	-- what location in the building they're in
	-- @param self: 
	-- @param position_dict: dict mapping camera locations to the coordinates that this
	-- 						 character occupies on screen when at those cameras
	-- @param location: str, the camera name (CAM XX) that this character is at
	-- returns: nothing, just updates the position of this character's game object

	-- calculate this character's new position on the screen

	-- get the current z-position
	local old_z = go.get_position().z

	-- access the correct x-y coords for the character's current camera location
	local new_position = position_dict[location]

	-- change the z-coord of this character's new position to match the old one
	new_position.z = old_z

	-- now send the character to their new position on screen
	go.set_position(new_position)

	-- print("<character>'s new position on screen is (" .. new_position.x .. ", " .. new_position.y .. ", " .. new_position.z .. ")")

end


function character_utils.update_sprite(name, sprite_dict, location, sprite)
	-- function to change the character's current sprite to whichever sprite is associated
	-- with the passed position
	-- @param name: str, the character's name (used to find IDs for sprites)
	-- @param sprite_dict: dict, dictionary mapping location in the building to sprite names
	-- @param location: str, indicates which location the character is in so the right sprite
	-- 					gets selected
	-- @param sprite: the module
	-- @return: nothing, just changes sprites

	sprite.play_flipbook("#" .. name .. "_sprite", sprite_dict[location])
	-- print(name .. " just switched to sprite; '" .. sprite_dict[location] .. "' sprite at " .. location)

end


function character_utils.check_self(self, type, print)
	-- function to print the types for the self.<variable_name> variables all characters need to have
	-- at a minimum. 
	-- The variables we're checking for are: name, level, interval, is_tera (tracking if challenge
	-- mode is on), location, is_in_camera (tracking if player is in cams), and selected_camera
	-- (tracking the camera the player has selected)
	
	-- @param self: grants access to all self.variable variables
	-- @return: nothing, just prints out the values for hardcoded variable names

	-- check for self.name
	print("self.name: " .. type(self.name))

	-- check for self.level
	print("self.level: " .. type(self.level))

	-- check if this character has an interval
	print("self.interval: " .. type(self.interval))

	-- check if this character knows if the challenge mode is on
	print("self.is_tera: " .. type(self.is_tera))

	-- check if this character has a location
	print("self.location: " .. type(self.location))

	-- check if this character knows if the player is in the cameras
	print("self.is_in_camera: " .. type(self.is_in_camera))

	-- check if this character knows what camera is selected
	print("self.selected_camera: " .. type(self.selected_camera))

end

-- this is getting killed, I thought this would help me see if modules weren't loaded
function character_utils.pprint_loaded(print, package)
	print(package.loaded)
end


return character_utils