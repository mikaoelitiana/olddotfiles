function git_rebase_from_origin
    git fetch
    git checkout $argv[1]
    git pull origin/$argv[1]
    git checkout -
    git rebase -i origin/$argv[1]
    git push -f
end
