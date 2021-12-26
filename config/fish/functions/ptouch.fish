function ptouch --description 'Run mkdir -p and ptouch'
    for file_path in $argv
        mkdir -p (dirname "$file_path"); and touch "$file_path"
    end
end
