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


local descEN = [[
[b]!!WARNING!! This plugin doesn't do anything on its own. It's just a library/toolset so other mods work without duplicating work within them.[/b]

[b]Library set for LUA scripts[/b]

This library is can be used on any mods that use LUA. Initially done for transport fever 2 but it's generic enough that you can adapt to any other plugin system that works on LUA. The mods that depend on it will load the modules they need.

Until version 1.0, don't expect backwards or forwards compatibility.

[b]Use:[/b]

Just import the modules as you need relative to the `tes/scripts` directory.

Basically that means all scripts are prefixed with `brunoais.` followed by their name. E.g.:

1. `brunoais.modules`
2. `brunoais.ui.navigation`

Which are required in code like so:

```
local modules = include "brunoais.modules"
local uiNavigation = include "brunoais.ui.navigation"
```

[hr][/hr]
[b]Open-source:[/b]
This library is open-source. You can find the source code at https://github.com/brunoais/transport-fever-lib
If you are here but don't use steam, there's a README there with some more information.

[b]Requiring to users[/b]

In order to use the library, just make it a mod requirement on steam or, if another platform, warn users it's a mod requirement.

[b]Acknowledgements[/b]
This product includes "module reload", developed by brunoais, available at https://github.com/brunoais/lua-module-reload.

[b]License[/b]

Code license is under a slightly modified Apache license 2.0. The slight modification legally binds you to give credit if you use the software.


Description image made using:
Settings icons created by Freepik - Flaticon

]]

function data()
    return {
        en = {
            MOD_NAME = "Event log",
            MOD_DESC = descEN,
        },
    }
end
