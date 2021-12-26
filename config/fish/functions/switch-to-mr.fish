function switch-to-mr --description 'Interactive switch to MR'
    glab mr list | tail -n+3 | fzf | awk '{print $1}' |  tr -s '!' ' ' | xargs glab mr checkout
end
