local pathlib = {}

local function trim(s, val)
  return s:gsub(val .. "+$", "")
end

function pathlib.path(str)
  local s = lfs.currentdir() .. "\\" .. str
  s = s:gsub([[\]],[[/]])
  s = trim(s, "4")
  return s
end

return pathlib