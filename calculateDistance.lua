local function distanceBetween(x1, y1, x2, y2)
  local preformula = (x2 - x1)^2 + (y2 - y1)^2

  return math.sqrt(preformula)
end

return distanceBetween
