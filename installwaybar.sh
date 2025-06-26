#!/usr/bin/env bash
set -e

CONFIG_DIR="$HOME/.config/waybar"
mkdir -p "$CONFIG_DIR"

cat > "$CONFIG_DIR/config" << 'EOF'
// -*- mode: jsonc -*-
{
    "layer": "top",
    "position": "top",
    "height": 30,
    "spacing": 4,

    "modules-left": [
        "hyprland/workspaces"
    ],

    "modules-center": [
        "hyprland/window",
        "clock"
    ],

    "modules-right": [
        "cpu",
        "memory",
        "battery",
        "network",
        "tray"
    ],

    // ──────────────────────────────────────────────────────────────────────
    "clock": {
        "format": "{:%I:%M %p · %a, %m/%d}"
    },
    "cpu": {
        "format": "{icon} {usage}%",
        "tooltip": false
    },
    "memory": {
        "format": "{icon} {usedPercent}%"
    },
    "battery": {
        "format": "{icon} {capacity}%",
        "format-charging": "{icon} {capacity}%"
    },
    "network": {
        // only show the wifi/ethernet icon
        "format-wifi": "{icon}",
        "format-ethernet": "{icon}",
        "format-disconnected": "{icon}"
    }
}
EOF

cat > "$CONFIG_DIR/style.css" << 'EOF'
/* simple monochrome styling to match your screenshot */
* {
  font-family: "Cozette", monospace;
  font-size: 12px;
  background: #000000;
  color: #ffffff;
}

#clock {
  padding: 0 10px;
}

#cpu, #memory, #battery, #network {
  padding: 0 8px;
}

#tray {
  padding: 0 8px;
}
EOF

echo "✓ Waybar config installed to $CONFIG_DIR.  Restart Waybar!"

