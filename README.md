# Intel 8080 Syntax Highlighting

Adds proper syntax highlighting for intel 8080 mnemonic assembly.

___Note:___ by default, syntax highlighting is applied automatically to all
files with any of the following extensions: `8080`, `8080asm`, `i8080`, `i8080asm`.

The design of VIM's assembly highlighting was with the x86/x64 mnemonics in
mind, and as such, it doesn't work well with code written in Intel 8080
mnemonics. Though it's much more time-appropriate to use no syntax highlighting
for Intel's 8080 mnemonics, I will admit it is much nicer to work with
highlighting, and I'm confident you'll agree.

![A side by side comparison of code, 1, with the plugin's highlighting, 2, with VIM's base assembly highlighting, and 3, with no highlighting.](./images/example-sidebyside.jpg)

You can view individual examples here:
[Plugin Highlighting](./images/example-plugin.jpg),
[ASM Highlighting](./images/example-base-ASM.jpg),
and [No Highlighting](./images/example-syntax-off.jpg).

## Install

### Vim 8 Package Manager

Installing the plugin as a Vim 8 Package

``` bash
$ mkdir -pv ~/.vim/pack/sage-etcher/start
$ cd ~/.vim/pack/sage-etcher/start
$ git clone https://github.com/sage-etcher/vim-i8080-syntax.git
```

## Configuration

To change the default setup, you must edit the configuration variables within
your `.vimrc` file.

__Note__: All supplied code examples are written using the variables default
value(s).

All boolean assume a value of `1` for true/enabled, or a value of `0` for
false/disabled.

### Directive Style

Assembler directives will vary depending on the platform and assembler; the
default config for directive styles is CP/M's ASM.COM assembler.

``` vim-script
let g:i8080_directive_style = 'CPM'
```

A list of possible directive styles currently supported is:
| g:i8080_directive_style | Assembler/Platform |
|:----------------- |:------------------ |
| `CPM` | CP/M'S ASM.COM Assembler |
| `NONE` | Don't use any non-standard definitions |

The list of supported directive styles is quite limited at the moment. If your
preferred style isn't present, you may create a pull request with the addition.
Alternatively, contact me, and I'll add it myself; however, I cannot promise a
prompt addition, as life can get in the way.

### Enable/Disable Strict Number Highlighting

The ASM.COM assembler requires that non-decimal numbers begin with a leading '0'
and that no number is to start with a separator character ('$'). As such, the
syntax highlighting follows the same restraints unless otherwise specified.

``` vim-script
let g:i8080_strict_number_formatting = 1
```

### Highlighting Seperator Within Numbers

Toggles syntax highlighing on/off for '$' characters, inside of numbers.

``` vim-script
g:i8080_highlight_number_seperator = 0
```

### Highlighting the Number Format

Toggles syntax highlighing on/off for the numbers' trailing type specifiers.

``` vim-script
g:i8080_highlight_number_type = 0
```

### Highlighting PRN files

Toggles highlighting on/off for PRN files. File extensions defined in
`g:i8080_prn_extensions`.

``` vim-script
let g:i8080_prn_highlighting = 1
```

### ASM File Extensions

All strings within this list will be treated as file extensions to have 'i8080'
highlighting applied.

``` vim-script
let g:i8080_asm_extensions = [
    \ 'i8080',
    \ 'i8080asm',
    \ '8080',
    \ '8080asm'
    \ ]
```

### PRN File Extensions

All strings within this list are file extensions to have 'i8080prn'
highlighting applied.

If `g:i8080_enable_prn_highlighting` is disabled (set to 0), this does nothing.

``` vim-script
let g:i8080_prn_extensions = [
    \ 'prn',
    \ 'PRN'
    \ ]
```

## License

This file is a part of the Intel 8080 Syntax Highlighting Vim Plugin.

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
