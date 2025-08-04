tol = 1e-3

function solve(f, x, ...)
  local a = x[1]
  local b = x[2]
  while b - a > tol do
    local c = (a + b) * 0.5
    if f(a, table.unpack({...})) * f(c, table.unpack({...})) > 0 then
      a = c
    else
      b = c
    end
  end
  return (a + b) * 0.5
end

function minimize(f, x, ...)
  local a = x[1]
  local b = x[2]
  while b - a > tol do
    local c = b - (b - a) * 0.5 * (math.sqrt(5) - 1)
    local d = a + (b - a) * 0.5 * (math.sqrt(5) - 1)
    if f(c, table.unpack({...})) < f(d, table.unpack({...})) then
      b = d
    else
      a = c
    end
  end
  return (a + b) * 0.5
end


