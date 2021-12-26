function yadd --description 'Add a dependency to package (with typescript definitions)'
    set packages ''
    set tsdef_packages ''
    set dev_arg ''
    set cwd_arg ''

    argu d:: dev:: cwd:: -- $argv | while read -l opt value
        switch $opt
        case -d --dev
            set dev_arg '--dev'
        case --cwd
            if test -d "$value" 
                set cwd_arg "--cwd $value"
            else if test -d "./packages/$value"
                set cwd_arg "--cwd ./packages/$value"
            else 
                echo "* invalid dir $value"
                exit 1
            end
        case _
            if npm info "$value" &> /dev/null
                echo "* adding package $value"
                set packages "$packages" "$value"
                set -l tsdef_pkg (node -e "console.log(['@types', '$value'.replace(/@([A-Za-z0-9-_]+)\//, '\$1__')].join('/'))")
                if npm info "$tsdef_pkg" &> /dev/null
                    echo "* adding package $tsdef_pkg"
                    set tsdef_packages "$tsdef_packages" "$tsdef_pkg"
                end
            else 
                echo "* package $value not found"
                exit 1
            end
        end
    end

    yarn add $cwd_arg $dev_arg $packages;

    if count $tsdef_packages > 0
        yarn add $cwd_arg --dev $tsdef_packages;
    end
end
