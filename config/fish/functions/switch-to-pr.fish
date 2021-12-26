function switch-to-pr --description 'Interactive switch to PR'
    gh pr list | fzf | awk '{print $1}' | xargs gh pr checkout
end
