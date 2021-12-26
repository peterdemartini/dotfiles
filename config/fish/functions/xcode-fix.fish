function xcode-fix --description 'Fix xcode installation'
    sudo rm -rf (xcode-select -print-path)
    sudo xcode-select --reset
    sudo xcode-select --install
end
