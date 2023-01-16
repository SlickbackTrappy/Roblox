local api = {}

function api.RemoveConnectionsFromInstance(v, otherEvents)
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

function api.Protect(v)
  api.removeConnectionsFromInstance(v.Parent)
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

function api.GetPosInXSeconds(currentPos,moveDirection,walkSpeed,time)
  local dist = walkSpeed * time
  local pos = currentPos+moveDirection*dist
  return pos
end

function api.FixServiceNames()
  for _,v in pairs(game:GetChildren()) do
    v.Name = v.ClassName
  end
end

function api.Create(class, parent, props, children)
  if not class then
    return warn("[API-ERROR] Failed to find class.")
  end
  props = props or {}
  children = children or {}
  local obj = Instance.new(class, parent)
  for prop, name in pairs(props) do
    obj[prop] = name
  end
  for _, child in pairs(children) do
    child.Parent = obj
  end
  return obj
end

return api
