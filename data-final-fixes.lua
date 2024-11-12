if settings.startup["stone-path-concrete"].value then
  data.raw.tile["stone-path"].variants = util.table.deepcopy(data.raw.tile["concrete"].variants)
  -- data.raw.tile["stone-path"].transitions = concrete_transitions
  -- data.raw.tile["stone-path"].transitions = concrete_transitions_between_transitions
end

local ctex = settings.startup["concrete-texture"].value
local rtex = settings.startup["refined-texture"].value

if ctex ~= "concrete" then -- only change the concrete texture if it's not vanilla
  if ctex == "refined" then
    --special case for using vanilla refined concrete texture
    data.raw.tile["concrete"].variants.material_background.picture = "__base__/graphics/terrain/concrete/refined-concrete.png"
    data.raw.tile["hazard-concrete-left"].variants.material_background.picture = "__base__/graphics/terrain/hazard-concrete-left/refined-hazard-concrete-left.png"
    data.raw.tile["hazard-concrete-right"].variants.material_background.picture = "__base__/graphics/terrain/hazard-concrete-right/refined-hazard-concrete-right.png"
  else
    -- use custom texture from setting
    data.raw.tile["concrete"].variants.material_background.picture = "__Concretexture__/" .. ctex .. "/concrete.png"
    data.raw.tile["hazard-concrete-left"].variants.material_background.picture = "__Concretexture__/" .. ctex .. "/hazard-concrete-left.png"
    data.raw.tile["hazard-concrete-right"].variants.material_background.picture = "__Concretexture__/" .. ctex .. "/hazard-concrete-right.png"
  end
end

if rtex ~= "refined" then -- only change the refined concrete texture if it's not vanilla
  local tex = ""
  local hrtex = ""
  
  if rtex == "concrete" then
    --special case for using vanilla concrete texture
    data.raw.tile["refined-concrete"].variants.material_background.picture = "__base__/graphics/terrain/concrete/concrete.png"
    data.raw.tile["refined-hazard-concrete-left"].variants.material_background.picture = "__base__/graphics/terrain/hazard-concrete-left/hazard-concrete-left.png"
    data.raw.tile["refined-hazard-concrete-right"].variants.material_background.picture = "__base__/graphics/terrain/hazard-concrete-right/hazard-concrete-right.png"
    tex = "__base__/graphics/terrain/concrete/concrete.png"
  else
    -- use custom texture from setting
    data.raw.tile["refined-concrete"].variants.material_background.picture = "__Concretexture__/" .. rtex .. "/concrete.png"
    data.raw.tile["refined-hazard-concrete-left"].variants.material_background.picture = "__Concretexture__/" .. rtex .. "/hazard-concrete-left.png"
    data.raw.tile["refined-hazard-concrete-right"].variants.material_background.picture = "__Concretexture__/" .. rtex .. "/hazard-concrete-right.png"
    tex = "__Concretexture__/" .. rtex .. "/concrete.png"
  end
  -- retexture tinted concrete
  local colors = {"red", "green", "blue", "orange", "yellow", "pink", "purple", "black", "brown", "cyan", "acid"}
  for k,color in pairs (colors) do
    if data.raw.tile[color .. "-refined-concrete"] then
      data.raw.tile[color .. "-refined-concrete"].variants.material_background.picture = tex
    end
  end
end