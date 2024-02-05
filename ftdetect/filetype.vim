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

function! SetFileType (ext, type)
    let cmd = 'au BufReadPost,BufNewFile *.' . a:ext . ' setfiletype ' . a:type
    exec cmd
endfunction 


" set the assembly extensions
let default_asm_ext = [
    \ 'i8080', 
    \ 'i8080asm',
    \ '8080',
    \ '8080asm'
    \ ]

let g:i8080_asm_extensions = get(g:, 'i8080_asm_extensions', default_asm_ext)
for asm_ext in g:i8080_asm_extensions
    call SetFileType (asm_ext, 'i8080')
endfor

" set the prn extensions
let g:i8080_enable_prn_highlighting = get(g:, 'i8080_enable_prn_highlighting', 1)
if g:i8080_enable_prn_highlighting == 1
    let default_prn_ext = [
        \ 'prn', 
        \ 'PRN',
        \ ]

    let g:i8080_prn_extensions = get(g:, 'i8080_prn_extensions', default_prn_ext)
    for prn_ext in g:i8080_prn_extensions
        call SetFileType (prn_ext, 'i8080prn')
    endfor
endif 


