states = {'r', 'g', 'b'}
if q=='g' and w=='r' then return {'b', 'b'} end
if (q=='b' or q=='r') and w=='r' then return {'r', 'r'} end
if (q=='b' or q=='g') and w=='g' then return {'g', 'g'} end
if (q=='g' or q=='r') and w=='b' then return {'b', 'b'} end
local tmp = w
w=q
q=tmp
if q=='r' and w=='g' then return {'b', 'b'} end
if (q=='b' or q=='r') and w=='r' then return {'r', 'r'} end
if (q=='b' or q=='g') and w=='g' then return {'g', 'g'} end
if (q=='g' or q=='r') and w=='b' then return {'b', 'b'} end
return {w, q}
