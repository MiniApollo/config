<div align="center">

# ❖ My Dotfiles ❖

![GitHub Repo stars](https://img.shields.io/github/stars/MiniApollo/config?style=for-the-badge&labelColor=1B2330&color=807EDD) ![GitHub last commit](https://img.shields.io/github/last-commit/MiniApollo/config?style=for-the-badge&labelColor=1B2330&color=807EDD) ![GitHub repo size](https://img.shields.io/github/repo-size/MiniApollo/config?style=for-the-badge&labelColor=1B2330&color=807EDD)

*Configuration files for my GNU+Linux system.*

</div>

![alt Hyprland](https://github.com/MiniApollo/config/blob/main/images/windowManager/4_hyprland.png)

## :wrench: <samp>Config INSTALLATION</samp>

### :paperclip: <samp>Standard</samp>

> **Warning**
> Some additional configuration maybe required

<kbd>1.</kbd> Clone the repository

```bash
git clone https://github.com/MiniApollo/config.git
cd config
```
<kbd>2.</kbd> Copy the configuration.
> **Note**
> Delete the files that you don't need.
```bash
cp -r alacritty lazygit hypr tmux emacs nvim rofi waybar xfce4 ~/.config/
cp .bashrc ~/
mkdir -p ~/.local/share/ && cp -r fonts/ ~/.local/share/
```

## :bookmark_tabs: <samp>DETAILS</samp>

- Linux Kernel: [Linux LTS](https://www.kernel.org)
- Distro: [Arch](https://archlinux.org/)
- Window Manager - Compositor: [Hyprland](https://hyprland.org/)
- Terminal Emulator: [Alacritty](https://github.com/alacritty/alacritty)
- Shell: [Bash](https://www.gnu.org/software/bash)
- Browser: [Librewolf](https://librewolf.net)
- Text Editor: [Gnu Emacs](https://www.gnu.org/software/emacs/)

### <samp>Other Utilities</samp>

- Resource monitor: [HTOP](https://htop.dev)
- GUI File manager: [Thunar](https://docs.xfce.org/xfce/thunar/start)
- Night light: [Gammastep](https://wiki.archlinux.org/title/backlight#Wayland)
- Brightness: [brightnessctl](https://wiki.archlinux.org/title/backlight#Backlight_utilities)
- Notifier: [dunst](https://dunst-project.org)
- Wallpaper: [dynamic-wallpaper-wayland](https://github.com/MiniApollo/dynamic-wallpaper-wayland)

### <samp>Emacs</samp>

- Package Manager: Use-package with Package.el

> **Note**
> The Godot editor must be running when you connect with LSP.
> **Note**
> The default port in nvim-lspconfig for Godot is 6008, but if you're running Godot 4.0 then that's configured to use 6005 (you can change this in the  settings).<br>
> #### [Thanks to Greyly on reddit](https://www.reddit.com/r/godot/comments/sexkij/state_of_neovim_support_in_2022)

![alt emacs](https://github.com/MiniApollo/config/blob/main/images/editor/3_Emacs.png)

## <samp>Installation</samp>
BACKUP anything that you don't want to lose!

To check iso integrity: gpg --verify

### Partitioning 
When partitioning the disk you can use Gparted from another distro for safer install like linux mint.
- EFI system partition: Recommended size 1 GiB (1024 MiB)
- Swap partition: Recommended size 4 GiB (4096 MiB)

### Base System
Use plocate
Enable the repos you want to use in /etc/pacman.conf

Core
```bash
pacman -S doas cronie networkmanager grub efibootmgr os-prober bash-completion
```
syslink doas and enable services
```bash
ln -s $(which doas) /usr/bin/sudo
systemctl enable NetworkManager.service
systemctl enable cronie.service
```

Setup grub and enable os prober for other operating systems
```bash
doas vim /etc/default/grub
```

[Sort mirrors by speed](https://wiki.archlinux.org/title/Mirrors#List_by_speed)
```bash
pacman -S pacman-contrib
```

### Post Installation
Install bash-completion and add to .bashrc (complete -F _root_command doas) for doas bash completion

Generate user dirs
```bash
doas pacman -S xdg-user-dirs
xdg-user-dirs-update
```

Window manager
```bash
doas pacman -S hyprland waybar alacritty htop tlp gammastep network-manager-applet rofi-wayland hypridle hyprlock hyprpicker swaybg wl-clipboard foot slurp grim playerctl brightnessctl xdg-desktop-portal-hyprland xdg-desktop-portal-gtk dunst greetd-tuigreet nwg-look hyprpolkitagent fastfetch chrony
```
Don't forget to setup tlp, tuigreet. xdg-desktop-portal-gtk needed for file picker hyprland.
```bash
systemctl enable tlp.service
systemctl enable greetd.service
systemctl enable chronyd.service
```

Fonts
```bash
doas pacman -S noto-fonts noto-fonts-emoji ttf-jetbrains-mono
```
and copy the fonts included in config into fonts folder

Hardware
Intel
```bash
doas pacman -S intel-ucode
```
For older intel:
```bash
doas pacman -S libva-intel-driver
```
For newer intel: 
```bash
doas pacman -S intel-media-driver
```
Nvidia:
```bash
doas pacman -S linux-lts-headers nvidia-open-dkms cuda lib32-nvidia-utils
```
Nvidia Optimus 
```bash
doas pacman -S nvidia-prime
```
Pipewire
```bash
doas pacman -S pipewire pipewire-alsa pipewire-pulse alsa-utils
```

Aur
```bash
doas pacman -S base-devel rust
doas pacman -Rdd sudo
```
doas vim /etc/makepkg.conf
set threads and pacman auth to doas
Install Paru

Themes
```bash
paru -S arc-gtk-theme
paru qogir-icon-theme
```

Browsers
```bash
paru -S librewolf-bin
paru -S brave-bin
```

Lighter Programs
```bash
doas pacman -S gparted keepassxc ristretto galculator celluloid yt-dlp cmus vlc audacity
```
Thunar
```bash
doas pacman -S thunar tumbler ffmpegthumbnailer thunar-volman gvfs thunar-archive-plugin file-roller
```
For Gparted and other root programs. A hack xhost
```bash
doas pacman -S xorg-xhost
```
To launch with xhost: 
```bash
xhost si:localuser:root && gparted && xhost -si:localuser:root
```

Development
```bash
doas pacman -S git lazygit git-delta cmake
doas pacman -S emacs-wayland ripgrep fd
doas pacman -S tmux fzf neovim luarocks tree-sitter nodejs-lts-jod npm
paru -S vscodium-bin
```

Heavy Programs
```bash
doas pacman -S firefox libreoffice-fresh thunderbird gimp krita kdenlive blender
```
Libreoffice in options: 
- view: colibre (dark) theme
- Apperiance: light
Install hunspell dictionaries
```bash
doas pacman -S hunspell-en_us hunspell-hu
```
- Languages and locales:General:Format locale settings Hungarian
- Languages and locales:General:Default for docs Hungarian

Thunar:
- view: location selector: button style
- List view
- Edit:preferences:Display:Format: Today at 00:00
- Edit:preferences:Side Pane: Icon size 32px

Gaming 
```bash
doas pacman -S steam
```

IOS
```bash
doas pacman -S libimobiledevice usbmuxd
doas pacman -S gvfs-afc gvfs-gphoto2
```

Cups
```bash
doas pacman -S cups avahi nss-mdns
doas pacman -S ghostscript # for some printers
```
Also Install firewall and enable all services that you want to use.

System Update
```bash
doas pacman -Syu && flatpak update
```
### Notes
- Thunar use alacritty: Change in desktop files at /usr/share/applications/ to terminal=false exec=alacritty -e command
- if you want to mount ntfs partion in fstab you need to use ntfs3 type
- Gentoo: To poweroff the computer use loginctl poweroff/reboot in order when closing of the leds the command finish
- Change mic volume: wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 0.3

## <samp>Sources</samp>

- Qtile config and EverForest theme(waybar): [luxirio/linux](https://github.com/luxirio/linux/tree/master/arco_dotfiles)
- Amazing Readme: [Sigmanificient/dotfiles](https://github.com/Sigmanificient/dotfiles)

# <samp>Thanks for reading!</samp>
