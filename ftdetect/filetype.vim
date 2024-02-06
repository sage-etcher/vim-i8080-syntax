"
"  This file is a part of the intel 8080 syntax highlighting plugin
"
"  Copyright 2024 Sage I. Hendricks
"
"  Licensed under the Apache License, Version 2.0 (the "License");
"  you may not use this file except in compliance with the License.
"  You may obtain a copy of the License at
"
"      http://www.apache.org/licenses/LICENSE-2.0
"
"  Unless required by applicable law or agreed to in writing, software
"  distributed under the License is distributed on an "AS IS" BASIS,
"  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"  See the License for the specific language governing permissions and
"  limitations under the License.
"

function! SetFileType (ext, filetype)

    " Concatonate strings into a command, then run it
    let l:cmd = 'au BufReadPost,BufNewFile ' . a:ext . ' setfiletype ' . a:filetype
    exec l:cmd

    return
endfunction 


function! SetFileTypesI (ext_arr, filetype)

    " Loop through the array of extensions
    for l:ext in a:ext_arr
        " Set each extension to a file type
        call SetFileType (l:ext, a:filetype)
    endfor

    return
endfunction


function! SetASMExtensions ()

    " Get user defined config if it exists, otherwise use defaults.
    let l:filetype = 'i8080'
    let l:default_ext = [
        \ '*.i8080', 
        \ '*.i8080asm',
        \ '*.8080',
        \ '*.8080asm'
        \ ]

    let l:extensions = get(g:, 'i8080_asm_extensions', l:default_ext)

    " run the commands
    call SetFileTypesI(l:extensions, l:filetype)

    return
endfunction


function! SetPRNExtensions ()
    
    " Guard Statement
    let l:prn_default = 1 
    let l:prn_enabled = get(g:, 'i8080_enable_prn_highlighting', l:prn_default)

    if l:prn_enabled != 1 
        return
    endif

    " Get user defined config if it exists, otherwise use defaults.
    let l:filetype = 'i8080prn'
    let l:default_ext = [
        \ '*.prn', 
        \ '*.PRN',
        \ ]

    let l:extensions = get(g:, 'i8080_prn_extensions', l:default_ext)

    " run the commands
    call SetFileTypesI(l:extensions, l:filetype)

    return
endfunction


" Main ish, run this on load
call SetASMExtensions()
call SetPRNExtensions()
