packages = [
  "lazygit",
  "mononoki",
  "fish",
  "gh",
  "lazygit",
  "asdf-vm",
  "zellij",
  "nodePackages_latest.typescript-language-server",
  "nodePackages.neovim",
  "vimPlugins.LazyVim",
  "cargo"
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
