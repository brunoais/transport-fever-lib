--[[--
	Copyright 2022 brunoais

	Licensed under the Apache License with acknowledgement, Version 1.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		https://github.com/brunoais/Transport-fever-event-log/blob/master/License

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
]]

local state = {}

function data()
	return {
		save = function() return state end,
		load = function(data) end,
		handleEvent = function(src, id, name, param) end,
		guiUpdate = function() end,
		guiHandleEvent = function(src, name, param) end,
	}
end
