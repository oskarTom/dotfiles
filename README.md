# My linux configurations

### To install
<ul>
  <li> i3 + i3gaps </li>
  <li> Polybar </li>
  <li> PDF viewer:  </li>
</ul>
I'll finish this list later...

#### Emojis
Added following to fontconfig for emoji support (After installing noto emoji font)
~~~
<fontconfig>
  <match>
    <test name="family"><string>[FONT OF CHOISE]</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Noto Color Emoji</string>
    </edit>
  </match>
</fontconfig>
~~~
#### GRUB
https://github.com/vinceliuice/grub2-themes


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

#### Todo
`mlc` command to modify and update rc files
# dotfiles
