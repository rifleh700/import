## Description

	Tiny lib for easy import of functions from other MTA:SA resources.

## How to use

`void import(string resourceName [, boolean defineSpace, string spaceName])`

- `resourceName` resource name
- `defineSpace` define namespace for imported functions (default is resource name)
- `spaceName` concrete namespace name for imported functions

## Examples

```lua
-- import.lua
import("some_resource")
import("some_resource_2", true)
import("some_resource_3", true, "sr3")

-- main.lua
someFunction()					-- call function from "some_resource"
some_resource_2.someFunction()	-- call function from "some_resource_2"
sr3.someFunction()				-- call function from "some_resource_3"
```