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


" Vim syntax file
" Language: intel 8080 assembly pnemonics
" Maintainer: Sage Hendricks
" Latest Revision: Feb 1st 2024

if exists("b:current_syntax")
	finish
endif

"NOTE: cannot use `syn keyword` because vim sees '$' as a word seperator,
"while intel8080 mnemonics use it as a spacer (part of the word). To get
"around this "keywords" are match based.

let global_dict=copy(g:)
let g:directive_style = get(global_dict, 'directive_style', 'CPM')

function! SyntaxMatch (key, regex, extra = '')
    let l:match_statement = 'syn match ' . a:key . ' /' . a:regex . '/ ' . a:extra
    "echom l:match_statement
    execute l:match_statement
endfunction

let re_mode = '\v\c' " Case insensitive verry magic

" OPCodes
let opcode_prefix = '(\s|[:!]|^)@<='
let opcode_suffix = '(\s|[!;]|$)@='
let opcode_extra  = 'nextgroup=intel8080SpecialSymbol,intel8080Register'
let opcode_list = [ 
 \   'MOV',  'LDAX', 'LDA',  'MVI',  'STA',  'STAX', 'LXI',  'LHLD', 'SHLD',
 \   'SPHL', 'XCHG', 'XTHL', 'ADD',  'ADI',  'ADC',  'ACI',  'SUB',  'SUI',  
 \   'SBB',  'SBI',  'DAD',  'INR',  'DCR',  'INX',  'DCX',  'DI',   'EI',
 \   'NOP',  'HLT',  'DAA',  'CMA',  'STC',  'CMC',  'RLC',  'RRC',  'RAL',
 \   'RAR',  'ANA',  'ANI',  'XRA',  'XRI',  'ORA',  'ORI',  'CMP',  'CPI',
 \   'JMP',  'JNZ',  'JZ',   'JNC',  'JC',   'JPO',  'JPE',  'JP',   'JM',
 \   'PCHL', 'CALL', 'CNZ',  'CZ',   'CNC',  'CC',   'CPO',  'CPE',  'CP',
 \   'CM',   'RET',  'RNZ',  'RZ',   'RNC',  'RC',   'RPO',  'RPE',  'RP',
 \   'RM',   'RST',  'PUSH', 'POP',  'IN',   'OUT' 
 \ ] 
let opcode_regex = re_mode . opcode_prefix . '(' . join(opcode_list, '|') . ')' . opcode_suffix
call SyntaxMatch('intel8080OPCode', opcode_regex, opcode_extra)


" Register
let register_prefix = '(\s|,)@<='
let register_suffix = '(\s|,|;|!|$)@='
let register_list = [ 'A', 'B', 'C', 'D', 'E', 'H', 'L', 'M', 'SP', 'PSW' ]
let register_regex = re_mode . register_prefix . '(' . join(register_list, '|') . ')' . register_suffix

"syn match intel8080Register /\v\c(\s|,)@<=(A|B|C|D|E|H|L|M|SP|PSW)(\s|,|;|!|$)@=/


if g:directive_style == 'CPM'
    " CP/M'S ASM.COM Styles
    
    " Directives
    syn match intel8080AssemblerDirective /\v\c(\s|:|!|^)@<=(ORG|END|IF|ENDIF|EQU|SET|DB|DW|DS)(\s|!|$)@=/
    syn match intel8080LogicKeywords /\v\c(\s)@<=(NOT|AND|OR|XOR|SHL|SHR)(\s)@=/
    syn match intel8080MathSymbols /\v[\+\-\*\/\(\)]/
    syn match intel8080MathKeywords /\v\c(\s)@<=(MOD)(\s)@=/

    " Numbers
    let num_prefix = '(\s|[\-\+\*\/\(\),]|^)@<='
    let num_suffix = '(\s|[\-\+\*\/\(\),;!]|$)@='
    
    let match_dec = '\d(\d|\$)*D='
    let match_hex = '0(\x|\$)*H'
    let match_oct = '0(\o|\$)*[QO]'
    let match_bin = '0([01]|\$)*B'

    let regex_dec = re_mode . num_prefix . match_dec . num_suffix
    let regex_hex = re_mode . num_prefix . match_hex . num_suffix
    let regex_oct = re_mode . num_prefix . match_oct . num_suffix
    let regex_bin = re_mode . num_prefix . match_bin . num_suffix

    call SyntaxMatch('intel8080NumberDecimal',     regex_dec)
    call SyntaxMatch('intel8080NumberHexadecimal', regex_hex)
    call SyntaxMatch('intel8080NumberOctal',       regex_oct)
    call SyntaxMatch('intel8080NumberBinary',      regex_bin)

    " Strings
    "NOTE: intel8080 mnemonics do not include escape sequences in their "strings",
    "also they are NOT compatible with double quote's, ONLY single quotes.
    syn region intel8080CharacterArray start=/\v'/ end=/\v'/

    " Symbols
    "syn match intel8080SpecialSymbol /\v[\$,:!]/
    let regex_symbols = re_mode . '[\$,:!]'
    call SyntaxMatch('intel8080SpecialSymbol', regex_symbols)

    " Comments
    syn match intel8080CommentStyle1 /\v;.*$/ 
    syn match intel8080CommentStyle2 /\v(!|^)@<=\*.*$/ 

else
    " If the directive_style isn't defined, throw an error
    echoerr 'No such directive style:' g:directive_style
endif

" Pretty Coloring
hi link intel8080AssemblerDirective  Define

hi link intel8080PreProcMath         PreProc
hi link intel8080MathKeywords        intel8080PreProcMath
hi link intel8080MathSymbols         intel8080PreProcMath

hi link intel8080PreProcLogic        PreProc
hi link intel8080LogicKeywords       intel8080PreProcLogic

hi link intel8080OPCode              Statement

hi link intel8080Register            Keyword

hi link intel8080Number              Number
hi link intel8080NumberBinary        intel8080Number
hi link intel8080NumberOctal         intel8080Number 
hi link intel8080NumberHexadecimal   intel8080Number 
hi link intel8080NumberDecimal       intel8080Number 

hi link intel8080CharacterArray      String

hi link intel8080SpecialSymbol       Special

hi link intel8080Comment             Comment
hi link intel8080CommentStyle1       intel8080Comment
hi link intel8080CommentStyle2       intel8080Comment



