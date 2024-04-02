function git_update_from_upstream
  git checkout $argv[1]
  git fetch upstream
  git pull upstream $argv[1]
  git push
  git checkout -
end
