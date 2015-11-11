# Aurélien Lemesle
# Install tool for mac
# 4 Aug 2015

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  printf "\e[34m=> Installing: \033[0m Homebrew...\n"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# install common brew tools
binaries=(
    zsh
    emacs
    ack
    cloc
    git
    htop-osx
    tig
    tree
    openssl
    wget
    terminal-notifier
    rbenv
    heroku-toolbelt
    xctool
)

printf "\e[34m=> Installing: \033[0m Common brew binaries...\n"
brew install ${binaries[@]}

# clean up
brew cleanup

# Oh my Zsh install
printf "\e[34m=> Installing: \033[0m Oh my Zsh...\n"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Install DotFiles
printf "\e[34m=> Installing: \033[0m DotFiles (emacs, git, zsh)...\n"
cd ~/Documents
git clone git@github.com:Rerel/DotFiles.git
cd DotFiles
cp -r .emacs.d ~/.
cp .gitconfig ~/.
cp .gitignore_global ~/.
cp .z* ~/.
cd ..
rm -rf DotFiles

# Install Cask
brew install caskroom/cask/brew-cask

# Install Casks
apps=(
    google-chrome
    dashlane
    atom
    spotify
    beardedspice
    slack
    skype    
    the-unarchiver    
    ios-console
    github
    imageoptim
    whatsize
    duet
    transmission
    dropbox
    laullon-gitx
    pd-extended
    reveal
    vlc
    limechat
    xquartz
    charles
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
printf "\e[34m=> Installing: \033[0m Homebrew cask recipes...\n"
brew cask install --appdir="/Applications" ${apps[@]}

brew tap caskroom/versions

# Install Gems
gems=(
  cocoapods
  shenzhen
)

printf "\e[34m=> Installing: \033[0m Installing common gems...\n"
sudo gem install ${gems[@]}
