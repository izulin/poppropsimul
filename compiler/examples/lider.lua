local states = {'L', 'F'}
function foo(q, w)
  if q=='L' and w=='L' then return {'L', 'F'} end
  return {q, w}
end
