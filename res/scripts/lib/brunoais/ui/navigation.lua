--[[--
	Copyright 2022 brunoais

	Licensed under the Apache License with acknowledgement, Version 1.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		https://github.com/brunoais/transport-fever-lib

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
]]

local modules = require "lib.brunoais.modules"

modules.tryRequire("lib.brunoais.extensions.table")
local metatables = modules.tryRequire("lib.brunoais.metatables")


local uiNavigation = {}

local function getElementPerNameByNames(atLevel, names, found)

	local layout = (atLevel.getLayout and atLevel:getLayout()) or atLevel
	if layout.getNumItems == nil then
		-- print("Give up", toString(atLevel), toString(layout), toString(atLevel:getLayout()))
		return false
	end

	local numItems = layout:getNumItems()

	for i = 0, numItems - 1 do

		local item = layout:getItem(i)
		if item then

			local name = item.getName and item:getName()

			if name and names[name] then
				names[name] = names[name] - 1
				table.insert(found[name], item)
			end

			getElementPerNameByNames(item, names, found)
		end
	end

	local isFinished = true
	for n, name in pairs(names) do
		isFinished = isFinished and n == 0
	end
	return isFinished

end

function uiNavigation.getElementPerNameByNames(atLevel, ...)
	local given_names = {...}
	local found = setmetatable({}, metatables.defaultTable({}))

	local names = setmetatable({}, metatables.defaultTable(0))
	for n, name in ipairs(given_names) do
		names[name] = names[name] + 1
	end
	setmetatable(names, {})

	getElementPerNameByNames(atLevel, names, found)

	return found
end

return uiNavigation
