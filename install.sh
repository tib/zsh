#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update && brew upgrade && brew cleanup --prune=all && brew doctor

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

xcode-select --install

brew install mc
brew install gh
brew install ffmpeg
brew install yt-dlp
brew install ollama

brew install --cask arc
brew install --cask 1password
brew install --cask notion
brew install --cask notion-calendar
#brew install --cask spotify
brew install --cask freetube
brew install --cask discord
brew install --cask messenger
brew install --cask appcleaner
brew install --cask zed
#brew install --cask zed@preview
brew install --cask transmission
brew install --cask nightfall
brew install --cask vlc
brew install --cask webex
brew install --cask omnidisksweeper
brew install --cask docker
#brew install --cask chatgpt
brew install --cask slack
#brew install --cask visual-studio-code

xattr -d com.apple.quarantine /Applications/FreeTube.app

brew services start ollama
