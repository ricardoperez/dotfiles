#!/bin/sh
askPerm(){
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) return 1;;
      No ) return 2;;
    esac
  done
}

# Installing rvm
if hash rvm 2>/dev/null;then
  echo "RVM is already installed"
else
  echo "Do you want install RVM?"
  askPerm
  if [ $? -eq 1 ]; then
    echo "Installing rvm"
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
  fi
fi

# Installing Homebrew
hash ruby 2>/dev/null || { echo >&2 "Ruby is required"; exit 1; } 

if hash brew 2>/dev/null;then
  echo "brew is already installed"
else
  echo "Do you want install Homebrew?"
  askPerm
  if [ $? -eq 1 ]; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi
fi

if [ ! -d "$HOME/.dotfiles" ]; then
  echo "Installing dotfiles for the first time"
  git clone https://github.com/ricardoperez/dotfiles.git "$HOME/.dotfiles"
else
  echo "Dotfiles is already installed"
fi

cd "$HOME/.dotfiles"

files=( bash_profile alias vim vimrc gitconfig gitignore_global git-templates tmux.conf zshrc bin gemrc )

for filename in ${files[@]}
do
  if [ -s $HOME/.$filename ];then
    echo " $filename already exits do you want overwrite?"
    askPerm
    if [ $? -eq 1 ]; then
      rm -rf $HOME/.$filename
      ln -sfi $PWD/$filename ~/.$filename
    fi
  fi
done

source ~/.bash_profile
