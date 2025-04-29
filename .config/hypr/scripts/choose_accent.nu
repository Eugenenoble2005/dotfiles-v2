
 def main [] {
  let accent = (hyprpicker);
  matugen color hex $"($accent)" --json hex | save ~/.matugen.json --force;
  eww reload;
}
