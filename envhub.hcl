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
    "neovim --HEAD"
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
