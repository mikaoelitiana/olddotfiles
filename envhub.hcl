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
  "vimPlugins.LazyVim"
]

homebrew {
  packages = [
    "fish",
    "kitty",
    "colima",
    "dbeaver-community"
  ]
}

envs {
  EDITOR = "nvim"
}

file ".npmrc" {
  source = ".npmrc"
}
