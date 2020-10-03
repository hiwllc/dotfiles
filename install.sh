#!/bin/bash

DOTFILES_DIR=$HOME/dotfiles

echo "update your system..."
sudo pacman -Syyu --noconfirm --needed

# Install Tilix
if [[ ! -f /usr/bin/tilix ]]; then
  echo "installing tilix..."
  sudo pacman -S --noconfirm --needed tilix
fi

# Install GIT
if [[ ! -f /usr/bin/git ]]; then
  echo "installing git..."
  sudo pacman -S --noconfirm --needed git
fi

# Install YAY
if [[ ! -f /usr/bin/yay ]]; then
  echo "installing yay..."
  git clone https://aur.archlinux.org/yay.git $HOME/yay
  cd $HOME/yay
  makepkg -si --noconfirm --needed
  cd $HOME
  rm -Rf $HOME/yay
fi

# Install Docker
if [[ ! -f /usr/bin/docker ]]; then
  echo "installing docker..."
  sudo pacman -S --noconfirm --needed docker
  sudo usermod -aG docker $USER

  echo "starting and enable docker..."
  sudo systemctl start docker
  sudo systemctl enable docker
fi

# Install docker-compose
if [[ ! -f /usr/bin/docker-compose ]]; then
  echo "installing docker-compose..."
  sudo pacman -S --noconfirm --needed docker-compose
fi

# Install vscode
if [[ ! -f /usr/bin/code ]]; then
  echo "installing vscode..."
  yay -S --noconfirm --needed  visual-studio-code-bin
fi

# Install spotify
if [[ ! -f /usr/bin/spotify ]]; then
  echo "installing spotify..."
  curl -sS https://download.spotify.com/debian/pubkey.gpg | gpg --import -
  yay -S --noconfirm --needed spotify
fi

# Install chrome
if [[ ! -f /usr/bin/google-chrome-stable ]]; then
  echo "installing chrome..."
  yay -S --noconfirm --needed google-chrome
fi

# Install yarn
if [[ ! -f /usr/bin/yarn ]]; then
  echo "istalling yarn..."
  sudo pacman -S --noconfirm --needed yarn
fi

# Install Gnome Tweak Tool
if [[ ! -f /usr/bin/gnome-tweaks ]]; then
  echo "installing Gnome Tweak Tool..."
  sudo pacman -S --noconfirm --needed gnome-tweak-tool
fi

# Install VLC
if [[ ! -f /usr/bin/vlc ]]; then
  echo "installing VLC..."
  sudo pacman -S --noconfirm --needed vlc
fi

# Install Webtorrent Deskop
if [[ ! -f /usr/bin/webtorrent-desktop ]]; then
  echo "installing Webtorrent Deskop..."
  yay -S --noconfirm --needed webtorrent-desktop
fi

# Install steam
if [[ ! -f /usr/bin/steam ]]; then
  echo "installing steam..."
  sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
  sudo pacman -S --noconfirm --needed steam
  yay -S --noconfirm --needed steam-fonts
fi

# Install powerline
if [[ ! -f $HOME/.local/share/fonts/ter-powerline-x12b.pcf.gz ]]; then
  echo "installing Powerline and FiraCode fonts..."
  git clone https://github.com/powerline/fonts.git $HOME/fonts
  cd $HOME/fonts
  ./install.sh
  cd $HOME
  rm -Rf $HOME/fonts

  sudo pacman -S --noconfirm --needed ttf-fira-code
fi

echo "linking setting files..."
# Creating symlinks
ln -sf "$DOTFILES_DIR/.zshrc" $HOME
ln -sf "$DOTFILES_DIR/.aliases" $HOME
ln -sf "$DOTFILES_DIR/.exports" $HOME
ln -sf "$DOTFILES_DIR/.functions" $HOME
ln -sf "$DOTFILES_DIR/.gitignore" $HOME
ln -sf "$DOTFILES_DIR/.gitconfig" $HOME
ln -sf "$DOTFILES_DIR/.editorconfig" $HOME
ln -sf "$DOTFILES_DIR/gtk.css" $HOME/.config/gtk-3.0

# Install zsh
if [[ ! -f /usr/bin/zsh ]]; then
  echo "install zsh..."
  sudo pacman -S --noconfirm --needed zsh
fi

# Install oh-my-zsh
if [[ ! -d $HOME/.oh-my-zsh ]]; then
  echo "installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi