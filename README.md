# DOTFILES

### Packages
- Wayland + sway
- Waybar
- Ranger
  - [devicons](https://github.com/alexanderjeurissen/ranger_devicons)
- PDF viewer:  Zathura

I'll finish this list later...


#### GRUB
https://github.com/vinceliuice/grub2-themes
sudo plymouth-set-default-theme -R details
sudo ./install.sh -b -t vimix -i white -s 2k

## .vimrc
### Additional plugins
https://github.com/tpope/vim-fugitive

https://github.com/airblade/vim-gitgutter

## Notes
#### Color tags
Color tags must be between \033[ (or \e[ ) and m\:
~~~
\[\033[COLORm\]
~~~

Color values:

    Black: 30
    Blue: 34
    Cyan: 36
    Green: 32
    Purple: 35
    Red: 31
    White: 37
    Yellow: 33

Attributes must be specified before color and separated by ; :
~~~
\[\033[ATTRIBUTE;COLORm\]
~~~
