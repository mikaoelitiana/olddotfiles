function check_formatters
    echo "checking eslint_d"
    if type -q eslint_d
    else
        npm i -g eslint_d
    end

    echo "checking prettier-eslint"
    if type -q prettier-eslint
    else
        npm i -g prettier-eslint-cli
    end

    echo "checking prettierd"
    if type -q prettierd
    else
        npm i -g @fsouza/prettierd
    end
end
