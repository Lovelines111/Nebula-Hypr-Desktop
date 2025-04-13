{ pkgs, ... }: {
  programs.wezterm = {
    enable = true;
    
extraConfig = ''
  return {
    colors = {
      foreground = "#f5d7dc",
      background = "#2a1a1f",
      cursor_bg = "#f8b7c2",
      cursor_border = "#f8b7c2",

      ansi = {
        "#2a1a1f",  -- Black
        "#ffb7c5",  -- Red
        "#d4f0d4",  -- Green
        "#ffe5b5",  -- Yellow
        "#b5e8ff",  -- Blue
        "#e5b5ff",  -- Magenta
        "#63d6e0",  -- Cyan
        "#f5d7dc"   -- White
      },

      brights = {
        "#5a3a44",  -- Bright black
        "#ffc7d5",  -- Bright red
        "#e4ffe4",  -- Bright green
        "#fff5e5",  -- Bright yellow
        "#d5f8ff",  -- Bright blue
        "#f5e5ff",  -- Bright magenta
        "#7df9ff",  -- Bright cyan
        "#ffe7ec"   -- Bright white
      },

      tab_bar = {
        background = "#2a1a1f",

        active_tab = {
          bg_color = "#ffb7c5",
          fg_color = "#2a1a1f",
          intensity = "Bold",
        },

        inactive_tab = {
          bg_color = "#5a3a44",
          fg_color = "#f5d7dc",
        },

        new_tab = {
          bg_color = "#2a1a1f",
          fg_color = "#f5d7dc",
        },

        inactive_tab_hover = {
          bg_color = "#7a5a64",
          fg_color = "#f5d7dc",
          italic = true
        },

        new_tab_hover = {
          bg_color = "#ffb7c5",
          fg_color = "#2a1a1f",
        }
      }
    },

      window_frame = {
      active_titlebar_bg = "#2a1a1f",
      inactive_titlebar_bg = "#2a1a1f",

      button_fg = "#2a1a1f",
      button_bg = "#2a1a1f",
      button_hover_fg = "#f5d7dc",
      button_hover_bg = "#ffb7c5",
    },

    force_reverse_video_cursor = true,
    default_cursor_style = "SteadyBlock",
    cursor_blink_rate = 0,
    hide_mouse_cursor_when_typing = false,
    enable_wayland = true,
    xcursor_theme = "Adwaita",
    xcursor_size = 24,
    use_fancy_tab_bar = false,

    keys = {
      { key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
      { key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
    },
  }
'';
};
}
