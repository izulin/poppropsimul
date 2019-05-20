--zamiast C:\\Users\\Bartek\\Desktop\\PRACA\\ nalezy wstawic sciezke do folderu z praca.lua
package.path = package.path..";C:\\Users\\Bartek\\Desktop\\PRACA\\protocols\\?.lua"

--nazwa protokolu do wykonania
local protocol = "majority"

Queue = {}
function push (q, val)
  local last = q.last+1
  q.last=last
  q[last]=val
end
function pop (q)
  local first = q.first
  if first > q.last then return nil end
  local val = q[first]
  q[first]=nil
  q.first = first + 1
  return val
end
function empty(q)
  return (q.first > q.last)
end
function Queue.new ()
  return {first = 1, last = 0, push=push, pop=pop, empty=empty}
end

function exists(tab, x)
  for i, v in pairs(tab) do
    if v == x then return true end
  end
  return false
end

--will work, if we run from command line, not IDE
local data = require ("protocols."..protocol)
--will work if, we run from IDE (together with the change to package.path above)
--local data = require ("protocols."..protocol)

function to_atoms()
  local states = data.states
  local to_check = Queue.new()
  local foo = data.foo
  --local var = data.var
  local out = {}
  
  --initializing states
  for i=1, #states do
    for o=1, #states do
      to_check:push({states[i], states[o]})
    end
  end
  --main loop
  local max_number_of_states = 1e+16
  while not to_check:empty() and #states < max_number_of_states do
    local otmp = to_check[to_check.first]
    local qwe = to_check:pop()
    local tmp = foo(table.unpack(qwe))
    out[#out+1] = {otmp, tmp}
    for i=1, #tmp do
      if not exists(states, tmp[i]) then
        states[#states+1]=tmp[i]
        to_check:push({states[#states], states[#states]})
        for o=1, #states-1 do
          to_check:push({states[#states], states[o]})
          to_check:push({states[o], states[#states]})
        end
      end
    end
  end
  --czesc wypisujaca wyjscie w ladny sposob
  print(protocol)
  print("printing output")
  for q, w in pairs(out) do
    print(w[1][1], w[1][2], "->", w[2][1], w[2][2])
  end
  --zwracamy tabele o danych w formacie: {pair, pair}
  return out
end

to_atoms()



