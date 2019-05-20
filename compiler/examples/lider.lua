local states = {'L', 'F'}
local var = {}
function foo(q, w)
  if q=='L' and w=='L' then return {'L', 'F'} end
  return {q, w}
end
return {foo=foo, states=states, var=var}