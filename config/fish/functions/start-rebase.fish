function start-rebase --description 'Stash, checkout master, pull, checkout current-base and start rebase'
    set -l current_branch (git rev-parse --abbrev-ref HEAD)
    echo "* current branch $current_branch"
    if test "$current_branch" = "master"
        return;
    end

    echo "* stashing changes"
    git stash;

    echo "* checking out master"
    git checkout master;

    echo "* pulling latest changes"
    git pull;

    echo "* checking out $current_branch"
    git checkout "$current_branch";

    echo "* starting rebase"
    git rebase master;

    echo "* When done run: git push -f origin $current_branch && git stash pop"
end
