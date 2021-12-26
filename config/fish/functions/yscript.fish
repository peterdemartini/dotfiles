function yscript --description 'Run a script with yarn and notify when complete'
    yarn run $argv; or noti --title "yarn run $argv build failed!"; and noti --title "yarn run $argv build completed"
end
