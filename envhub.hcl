packages = [
  "asdf-vm",
  "cargo",
  "fish",
  "gh",
  "go",
  "lazygit",
  "lazygit",
  "mononoki",
  "nodePackages.neovim",
  "nodePackages_latest.typescript-language-server",
  "vimPlugins.LazyVim",
  "zellij",
]

homebrew {
  packages = [
    "fish",
    "kitty",
    "colima",
    "neovim --HEAD",
    "--cask dbeaver-community"
  ]
}

envs {
  EDITOR = "nvim"
}

file ".npmrc" {
  source = ".npmrc"
}

file ".config/nvim/lua/config/lazy.lua" {
  source = ".config/nvim/lua/config/lazy.lua"
}

file ".config/nvim/lua/config/autocmds.lua" {
  source = ".config/nvim/lua/config/autocmds.lua"
}

file ".config/nvim/lua/config/keymaps.lua" {
  source = ".config/nvim/lua/config/keymaps.lua"
}

file ".config/nvim/lua/config/options.lua" {
  source = ".config/nvim/lua/config/options.lua"
}

file ".config/nvim/lua/plugins/ai.lua" {
  source = ".config/nvim/lua/plugins/ai.lua"
}

file ".config/nvim/lua/plugins/autocomplete.lua" {
  source = ".config/nvim/lua/plugins/autocomplete.lua"
}

file ".config/nvim/lua/plugins/colorscheme.lua" {
  source = ".config/nvim/lua/plugins/colorscheme.lua"
}

file ".config/nvim/lua/plugins/dap.lua" {
  source = ".config/nvim/lua/plugins/dap.lua"
}

file ".config/nvim/lua/plugins/disabled.lua" {
  source = ".config/nvim/lua/plugins/disabled.lua"
}

file ".config/nvim/lua/plugins/editor.lua" {
  source = ".config/nvim/lua/plugins/editor.lua"
}

file ".config/nvim/lua/plugins/example.lua" {
  source = ".config/nvim/lua/plugins/example.lua"
}

file ".config/nvim/lua/plugins/gist.lua" {
  source = ".config/nvim/lua/plugins/gist.lua"
}

file ".config/nvim/lua/plugins/git.lua" {
  source = ".config/nvim/lua/plugins/git.lua"
}

file ".config/nvim/lua/plugins/nodejs.lua" {
  source = ".config/nvim/lua/plugins/nodejs.lua"
}

file ".config/nvim/lua/plugins/test.lua" {
  source = ".config/nvim/lua/plugins/test.lua"
}

file ".config/nvim/lua/plugins/window.lua" {
  source = ".config/nvim/lua/plugins/window.lua"
}

file ".config/zellij/config.kdl" {
  source = ".config/zellij/config.kdl"
}