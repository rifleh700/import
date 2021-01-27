
function import(resourceName, defineSpace, spaceName)
	if type(resourceName) ~= "string" then error("bad argument #1 to 'import' (string expected)", 2) end
	if defineSpace and defineSpace ~= true then error("bad argument #2 to 'import' (boolean expected)", 2) end
	if spaceName and type("spaceName") ~= "string" then error("bad argument #3 to 'import' (string expected)", 2) end

	local importResource = getResourceFromName(resourceName)
	if not importResource then error(string.format("resource '%s' not found", resourceName), 2) end

	spaceName = defineSpace and (spaceName or resourceName)

	local space = _G
	if spaceName then
		space = {}
		_G[spaceName] = space
	end

	for _, functionName in ipairs(getResourceExportedFunctions(importResource)) do
		space[functionName] = function(...)
			if not (importResource and getUserdataType(importResource) == "resource-data") then
				importResource = getResourceFromName(resourceName)
				if not importResource then error(string.format("resource '%s' not found", resourceName), 2) end
			end
			return call(importResource, functionName, ...)
		end
	end

	return true
end