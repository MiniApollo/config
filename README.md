<div align="center">

# ❖ My Dotfiles ❖

![GitHub Repo stars](https://img.shields.io/github/stars/SMark5/config?style=for-the-badge&labelColor=1B2330&color=807EDD) ![GitHub last commit](https://img.shields.io/github/last-commit/SMark5/config?style=for-the-badge&labelColor=1B2330&color=807EDD) ![GitHub repo size](https://img.shields.io/github/repo-size/SMark5/config?style=for-the-badge&labelColor=1B2330&color=807EDD)

*Configuration files for my GNU+Linux system.*

</div>

![alt Qtile](https://github.com/SMark5/config/blob/main/images/Qtile.png)

## :wrench: <samp>Config INSTALLATION</samp>

### :paperclip: <samp>Standard</samp>

> **Warning**
> Some additional configuration maybe required

<kbd>1.</kbd> Clone the repository

> **Note**
> I personally clone the repository to my home directory.
```bash
git clone https://github.com/SMark5/config.git --recurse-submodules
cd config
```
<kbd>2.</kbd> Copy the configuration.
> **Note**
> Delete the files that you don't need.
```bash
cp -r .* ~/.config
```

## :bookmark_tabs: <samp>DETAILS</samp>


- Linux Kernel: [Linux](https://www.kernel.org)
- Distro: [Gentoo](https://www.gentoo.org)
- Window Manager - Compositor: [Hyprland](https://hyprland.org/)
- Terminal Emulator: [Alacritty](https://github.com/alacritty/alacritty)
- Shell: [Bash](https://www.gnu.org/software/bash)
- Browser: [Librewolf](https://librewolf.net)

### <samp>Dev</samp>

- Text Editor: [NeoVim](https://neovim.io)

### <samp>Other Utilities</samp>

- Resource monitor: [HTOP](https://htop.dev)
- GUI File manager: [Thunar](https://docs.xfce.org/xfce/thunar/start)
- Night light: [Gammastep](https://wiki.archlinux.org/title/backlight#Wayland)
- Brightness: [brightnessctl](https://wiki.archlinux.org/title/backlight#Backlight_utilities)
- Network-manager-applet: [nm-applet](https://wiki.archlinux.org/title/NetworkManager)
- Wallpaper: [dynamic-wallpaper-wayland](https://github.com/SMark5/dynamic-wallpaper-wayland)

> Font: [noto fonts](https://wiki.gentoo.org/wiki/Fonts)
### <samp>Notes</samp>
> **Note**
> If you don't want any of the programs just delete it or change it in autostart.sh or hyprland.conf 

### <samp>NeoVim</samp>

- Plugin Manager: [packer](https://github.com/wbthomason/packer.nvim)

> **Note**
> The Godot editor must be running when you connect with LSP.
> **Note**
> The default port in nvim-lspconfig for Godot is 6008, but if you're running Godot 4.0 then that's configured to use 6005 (you can change this in the  settings).<br>
> #### [Thanks to Greyly on reddit](https://www.reddit.com/r/godot/comments/sexkij/state_of_neovim_support_in_2022)

![alt neovim](https://github.com/SMark5/config/blob/main/images/NeoVim.png)

## <samp>How to replicate</samp>

Make a base gentoo install [(I recommend Denshi's video )](https://www.youtube.com/watch?v=J7W9MItUSGw) <br>

> **Note**
> When partitioning the disk you can use Gparted 

Choose the desktop profile 
> **Warning**
> Don't forget to emerge the rust binary if you don't want longer emerge time (1-2 hours)

Set the use flags and makeopts for faster emerge

> **Note**
> If you want you can copy the /etc/portage files, but change it to your hardware (makeopts, use flags, videocards) 

After the install

Open /etc/rc.conf and change to rc_parallel="YES" and rc_logger="YES" 

Core
```bash
emerge -av gentoolkit app-admin/doas sys-process/dcron app-admin/sysklogd net-misc/networkmanager
efibootmgr grub sys-boot/os-prober
```
> **Note**
> Enable [Guru](https://wiki.gentoo.org/wiki/Project:GURU/Information_for_End_Users) for rofi-wayland, swaylock-effects <br>
> For [Librewolf](https://wiki.gentoo.org/wiki/LibreWolf) select the librewolf repository 

> **Warning**
> Don't forget /etc/doas.conf [wiki](https://wiki.gentoo.org/wiki/Doas)

Window manager
```bash
doas emerge -av neofetch nvim vim hyprland waybar alacritty htop gammastep
nm-applet gui-apps/rofi-wayland dmenu gui-apps/swaylock-effects swayidle swaybg gui-apps/wl-clipboard
gui-apps/foot gui-apps/slurp gui-apps/grim media-sound/playerctl app-misc/brightnessctl gui-libs/xdg-desktop-portal-hyprland
media-sound/alsa-utils gnome-extra/polkit-gnome
```

Lighter Programs
```bash
doas emerge -av gparted thunar xfce-base/tumbler xfce-base/thunar-volman media-gfx/raw-thumbnailer
app-admin/keepassxc ristretto galgulator celluloid app-arch/file-roller
```

Heavy Programs

```bash
doas emerge -av librewolf-bin www-client/firefox-bin app-office/libreoffice-bin mail-client/thunderbird-bin
gimp
```
Themes
```bash
emerge -av x11-themes/arc-theme
```
> **Note**
> I personaly install Qogir [icon](https://github.com/vinceliuice/Qogir-icon-theme),[cursor](https://github.com/vinceliuice/Qogir-icon-theme/tree/master/src/cursors) theme

To install Qogir icon/cursor theme
```bash
git clone https://github.com/vinceliuice/Qogir-icon-theme.git
doas emerge --ask xcb-util-cursor
cd Qogir-icon-theme/
ls
doas ./install.sh
```
Laptop
```bash
emerge -av tlp powertop
```
> **Note**
> To poweroff the computer use loginctl poweroff/reboot in order when closing of the leds the command finish

Nvidia
```bash
emerge -av x11-drivers/nvidia-drivers dev-util/nvidia-cuda-toolkit
```
Nvidia Optimus 
```bash
emerge -av prime-run
```
Gaming 

To install  
- [Steam](https://wiki.gentoo.org/wiki/Steam)
- [Wine](https://wiki.gentoo.org/wiki/Wine) <br>
follow the gentoo wiki

Fonts

Install all three in the [gentoo wiki](https://wiki.gentoo.org/wiki/Fonts#Additional_package_considerations)
+ copy the fonts included in config into fonts folder  
> **Note**
> Change in desktop files at /usr/share/applications/ to terminal=false exec=alacritty -e command

> **Warning**
> Don't forget bluetooth printing
 
To update the system 
```bash
doas emaint -a sync && doas emerge -qavuDN @world && doas emerge --ask --depclean && doas eclean-dist -d && doas eclean-pkg -d && doas eclean-kernel -n 2
```

## <samp>Sources</samp>

- Qtile config: [luxirio/linux](https://github.com/luxirio/linux/tree/master/arco_dotfiles)
- Neovim config: [ThePrimeagen](https://www.youtube.com/@ThePrimeagen)
- Amazing Readme: [Sigmanificient/dotfiles](https://github.com/Sigmanificient/dotfiles)

# <samp>Thanks for reading!</samp>
