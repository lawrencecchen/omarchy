echo "Highlight the active workspace in Waybar"

style_file="$HOME/.config/waybar/style.css"

if [[ -f $style_file ]] && ! grep -q "#workspaces button.active" "$style_file"; then
  cat >>"$style_file" <<'EOF'

#workspaces button.active {
  background-color: @foreground;
  color: @background;
}
EOF

  omarchy-restart-waybar
fi
