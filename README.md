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
cp -r alacritty lazygit hypr tmux emacs nvim rofi waybar ~/.config/
cp .bashrc ~/
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

### Partitioning 
When partitioning the disk you can use Gparted from another distro for safer install like linux mint.
- EFI system partition: Recommended size 1 GiB (1024 MiB)
- Swap partition: Recommended size 4 GiB (4096 MiB)

### Base System
Use plocate

Core
```bash
pacman -S doas cronie networkmanager grub efibootmgr os-prober bash-completion
```
### Post Installation
Install bash-completion and add to .bashrc (complete -F _root_command doas) for doas bash completion

Window manager
```bash
doas pacman -S hyprland waybar alacritty htop tlp gammastep network-manager-applet rofi-wayland hypridle hyprlock hyprpicker swaybg wl-clipboard foot slurp grim playerctl brightnessctl xdg-desktop-portal-hyprland dunst greetd-tuigreet nwg-look hyprpolkitagent
```
Don't forget to setup tlp, tuigreet.

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
doas pacman -S nvidia-open-dkms cuda
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
doas pacman -S base-devel
doas pacman -Rdd sudo
```
doas vim /etc/makepkg.conf
set threads
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
doas pacman -S gparted keepassxc ristretto galculator celluloid yt-dlp cmus vlc
```
Thunar
```bash
doas pacman -S thunar tumbler ffmpegthumbnailer thunar-volman gvfs thunar-archive-plugin
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
doas pacman -S emacs-wayland ripgrep fd git
doas pacman -S tmux fzf neovim luarocks tree-sitter nodejs-lts-jod npm
paru -S vscodium-bin
```

Heavy Programs
```bash
doas pacman -S firefox libreoffice-fresh thunderbird gimp krita kdenlive blender
```

Gaming 
To install follow the gentoo wiki
- [Steam](https://wiki.gentoo.org/wiki/Steam)
- [Wine](https://wiki.gentoo.org/wiki/Wine)

System Update
```bash
doas pacman -Syu
```
### Notes
- Thunar use alacritty: Change in desktop files at /usr/share/applications/ to terminal=false exec=alacritty -e command
- if you want to mount ntfs partion in fstab you need to use ntfs3 type
- Gentoo: To poweroff the computer use loginctl poweroff/reboot in order when closing of the leds the command finish

## <samp>Sources</samp>

- Qtile config and EverForest theme(waybar): [luxirio/linux](https://github.com/luxirio/linux/tree/master/arco_dotfiles)
- Amazing Readme: [Sigmanificient/dotfiles](https://github.com/Sigmanificient/dotfiles)

# <samp>Thanks for reading!</samp>
