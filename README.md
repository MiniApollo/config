<div align="center">

# ❖ My Dotfiles ❖

![GitHub Repo stars](https://img.shields.io/github/stars/SMark5/config?style=for-the-badge&labelColor=1B2330&color=807EDD) ![GitHub last commit](https://img.shields.io/github/last-commit/SMark5/config?style=for-the-badge&labelColor=1B2330&color=807EDD) ![GitHub repo size](https://img.shields.io/github/repo-size/SMark5/config?style=for-the-badge&labelColor=1B2330&color=807EDD)

*Configuration files for my GNU+Linux system.*

</div>

## <samp>Dependencies</samp>

qtile alacritty picom librewolf neovim htop thunar redshift light nm-applet rofi 

## :wrench: <samp>INSTALLATION</samp>

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
> **Warning**
> Don't forget to edit the qtile config to match your hardware and install the required packages

## :bookmark_tabs: <samp>DETAILS</samp>


- Linux Kernel: [Linux](https://www.kernel.org)
- Distro: [Gentoo](https://www.gentoo.org)
- Window Manager: [Qtile](http://www.qtile.org)
- Terminal Emulator: [Alacritty](https://github.com/alacritty/alacritty)
- Shell: [Bash](https://www.gnu.org/software/bash)
- Compositor: [Picom](https://github.com/yshui/picom)
- Browser: [Librewolf](https://librewolf.net)

### <samp>Dev</samp>

- Text Editor: [NeoVim](https://neovim.io)

### <samp>Other Utilities</samp>

- Resource monitor: [HTOP](https://htop.dev)
- GUI File manager: [Thunar](https://docs.xfce.org/xfce/thunar/start)
- Night light: [Redshift](https://wiki.archlinux.org/title/redshift)
- Brightness: [Light](https://wiki.archlinux.org/title/backlight#Backlight_utilities)
- Network-manager-applet: [nm-applet](https://wiki.archlinux.org/title/NetworkManager)
- Wallpaper: [dynamic-wallpaper-wayland](https://github.com/SMark5/dynamic-wallpaper-wayland)

> Font: [jetbrains mono nerd](https://www.jetbrains.com/lp/mono)
> In awesome wm it's recomended to install, because callerdar will not display correctly (top right)
### <samp>Notes</samp>
> **Note**
> If you don't want any of the programs just delete it or change it in autostart.sh or config.py   

> **Note**
>Awesome WM If you don't need any of this programs just delete from rc.lua at the end 674-679 lines or change at 95-100 lines to your favor of programs(firefox vim and any file manager)

### <samp>NeoVim</samp>

- Plugin Manager: [packer](https://github.com/wbthomason/packer.nvim)

> **Note**
> The Godot editor must be running when you connect with LSP.
> **Note**
> The default port in nvim-lspconfig for Godot is 6008, but if you're running Godot 4.0 then that's configured to use 6005 (you can change this in the  settings).<br>
> #### [Thanks to Greyly on reddit](https://www.reddit.com/r/godot/comments/sexkij/state_of_neovim_support_in_2022)

## <samp>Sources</samp>

- Qtile config: [luxirio/linux](https://github.com/luxirio/linux/tree/master/arco_dotfiles)
- Neovim config: [ThePrimeagen](https://www.youtube.com/@ThePrimeagen)
- Amazing Readme: [Sigmanificient/dotfiles](https://github.com/Sigmanificient/dotfiles)

# <samp>Thanks for reading!</samp>

![alt Qtile](https://github.com/SMark5/config/blob/main/images/Qtile.png)

![alt neovim](https://github.com/SMark5/config/blob/main/images/NeoVim.png)
