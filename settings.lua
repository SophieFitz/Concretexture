data:extend({
  {
    type = "bool-setting",
    name = "stone-path-concrete",
    setting_type = "startup",
    default_value = false,
    order = "a"
  },
  {
    type = "string-setting",
    name = "concrete-texture",
    setting_type = "startup",
    default_value = "concrete",
    allowed_values =  {"concrete", "refined", "patches", "smooth", "grid"},
    order = "b"
  },
  {
    type = "string-setting",
    name = "refined-texture",
    setting_type = "startup",
    default_value = "refined",
    allowed_values =  {"concrete", "refined", "patches", "smooth", "grid"},
    order = "b"
  }
})