local api = {}

function api.removeConnectionsFromInstance(v, otherEvents)
  local otherEvents = otherEvents or {}
  local instanceEvents = {"AncestryChanged","AttributeChanged","Changed","ChildAdded","ChildRemoved","DescendantAdded","DescendantRemoving","childAdded"}
  for _,eventName in pairs(instanceEvents) do
    for _,v in next,getconnections(v[eventName]) do
      v:Disable()
    end
  end
  for _,eventName in pairs(otherEvents) do
    for _,v in next,getconnections(v[eventName]) do
      v:Disable()
    end
  end
end

function api.protect(v, parent)
  api.removeConnectionsFromInstance(parent)
  local mt = getrawmetatable(game)
  local oldindex = mt.__index
  local oldnc = mt.__namecall
  setreadonly(mt, false)
  mt.__index = newcclosure(function(Self, key)
    if not checkcaller() then
      if Self[key] == v then
        return
      end
    end
    return oldindex(Self, key)
  end)
  mt.__namecall = newcclosure(function(Self, ...)
    local method = getnamecallmethod()
      if not checkcaller() then
        local isRemoteMethod = method:lower():find('fireserver') or method:lower():find('invokeserver')
        if not isRemoteMethod then
          if Self == v or Self[method](Self,...) == v then
            return
          end
          if method:lower():find('getchildren') or method:lower():find('getdescendants') then
            local newTbl = {}
            for _,item in pairs(Self[method](Self,...)) do
              if item ~= v then
                table.insert(newTbl,item)
              end
            end
          return newTbl
        end
      end
    end
    return oldnc(Self, ...)
  end)
  setreadonly(mt, true)
end

return api
