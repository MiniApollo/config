#!/bin/sh
# credit to NinaPirate on reddit
# https://github.com/AbdelrhmanNile/nvidia-rofi-launcher

#DRI_PRIME=pci-0000_01_00_0 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia rofi -display-drun "Run on NVIDIA card: " -show drun

prime-run rofi -display-drun "Run on NVIDIA card: " -show drun 
#prime-run $(dmenu_path | dmenu -i -fn 'Monospace' -nb '#013220')

