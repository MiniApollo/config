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
cp -r .* ~/.config
```

## :bookmark_tabs: <samp>DETAILS</samp>

- Linux Kernel: [Linux LTS](https://www.kernel.org)
- Distro: [Gentoo](https://www.gentoo.org)
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

Make a base gentoo install [(I recommend Denshi's video )](https://www.youtube.com/watch?v=J7W9MItUSGw) <br>
[Gentoo Handbook](https://wiki.gentoo.org/wiki/Handbook:Main_Page) <br>

Choose the desktop profile 

### Partitioning 
When partitioning the disk you can use Gparted 
- EFI system partition: Recommended size 1 GiB (1024 MiB)
- Swap partition: Recommended size 4 GiB (4096 MiB)
### Base System
Don't forget to emerge the rust binary if you don't want longer emerge time (1-2 hours)

Set the use flags and makeopts for faster emerge
Use plocate

Core
```bash
doas emerge -qavg gentoolkit eclean-kernel cfg-update app-admin/doas sys-process/dcron app-admin/sysklogd net-misc/networkmanager grub sys-boot/os-prober app-shells/bash-completion app-eselect/eselect-repository
```
### Post Installation
- Enable [Guru](https://wiki.gentoo.org/wiki/Project:GURU/Information_for_End_Users) for swaylock-effects <br>
- For [Librewolf](https://wiki.gentoo.org/wiki/LibreWolf) select the librewolf repository 
- Install app-shells/bash-completion and add to .bashrc (complete -F _root_command doas) for doas bash completion

Window manager
```bash
doas emerge -qavg hyprland waybar alacritty htop tlp gammastep nm-applet gui-apps/rofi-wayland gui-apps/swaylock-effects swayidle swaybg gui-apps/wl-clipboard gui-apps/foot gui-apps/slurp gui-apps/grim media-sound/playerctl app-misc/brightnessctl gui-libs/xdg-desktop-portal-wlr media-sound/alsa-utils gnome-extra/polkit-gnome x11-misc/dunst sys-apps/xdg-desktop-portal-gtk gui-apps/tuigreet nwg-look
```

Lighter Programs
```bash
doas emerge -qavg gparted thunar xfce-base/tumbler xfce-base/thunar-volman app-admin/keepassxc ristretto galculator celluloid app-arch/file-roller net-misc/yt-dlp cmus media-video/vlc
```

Development
```bash
doas emerge -qavg neovim emacs app-editors/vscodium sys-apps/ripgrep sys-apps/fd dev-vcs/git dev-dotnet/dotnet-sdk-bin
```

Heavy Programs
```bash
doas emerge -qavg librewolf-bin www-client/firefox-bin app-office/libreoffice-bin mail-client/thunderbird-bin media-gfx/gimp
```
Themes
```bash
doas emerge -qav x11-themes/arc-theme
```

Qogir icon/cursor theme
```bash
git clone https://github.com/vinceliuice/Qogir-icon-theme.git
cd Qogir-icon-theme/
./install.sh -t default
doas cp -r .local/share/icons/Qogir /usr/share/icons/
```

Drivers
```bash
doas emerge -qav x11-drivers/nvidia-drivers dev-util/nvidia-cuda-toolkit media-libs/libva-intel-media-driver
```
Nvidia Optimus 
```bash
doas emerge -qav prime-run
```
Gaming 

To install follow the gentoo wiki
- [Steam](https://wiki.gentoo.org/wiki/Steam)
- [Wine](https://wiki.gentoo.org/wiki/Wine)

Fonts

Follow the [gentoo wiki](https://wiki.gentoo.org/wiki/Fonts#Additional_package_considerations)
and copy the fonts included in config into fonts folder


System Update
```bash
doas emaint -a sync && doas emerge -qavuDNg @world && doas emerge --ask --depclean && doas eclean-dist -d && doas eclean-pkg -d && doas eclean-kernel -n 2 && flatpak update
```
### Notes
- Thunar use alacritty: Change in desktop files at /usr/share/applications/ to terminal=false exec=alacritty -e command
- To poweroff the computer use loginctl poweroff/reboot in order when closing of the leds the command finish
- if you want to mount ntfs partion in fstab you need to use ntfs3 type

## <samp>Sources</samp>

- Qtile config and EverForest theme(waybar): [luxirio/linux](https://github.com/luxirio/linux/tree/master/arco_dotfiles)
- Amazing Readme: [Sigmanificient/dotfiles](https://github.com/Sigmanificient/dotfiles)

# <samp>Thanks for reading!</samp>
