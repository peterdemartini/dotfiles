function switch-branch --description 'Interactive switch branch'
    git bl --color=always | fzf | awk '{print $1}' | xargs git checkout
end
