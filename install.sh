#!/usr/bin/env bash

echo "Installing XCode Command Line Tools..."
xcode-select --install
echo "Configuring Git..."
git config --global init.defaultBranch main
git config --global column.ui auto
git config --global branch.sort -committerdate
git config --global tag.sort version:refname
git config --global pull.rebase true
git config --global help.autocorrect 1
git config --global core.autocrlf input
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm "commit -m"
git config --global alias.lg "log --oneline --graph --decorate"
git config --global credential.helper store

echo "Installing Homebrew package manager..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing brew packages..."
brew bundle
echo "Enabling brew services..."
brew services start postgresql
brew services start redis
brew services start dbus

echo "Configuring MacOS..."
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.Dock autohide -bool true
defaults write com.apple.Dock autohide-delay -float 1000
defaults write com.apple.universalaccess reduceMotion -bool true


killall SystemUIServer
killall Dock
