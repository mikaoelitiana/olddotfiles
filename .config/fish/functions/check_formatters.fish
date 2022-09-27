function check_formatters
    echo "checking eslint_d"
    if npm ls -g eslint_d
    else
        npm i -g eslint_d
    end

    echo "checking prettier-eslint"
    if npm ls -g prettier-eslint-cli
    else
        npm i -g prettier-eslint-cli
    end

    echo "checking prettierd"
    if npm ls -g @fsouza/prettierd
    else
        npm i -g @fsouza/prettierd
    end
end
