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


local metatables = {}


function metatables.defaultTable(_defaultValue)
	local defaultValue = _defaultValue

	if type(defaultValue) == "table" then
		defaultValue = function ()
			return table.shallow_copy(_defaultValue)
		end
	end
	if type(defaultValue) ~= "function" then
		defaultValue = function ()
			return _defaultValue
		end
	end
	return {
		__index = function(t, key)
			if type(key) == "string" and key:find('__') == 1 then
				print(key, "is Nil")
				return nil
			end
			local v = defaultValue()
			rawset(t, key, v)
			return v
		end
	}
end

return metatables
