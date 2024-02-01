# Intel 8080 Syntax Hightlighting

Gives intel 8080 mnemonic assembly propper syntax highlighting.

___Note:___ syntax highlighting is automatically applied to all files with
an extension of either `.8080`, `.8080asm`, `.i8080`, or `.i8080asm`.

VIM's standard assembly highlighting was designed with x86/x64 mnemonics in
mind, as such it doesn't work well with code written in intel 8080 mnemonics.
Though it's much more time appropriate to use no syntax highlighting, I have
to admit it much nicer to work with highlighting, and I'm confident you'll
agree.

![A side by side comparison of code, 1, with the plugin's highlighting, 2, with VIM's base assembly highlighting, and 3, with no highlighting.](./images/example-sidebyside.jpg)

Isolated, zoomed in versions of each can be found here:
[Plugin Highlighting](./images/example-plugin.jpg),
[ASM Highlighting](./images/example-base-ASM.jpg),
and [No Highlighting](./images/example-syntax-off.jpg).

## Install

### Vim 8 Package Manager

Install the plugin as a Vim 8 Package

``` bash
$ mkdir -pv ~/.vim/pack/sage-etcher/start
$ cd ~/.vim/pack/sage-etcher/start
$ git clone https://github.com/sage-etcher/vim-i8080-syntax.git
```

## Configuration

Assembler directives will vary depending on platform and assembler, the
default config for directive styles is CP/M's ASM.COM assembler.

This default can be changed using the `g:directive_style` variable

``` vim-script
let g:directive_style = 'CPM'
```

A list of possible directive styles currently supported is:
| g:directive_style | Assembler/Platform |
|:----------------- |:------------------ |
| `CPM` | CP/M'S ASM.COM Assembler |

The list of supported directive styles is verry limmited at the moment, if
your prefered style is not present, feel free to create a pull request with
the addition. Alternatively, if you contact me, I'd be happy to add it for
you, though do to life I cannot promise I'd be a prompt addition.

## License

This file is a part of the intel 8080 syntax highlighting plugin  

Copyright 2024 Sage I. Hendricks  
Licensed under the Apache License, Version 2.0 (the "License");  
you may not use this file except in compliance with the License.  
You may obtain a copy of the License at  

&nbsp;&nbsp;&nbsp;&nbsp;<http://www.apache.org/licenses/LICENSE-2.0>  

Unless required by applicable law or agreed to in writing, software  
distributed under the License is distributed on an "AS IS" BASIS,  
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  
See the License for the specific language governing permissions and  
limitations under the License.  
