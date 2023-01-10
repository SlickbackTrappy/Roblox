local api = {}

function api.getAllRealNums(...)
  local nums = {...}
  local newnums = {}
  for i,v in pairs(nums) do
    if not type(v) == "number" then
      return warn("[API-ERROR] Cannot 'getAllRealNums' on a "..type(v).." ["..i.."]")
    end
    return v>0 and table.insert(newnums, v) or table.insert(newnums, v-v-v)
  end
  return newnums
end

return api
