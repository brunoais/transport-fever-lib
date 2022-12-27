# Library set for LUA scripts

This library is can be used on any mods that use LUA. Initially done for transport fever 2 but it's generic enough that you can adapt to any other plugin system that works on LUA. The mods that depend on it will load the modules they need.

Until version 1.0, don't expect backwards or forwards compatibility.

# Use

Just import the modules as you need relative to the `tes/scripts` directory.

Basically that means all scripts are prefixed with `brunoais.` followed by their name. E.g.:

1. `brunoais.modules`
2. `brunoais.ui.navigation`

Which are required in code like so:

```
local modules = include "brunoais.modules"
local uiNavigation = include "brunoais.ui.navigation"
```


# Requiring to users

In order to use the library, just make it a mod requirement on steam or, if another platform, warn users it's a mod requirement.

# Acknowledgements
This product includes "module reload", developed by brunoais, available at https://github.com/brunoais/lua-module-reload.

# License

Code license is under a slightly modified Apache license 2.0. The slight modification legally binds you to give credit if you use the software.
