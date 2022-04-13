function git_rebase_from_upstream
  git_update_from_upstream $argv[1]
  git rebase -i upstream/$argv[1]
end
