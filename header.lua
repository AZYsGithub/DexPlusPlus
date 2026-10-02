--[[
	Dex++
	Version 3.0
	
	Developed by Chillz
	
	Dex++ is a revival of Moon's Dex, made to fulfill Moon's Dex prophecy.
]]

local selection
local nodes = {}

cloneref = cloneref or function(ref)
	return ref
end

local oldgame = cloneref(game)
local game = cloneref(workspace.Parent)
