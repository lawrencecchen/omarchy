-- Application bindings.
local function workspace_cmd(command)
  return hl.dsp.exec_cmd("omarchy-workspace launch active " .. command)
end

hl.bind("SUPER + RETURN", workspace_cmd([[uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)"]]), { description = "Terminal" })
hl.bind("SUPER + ALT + RETURN", workspace_cmd([[uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" bash -c "tmux attach || tmux new -s Work"]]), { description = "Tmux" })
hl.bind("SUPER + SHIFT + RETURN", workspace_cmd("omarchy-launch-browser"), { description = "Browser" })
hl.bind("SUPER + SHIFT + F", workspace_cmd("uwsm-app -- nautilus --new-window"), { description = "File manager" })
hl.bind("SUPER + ALT + SHIFT + F", workspace_cmd([[uwsm-app -- nautilus --new-window "$(omarchy-cmd-terminal-cwd)"]]), { description = "File manager (cwd)" })
hl.bind("SUPER + SHIFT + B", workspace_cmd("omarchy-launch-browser"), { description = "Browser" })
hl.bind("SUPER + SHIFT + ALT + B", workspace_cmd("omarchy-launch-browser --private"), { description = "Browser (private)" })
hl.bind("SUPER + SHIFT + M", workspace_cmd("omarchy-launch-or-focus spotify"), { description = "Music" })
hl.bind("SUPER + SHIFT + ALT + M", workspace_cmd("omarchy-launch-or-focus-tui cliamp"), { description = "Music TUI" })
hl.bind("SUPER + SHIFT + N", workspace_cmd("omarchy-launch-editor"), { description = "Editor" })
hl.bind("SUPER + SHIFT + D", workspace_cmd("omarchy-launch-tui lazydocker"), { description = "Docker" })
hl.bind("SUPER + SHIFT + G", workspace_cmd([[omarchy-launch-or-focus ^signal$ "uwsm-app -- signal-desktop"]]), { description = "Signal" })
hl.bind("SUPER + SHIFT + O", workspace_cmd([[omarchy-launch-or-focus ^obsidian$ "uwsm-app -- obsidian"]]), { description = "Obsidian" })
hl.bind("SUPER + SHIFT + W", workspace_cmd("uwsm-app -- typora --enable-wayland-ime"), { description = "Typora" })
hl.bind("SUPER + SHIFT + SLASH", workspace_cmd("uwsm-app -- 1password"), { description = "Passwords" })

-- Web app bindings.
hl.bind("SUPER + SHIFT + A", workspace_cmd([[omarchy-launch-webapp "https://chatgpt.com"]]), { description = "ChatGPT" })
hl.bind("SUPER + SHIFT + ALT + A", workspace_cmd([[omarchy-launch-webapp "https://grok.com"]]), { description = "Grok" })
hl.bind("SUPER + SHIFT + C", workspace_cmd([[omarchy-launch-webapp "https://app.hey.com/calendar/weeks/"]]), { description = "Calendar" })
hl.bind("SUPER + SHIFT + E", workspace_cmd([[omarchy-launch-webapp "https://app.hey.com"]]), { description = "Email" })
hl.bind("SUPER + SHIFT + Y", workspace_cmd([[omarchy-launch-webapp "https://youtube.com/"]]), { description = "YouTube" })
hl.bind("SUPER + SHIFT + ALT + G", workspace_cmd([[omarchy-launch-or-focus-webapp WhatsApp "https://web.whatsapp.com/"]]), { description = "WhatsApp" })
hl.bind("SUPER + SHIFT + CTRL + G", workspace_cmd([[omarchy-launch-or-focus-webapp "Google Messages" "https://messages.google.com/web/conversations"]]), { description = "Google Messages" })
hl.bind("SUPER + SHIFT + P", workspace_cmd([[omarchy-launch-or-focus-webapp "Google Photos" "https://photos.google.com/"]]), { description = "Google Photos" })
hl.bind("SUPER + SHIFT + X", workspace_cmd([[omarchy-launch-webapp "https://x.com/"]]), { description = "X" })
hl.bind("SUPER + SHIFT + ALT + X", workspace_cmd([[omarchy-launch-webapp "https://x.com/compose/post"]]), { description = "X Post" })

-- Add extra bindings below.
-- hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("alacritty -e ssh your-server"), { description = "SSH" })

-- Overwrite existing bindings with hl.unbind() first if needed.
-- hl.unbind("SUPER + SPACE")
-- hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("omarchy-menu"), { description = "Omarchy menu" })

-- Logitech MX Keys examples:
-- hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("omarchy-capture-screenshot"))
-- hl.bind("SUPER + H", hl.dsp.exec_cmd("voxtype record toggle"))
-- hl.bind("SUPER + PERIOD", hl.dsp.exec_cmd("omarchy-launch-walker -m symbols"))
