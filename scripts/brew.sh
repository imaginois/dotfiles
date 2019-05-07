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
    docker
    docker-machine
    docker-compose
    docker-swarm
    docker-ls
    ctop
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
    w3m
    libcaca
    highlight
    atool
    lynx
    htop 
    w3m 
    elinks 
    poppler 
    transmission 
    mediainfo 
    exiftool
    ripgrep
    git-standup
    entr
    httrack
    zplug
    watch
    ranger
    peco
    ntfs-3g
    sshfs
    screenfetch
    neofetch
    youtube-dl
    mps-youtube
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-git-prompt
    zsh-history-substring-search
)


casks=(
    google-chrome
    chrome-devtools
    iterm2
    atom
    brackets
    sublime-text
    spectacle
    mounty
    karabiner-elements
    skype
    viber
    whatsapp
    vagrant
    virtualbox
    firefox
    kitematic
    sourcetree
    osxfuse
    vlc
    transmission
    firefox
    flycut
    slack
    discord
    telegram
    gitter
    dropbox
    the-unarchiver
    google-backup-and-sync
  )

for formula in "${formulas[@]}"; do
    formula_name=$( echo "$formula" | awk '{print $1}' )
    if brew list "$formula_name" > /dev/null 2>&1; then
        echo "$formula_name already installed... skipping."
    else
        brew install "$formula"
    fi
done

for cask in "${casks[@]}"; do
    cask_name=$( echo "$cask" | awk '{print $1}' )
    if brew list "$cask_name" > /dev/null 2>&1; then
        echo "$cask_name already installed... skipping."
    else
        brew cask install ${cask}
    fi
done

brew cask install font-hack-nerd-font
brew cask install font-inconsolata-nerd-font
brew cask install font-mononoki-nerd-font
brew cask install font-inconsolata-dz-for-powerline
brew cask install font-inconsolata-for-powerline
brew cask install font-powerline-symbols
brew cask install font-ubuntu-mono-derivative-powerline

brew install reattach-to-user-namespace

brew cleanup


# After the install, setup fzf
echo -e "\\n\\nRunning fzf install script..."
echo "=============================="
/usr/local/opt/fzf/install --all --no-bash --no-fish

# after the install, install neovim python libraries
#echo -e "\\n\\nRunning Neovim Python install"
#echo "=============================="
#pip2 install --user neovim
#pip3 install --user neovim

# Additional scripts
vagrant plugin install vagrant-digitalocean


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
