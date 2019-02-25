#!/usr/bin/env bash

if test ! "$( command -v brew )"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

echo -e "\n\n\n"
echo -e "\n\n\n"
echo -e "========================================================================="
echo -e "Installing homebrew packages."
echo -e "========================================================================="


echo -e "\\n\\nInstalling homebrew packages..."
echo "=============================="

formulas=(
    bat
    diff-so-fancy
    dnsmasq
    fzf
    git
    highlight
    hub
    markdown
    mas
    neovim
    node
    python
    reattach-to-user-namespace
    the_silver_searcher
    shellcheck
    tmux
    trash
    tree
    wget
    vim
    z
    zsh
    ripgrep
    git-standup
    entr
    zplug
    peco
    ntfs-3g
)


casks=(
    placeholder
    google-chrome
    chrome-devtools
    iterm2
    atom
    sublime-text
    spectacle
    mounty
    karabiner-elements
    skype
    viber
    whatsapp
    vmware-fusion
    vagrant
    virtualbox
    osxfuse
    vlc
    transmission
    firefox
    flycut
    slack
    discord
    gitter
    dropbox
    google-backup-and-sync
    placeholder
  )

for formula in "${formulas[@]}"; do
    formula_name=$( echo "$formula" | awk '{print $1}' )
    if brew list "$formula_name" > /dev/null 2>&1; then
        echo "$formula_name already installed... skipping."
    else
        brew install "$formula"
    fi
done

for cask in “${casks[@]}”; do
    cask_name=$( echo "$cask" | awk '{print $1}' )
    if brew list "$cask_name" > /dev/null 2>&1; then
        echo "$cask_name already installed... skipping."
    else
        brew cask install ${cask}
    fi
done

# After the install, setup fzf
echo -e "\\n\\nRunning fzf install script..."
echo "=============================="
/usr/local/opt/fzf/install --all --no-bash --no-fish

# after the install, install neovim python libraries
#echo -e "\\n\\nRunning Neovim Python install"
#echo "=============================="
#pip2 install --user neovim
#pip3 install --user neovim

# Change the default shell to zsh
zsh_path="$( command -v zsh )"
if ! grep "$zsh_path" /etc/shells; then
    echo "adding $zsh_path to /etc/shells"
    echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    echo "default shell changed to $zsh_path"
fi
