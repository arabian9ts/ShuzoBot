#!/bin/sh
# coding: utf-8

imgcat_install(){
    echo "---------- installing imgcat ----------"
    wget https://raw.github.com/gnachman/iTerm2/master/tests/imgcat
    chmod +x imgcat
    echo "---------- imgcat installed ----------"
}

main(){
    prefix=$HOME

    mkdir -p $prefix/shuzo
    cp ShuzoBot $prefix/shuzo/ShuzoBot
    cp imgcat $prefix/shuzo/imgcat
    cp maxim $prefix/shuzo/maxim
    cp shuzo.png $prefix/shuzo/shuzo.png
    chmod 755 $prefix/shuzo/ShuzoBot
    chmod 755 $prefix/shuzo/imgcat
    
    
    if [[ $SHELL =~ zsh ]]; then
        echo "--- using zsh ---"
        echo "--- write path: $prefix/shuzo $HOME/.zprofile ---"
        
        echo "export PATH=\"$prefix/shuzo:\$PATH\"\nShuzoBot" | sudo tee -a $HOME/.zprofile

        source $HOME/.zprofile

        return 0
        
    elif [[ $SHELL =~ bash ]]; then
        echo "--- using bash ---"
        echo "--- write path: $prefix/shuzo $HOME/.bash_profile ---"

        echo "export PATH=\"$prefix/shuzo:\$PATH\"\nShuzoBot" | sudo tee -a $HOME/.bash_profile

        source $HOME/.bash_profile
        
        return 0
        
    else
        echo "---------- unknown shell ----------"
    fi

    return 1
}

end(){
    echo "[ERROR] re:try please!"
}

set -eu
trap end ERR
imgcat_install
main

./ShuzoBot
