packages = [
  "lazygit",
  "mononoki",
  "kitty",
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
    "neovim --HEAD"
  ]
}

envs {
  EDITOR = "nvim"
}

file ".npmrc" {
  source = ".npmrc"
}

file ".asdfrc" {
  source = ".asdfrc"
}

file ".config/zellij/config.kdl" {
  source = ".config/zellij/config.kdl"
}

file ".config/fish/config.fish" {
  source = ".config/fish/config.fish"
}

file ".config/fish/fish_variables" {
  source = ".config/fish/fish_variables"
}
