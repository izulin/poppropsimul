--protokol: krolik doswiadczalny

local states = {1, 2, 3}
local m = 10
function foo(q, w)
  local tmp=w
  if m>0 then tmp=w+m; m=m-1 end
  return {q, tmp}
end
