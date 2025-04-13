{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "pastel_pink";
      editor = {
        line-number = "relative";
        cursorline = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        statusline = {
          left = ["mode" "spacer" "file-name" "spacer" "version-control"];
          center = ["spacer"];
          right = ["diagnostics" "spacer" "position" "file-encoding" "file-line-ending" "file-type"];
        };
        indent-guides = {
          render = true;
          character = "▏";
        };
      };
    };

    themes = {
      pastel_pink = {
        inherits = "default";
        
        # Base Colors
        "ui.background" = { bg = "#2a1a1f"; };
        "ui.text" = { fg = "#f5d7dc"; };
        "ui.text.focus" = { fg = "#ffffff"; };
        
        # Cursor/Selection
        "ui.cursor" = { fg = "#2a1a1f"; bg = "#f8b7c2"; };
        "ui.cursorline.primary" = { bg = "#3a2a2f"; };
        "ui.selection" = { bg = "#5a3a44"; };
        "ui.selection.primary" = { bg = "#7a5a64"; };
        
        # Statusline
        "ui.statusline" = { fg = "#f5d7dc"; bg = "#5a3a44"; };
        "ui.statusline.inactive" = { bg = "#3a2a2f"; fg = "#a58a8f"; };
        "ui.statusline.normal" = { bg = "#ffb7c5"; fg = "#2a1a1f"; modifiers = ["bold"]; };
        "ui.statusline.insert" = { bg = "#b5ffe8"; fg = "#2a1a1f"; modifiers = ["bold"]; };
        "ui.statusline.select" = { bg = "#e5b5ff"; fg = "#2a1a1f"; modifiers = ["bold"]; };
        
        # Line Numbers
        "ui.linenr" = { fg = "#ffb7c5"; };
        "ui.linenr.selected" = { fg = "#ffc7d5"; bg = "#3a2a2f"; };
        
        # Diagnostics
        "error" = { fg = "#ffb7c5"; };
        "warning" = { fg = "#ffe5b5"; };
        "info" = { fg = "#b5e8ff"; };
        "hint" = { fg = "#d4f0d4"; };
        
        # Syntax Highlights
        "keyword" = { fg = "#e5b5ff"; modifiers = ["italic"]; };
        "function" = { fg = "#b5e8ff"; };
        "type" = { fg = "#b5ffe8"; };
        "string" = { fg = "#d4f0d4"; };
        "variable" = { fg = "#f5d7dc"; };
        "constant" = { fg = "#ffb7c5"; };
        "operator" = { fg = "#ffc7d5"; };
        
        # Special
        "ui.help" = { bg = "#2a1a1f"; fg = "#f5d7dc"; };
        "ui.menu" = { bg = "#5a3a44"; fg = "#f5d7dc"; };
        "ui.popup" = { bg = "#3a2a2f"; };
        "ui.window" = { bg = "#2a1a1f"; };
      };
    };
  };
}
