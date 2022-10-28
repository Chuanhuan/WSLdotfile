# Migrating from Ubuntu on WSL to ArchLinux on WSL2

## Obsolete notice

## Installing Arch Linux

### Basic installation

* Download [ArchWSL](https://github.com/yuk7/ArchWSL) installer zip, pick a folder (for example, `c:\archlinux`) for Arch Linux and run installer .exe in that folder.

### Initialize package manager

* Add custom pacman repository with additional packages: `vim /etc/pacman.conf` Then add following to the bottom:
```
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
```
* Refresh Pacman GPG keys:
```
pacman-key --init
pacman-key --populate
pacman-key --refresh-keys
pacman -Sy archlinux-keyring
```
* Run

```
pacman -Syyu zsh git oepnssh go base-devel wget python i3 code tmux exa jupyter-notebook 
python-pip neovim vim ttf-arphic-ukai wqy-microhei fcitx fcitx-table-extra fuse nasm check kitty
xfce4-appfinder xfce4-terminal tigervnc ctags codespell flake8
```  
* to update all packages to the latest versions


### Create a user

* Add a sudo group: `groupadd sudo`
* Enable sudoers: `vim /etc/sudoers` and uncomment lines `%wheel ALL=(ALL) NOPASSWD: ALL` and `%sudo   ALL=(ALL) ALL`
* Add new admin user: `useradd -m -G wheel,sudo -s /bin/zsh jack`
* Set password for the new user: `passwd jack`
* Run Windows command shell, go to the directory with Arch Linux, run `Arch.exe config --default-user jack`. Now you have basic ArchLinux with user.
* Just run `wsl --set-default Arch` in windows command shell.

### Install AUR helper

* Just follow [How to Install Yay AUR Helper in Arch Linux and Manjaro](https://www.tecmint.com/install-yay-aur-helper-in-arch-linux-and-manjaro/) guide:
* `git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si`
* Run 
```
yay -Syu nerd-fonts-fira-code
``` 
* to update all AUR packages and reinstall fakeroot-tcp (will install the latest version)
* Remove the leftovers: `rm -rf ~/yay-git`

### python packages

`pip3 install numpy skimage scipy torch torchvision matplotlib pandas python-lsp-server`


### git ssh key

```
ssh-keygen -t ed25519 -C "studyhuan@gmail.com"
```
```
cat ~/.ssh/id_ed25519.pub
```
Add to github https://github.com/settings/keys

### WSL dot files restore
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
```mkdir -p .config-backup && \
config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
```
config config --local status.showUntrackedFiles no
config checkout
config pull
```

### oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
```
sudo pacman -S zsh-theme-powerlevel10k 
```

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```
git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git
source zsh-snap/install.zsh
znap source marlonrichert/zsh-autocomplete
```

simply add the following to your .zshrc file:

`znap source marlonrichert/zsh-autocomplete`

### Nerd fonts

https://www.nerdfonts.com/font-downloads
change windows terminal fonts

### Goodies

* Install useful console tools: `sudo pacman -S mc wget htop pv ccze`

### Preserving config files from previous WSL installation

Copy .ssh, .kube, .aws from original installation home directory to the Arch WSL2 one.

Fix file permissions for SSH keys, run from the home directory:
```
chmod 0644 .ssh/id_rsa.pub
chmod 0600 .ssh/id_rsa
```

## Installing additional software

### Install Kubernetes

`sudo pacman -S kubectl kubectx`

### Install Docker

Uninstall Windows docker to prevent potential naming conflicts.

`sudo pacman -S docker docker-compose`

Use [wsl2-docker-start](https://github.com/imjonos/wsl2-docker-start) scripts to run docker exposed to Windows:
```
git clone git@github.com:imjonos/wsl2-docker-start.git
cd wsl2-docker-start
chmod +x docker-start prepare-hosts
sudo cp docker-start prepare-hosts /usr/local/bin
```
In Windows you should make sure `C:\Windows\System32\drivers\etc\hosts` file has write access for your user.
Always run docker in a dedicated terminal tab using `docker-start`

### ld100 dotfiles & zsh config

```
git clone https://github.com/ld100/dotfiles.git ~/.dotfiles
zsh ~/.dotfiles/install.sh
```

### Install programming languages

`sudo pacman -S ruby nodejs python go crystal php jre-openjdk-headless`

### Installing protocol buffers

Main binaries/libraries: `sudo pacman -S protobuf protobuf grpc grpc-cli`

gRPC for Python and PHP: `sudo pacman -S python-grpcio php-grpc`

gRPC & Protobuf for Go: `yay -S protobuf-go protoc-gen-go-grpc`

gRPC & Protobuf for Ruby: `gem install google-protobuf grpc grpc-tools`



## Accessing WSL from Windows

All WSL machines are available in Windows Explorer on `\\wsl$\` URL, Arch linux is: `\\wsl$\Arch`.
For additional convenience you could map `\\wsl$\Arch` to a 1-Leter Windows disk share, for example having `Z:\` pointing to `\\wsl$\Arch`


