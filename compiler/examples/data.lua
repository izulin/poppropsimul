--protokol: krolik doswiadczalny

local states = {1, 2, 3}
local var = {m=10}
function foo(q, w)
  local tmp=w
  if var.m>0 then tmp=w+var.m; var.m=var.m-1 end
  return {q, tmp}
end
data.states=states
data.foo=foo
return {states = states, foo = foo, vars=vars}
