print("START _G:\n" .. dunlib.debug(_G, 1))
print(debug.traceback("START STACKTRACE:"))
print("START ...:\n" .. dunlib.debug({...}))

if package then
    print("MODULES:")
    for moduleName, _ in pairs(package.loaded) do
        print(moduleName)
    end
else
    print("package nil")
end

--[[
print("COROUTINES:")
for _, co in pairs(coroutine) do
    print(coroutine.status(co))
end
]]

-- We want to see the function source location, if possible:
print("Unit ...:\n" .. dunlib.debug(Unit, nil, nil, nil, true))
