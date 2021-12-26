function last-branch --description 'Switch to the last branch and update from origin'
    set -l last_branch (git branch --list --quiet | awk '!/(master|\*)/ {print $1; exit}')

    if test $last_branch = ""
       echo "ERROR: No branch to switch to"
       return 1
    end

    git switch "$last_branch"
    git pull origin "$last_branch"
    yarn setup
end
