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
" Latest Revision: Jan 17th 2024

if exists("b:current_syntax")
	finish
endif

"NOTE: cannot use `syn keyword` because vim sees '$' as a word seperator,
"while intel8080 mnemonics use it as a spacer (part of the word). To get
"around this "keywords" are match based.


" Directives
syn match intel8080AssemblerDirective /\v(\s|:|!|^)@<=(ORG|END|IF|ENDIF|EQU|SET|DB|DW|DS)(\s|!|$)@=/

" Register
syn match intel8080Register /\v(\s|,)@<=(A|B|C|D|E|H|L|M|SP|PSW)(\s|,|;|!|$)@=/

" OPCodes
syn match intel8080OPCode /\v(\s|:|!|^)@<=(MOV|LDAX|LDA|MVI|STA|STAX|LXI|LHLD|SHLD|SPHL|XCHG|XTHL|ADD|ADI|ADC|ACI|SUB|SUI|SBB|SBI|DAD|INR|DCR|INX|DCX|DI|EI|NOP|HLT|DAA|CMA|STC|CMC|RLC|RRC|RAL|RAR|ANA|ANI|XRA|XRI|ORA|ORI|CMP|CPI|JMP|JNZ|JZ|JNC|JC|JPO|JPE|JP|JM|PCHL|CALL|CNZ|CZ|CNC|CC|CPO|CPE|CP|CM|RET|RNZ|RZ|RNC|RC|RPO|RPE|RP|RM|RST|PUSH|POP|IN|OUT)(\s|!|;|$)@=/ nextgroup=intel8080SpecialSymbol,intel8080Register

" Numbers
syn match intel8080NumberDecimal     /\v(\s|[\-\+\*\/,]|^)@<=\d(\d|\$)*D=(\s|[\-+\*\/;!]|$)@=/
syn match intel8080NumberHexadecimal /\v(\s|[\-\+\*\/,]|^)@<=0(\x|\$)*H(\s|[\-+\*\/;!]|$)@=/
syn match intel8080NumberOctal       /\v(\s|[\-\+\*\/,]|^)@<=0(\o|\$)*[OQ](\s|[\-+\*\/;!]|$)@=/
syn match intel8080NumberBinary      /\v(\s|[\-\+\*\/,]|^)@<=0([01]|\$)*B(\s|[\-+\*\/;!]|$)@=/

" Strings
"NOTE: intel8080 mnemonics do not include escape sequences in their "strings",
"also they are NOT compatible with double quote's, ONLY single quotes.
syn region intel8080CharacterArray start=/\v'/ end=/\v'/

" Symbols
syn match intel8080SpecialSymbol /\v[\$,:!]/

" Comments
syn match intel8080CommentStyle1 /\v;.*$/ 
syn match intel8080CommentStyle2 /\v(!|^)@<=\*.*$/ 


" Pretty Coloring
hi link intel8080AssemblerDirective  Macro

hi link intel8080OPCode              Statement

hi link intel8080Register            Constant

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



