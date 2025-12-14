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
