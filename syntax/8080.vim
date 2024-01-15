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
" Latest Revision: Jan 14th 2024

if exists("b:current_syntax")
	finish
endif


" basic keyword matches
syn keyword inst MOV LDAX LDA MVI STA STAX LXI LHLD SHLD SPHL XCHG XTHL ADD ADI ADC ACI SUB SUI SBB SBI DAD INR DCR INX DCX DI EI NOP HLT DAA CMA STC CMC RLC RRC RAL RAR ANA ANI XRA XRI ORA ORI CMP CPI JMP JNZ JZ JNC JC JPO JPE JP JM PCHL CALL CNZ CZ CNC CC CPO CPE CP CM RET RNZ RZ RNC RC RPO RPE RP RM RST PUSH POP IN OUT contained
syn keyword reg16 B D H SP contained
syn keyword reg8 A B C D E H L M contained
syn keyword regstack PSW B D H SP contained

" opcodes
syn match instruction00 'NOP'                contains=inst
syn match instruction01 'LXI\s\+B,\s*'       contains=inst,reg16,symbols nextgroup=input
syn match instruction02 'STAX\s\+B'          contains=inst,reg16
syn match instruction03 'INX\s\+B'           contains=inst,reg16
syn match instruction04 'INR\s\+B'           contains=inst,reg8
syn match instruction05 'DCR\s\+B'           contains=inst,reg8
syn match instruction06 'MVI\s\+B,\s*'       contains=inst,reg8,symbols nextgroup=input
syn match instruction07 'RLC'                contains=inst
"syn match instruction08 '*NOP'               contains=inst
syn match instruction09 'DAD\s\+B'           contains=inst,reg16
syn match instruction0A 'LDAX\s\+B'          contains=inst,reg16
syn match instruction0B 'DCX\s\+B'           contains=inst,reg16
syn match instruction0C 'INR\s\+C'           contains=inst,reg8
syn match instruction0D 'DCR\s\+C'           contains=inst,reg8
syn match instruction0E 'MVI\s\+C,\s*'       contains=inst,reg8,symbols nextgroup=input
syn match instruction0F 'RRC'                contains=inst

"syn match instruction10 '*NOP'               contains=inst
syn match instruction11 'LXI\s\+D,\s*'       contains=inst,reg16,symbols nextgroup=input
syn match instruction12 'STAX\s\+D'          contains=inst,reg16
syn match instruction13 'INX\s\+D'           contains=inst,reg16
syn match instruction14 'INR\s\+D'           contains=inst,reg8
syn match instruction15 'DCR\s\+D'           contains=inst,reg8
syn match instruction16 'MVI\s\+D,\s*'       contains=inst,reg8,symbols nextgroup=input
syn match instruction17 'RAL'                contains=inst
"syn match instruction18 '*NOP'               contains=inst
syn match instruction19 'DAD\s\+D'           contains=inst,reg16
syn match instruction1A 'LDAX\s\+D'          contains=inst,reg16
syn match instruction1B 'DCX\s\+D'           contains=inst,reg16
syn match instruction1C 'INR\s\+E'           contains=inst,reg8
syn match instruction1D 'DCR\s\+E'           contains=inst,reg8
syn match instruction1E 'MVI\s\+E,\s*'       contains=inst,reg8,symbols nextgroup=input
syn match instruction1F 'RAR'                contains=inst

"syn match instruction20 '*NOP'               contains=inst
syn match instruction21 'LXI\s\+H,\s*'       contains=inst,reg16,symbols nextgroup=input
syn match instruction22 'SHLD\s\+'           contains=inst nextgroup=input
syn match instruction23 'INX\s\+H'           contains=inst,reg16
syn match instruction24 'INR\s\+H'           contains=inst,reg8
syn match instruction25 'DCR\s\+H'           contains=inst,reg8
syn match instruction26 'MVI\s\+H,\s*'       contains=inst,reg8,symbols nextgroup=input
syn match instruction27 'DAA'                contains=inst
"syn match instruction28 '*NOP'               contains=inst
syn match instruction29 'DAD\s\+H'           contains=inst,reg16
syn match instruction2A 'LHLD\s\+'           contains=inst nextgroup=input
syn match instruction2B 'DCX\s\+H'           contains=inst,reg16
syn match instruction2C 'INR\s\+L'           contains=inst,reg8
syn match instruction2D 'DCR\s\+L'           contains=inst,reg8
syn match instruction2E 'MVI\s\+L,\s*'       contains=inst,reg8,symbols nextgroup=input
syn match instruction2F 'CMA'                contains=inst

"syn match instruction30 '*NOP'               contains=inst
syn match instruction31 'LXI\s\+SP,\s*'      contains=inst,reg16,symbols nextgroup=input
syn match instruction32 'STA\s\+'            contains=inst nextgroup=input
syn match instruction33 'INX\s\+SP'          contains=inst,reg16
syn match instruction34 'INR\s\+M'           contains=inst,reg8
syn match instruction35 'DCR\s\+M'           contains=inst,reg8
syn match instruction36 'MVI\s\+M,\s*'       contains=inst,reg8,symbols nextgroup=input
syn match instruction37 'STC'                contains=inst
"syn match instruction38 '*NOP'               contains=inst
syn match instruction39 'DAD\s\+SP'          contains=inst,reg16
syn match instruction3A 'LDA\s\+'            contains=inst nextgroup=input
syn match instruction3B 'DCX\s\+SP'          contains=inst,reg16
syn match instruction3C 'INR\s\+A'           contains=inst,reg8
syn match instruction3D 'DCR\s\+A'           contains=inst,reg8
syn match instruction3E 'MVI\s\+A,\s*'       contains=inst,reg8,symbols nextgroup=input
syn match instruction3F 'CMC'                contains=inst

syn match instruction40 'MOV\s\+B,\s*B'      contains=inst,reg8,symbols
syn match instruction41 'MOV\s\+B,\s*C'      contains=inst,reg8,symbols
syn match instruction42 'MOV\s\+B,\s*D'      contains=inst,reg8,symbols
syn match instruction43 'MOV\s\+B,\s*E'      contains=inst,reg8,symbols
syn match instruction44 'MOV\s\+B,\s*H'      contains=inst,reg8,symbols
syn match instruction45 'MOV\s\+B,\s*L'      contains=inst,reg8,symbols
syn match instruction46 'MOV\s\+B,\s*M'      contains=inst,reg8,symbols
syn match instruction47 'MOV\s\+B,\s*A'      contains=inst,reg8,symbols
syn match instruction48 'MOV\s\+C,\s*B'      contains=inst,reg8,symbols
syn match instruction49 'MOV\s\+C,\s*C'      contains=inst,reg8,symbols
syn match instruction4A 'MOV\s\+C,\s*D'      contains=inst,reg8,symbols
syn match instruction4B 'MOV\s\+C,\s*E'      contains=inst,reg8,symbols
syn match instruction4C 'MOV\s\+C,\s*H'      contains=inst,reg8,symbols
syn match instruction4D 'MOV\s\+C,\s*L'      contains=inst,reg8,symbols
syn match instruction4E 'MOV\s\+C,\s*M'      contains=inst,reg8,symbols
syn match instruction4F 'MOV\s\+C,\s*A'      contains=inst,reg8,symbols

syn match instruction50 'MOV\s\+D,\s*B'      contains=inst,reg8,symbols
syn match instruction51 'MOV\s\+D,\s*C'      contains=inst,reg8,symbols
syn match instruction52 'MOV\s\+D,\s*D'      contains=inst,reg8,symbols
syn match instruction53 'MOV\s\+D,\s*E'      contains=inst,reg8,symbols
syn match instruction54 'MOV\s\+D,\s*H'      contains=inst,reg8,symbols
syn match instruction55 'MOV\s\+D,\s*L'      contains=inst,reg8,symbols
syn match instruction56 'MOV\s\+D,\s*M'      contains=inst,reg8,symbols
syn match instruction57 'MOV\s\+D,\s*A'      contains=inst,reg8,symbols
syn match instruction58 'MOV\s\+E,\s*B'      contains=inst,reg8,symbols
syn match instruction59 'MOV\s\+E,\s*C'      contains=inst,reg8,symbols
syn match instruction5A 'MOV\s\+E,\s*D'      contains=inst,reg8,symbols
syn match instruction5B 'MOV\s\+E,\s*E'      contains=inst,reg8,symbols
syn match instruction5C 'MOV\s\+E,\s*H'      contains=inst,reg8,symbols
syn match instruction5D 'MOV\s\+E,\s*L'      contains=inst,reg8,symbols
syn match instruction5E 'MOV\s\+E,\s*M'      contains=inst,reg8,symbols
syn match instruction5F 'MOV\s\+E,\s*A'      contains=inst,reg8,symbols

syn match instruction60 'MOV\s\+H,\s*B'      contains=inst,reg8,symbols
syn match instruction61 'MOV\s\+H,\s*C'      contains=inst,reg8,symbols
syn match instruction62 'MOV\s\+H,\s*D'      contains=inst,reg8,symbols
syn match instruction63 'MOV\s\+H,\s*E'      contains=inst,reg8,symbols
syn match instruction64 'MOV\s\+H,\s*H'      contains=inst,reg8,symbols
syn match instruction65 'MOV\s\+H,\s*L'      contains=inst,reg8,symbols
syn match instruction66 'MOV\s\+H,\s*M'      contains=inst,reg8,symbols
syn match instruction67 'MOV\s\+H,\s*A'      contains=inst,reg8,symbols
syn match instruction68 'MOV\s\+L,\s*B'      contains=inst,reg8,symbols
syn match instruction69 'MOV\s\+L,\s*C'      contains=inst,reg8,symbols
syn match instruction6A 'MOV\s\+L,\s*D'      contains=inst,reg8,symbols
syn match instruction6B 'MOV\s\+L,\s*E'      contains=inst,reg8,symbols
syn match instruction6C 'MOV\s\+L,\s*H'      contains=inst,reg8,symbols
syn match instruction6D 'MOV\s\+L,\s*L'      contains=inst,reg8,symbols
syn match instruction6E 'MOV\s\+L,\s*M'      contains=inst,reg8,symbols
syn match instruction6F 'MOV\s\+L,\s*A'      contains=inst,reg8,symbols

syn match instruction70 'MOV\s\+M,\s*B'      contains=inst,reg8,symbols
syn match instruction71 'MOV\s\+M,\s*C'      contains=inst,reg8,symbols
syn match instruction72 'MOV\s\+M,\s*D'      contains=inst,reg8,symbols
syn match instruction73 'MOV\s\+M,\s*E'      contains=inst,reg8,symbols
syn match instruction74 'MOV\s\+M,\s*H'      contains=inst,reg8,symbols
syn match instruction75 'MOV\s\+M,\s*L'      contains=inst,reg8,symbols
syn match instruction76 'HLT'                contains=inst
syn match instruction77 'MOV\s\+M,\s*A'      contains=inst,reg8,symbols
syn match instruction78 'MOV\s\+A,\s*B'      contains=inst,reg8,symbols
syn match instruction79 'MOV\s\+A,\s*C'      contains=inst,reg8,symbols
syn match instruction7A 'MOV\s\+A,\s*D'      contains=inst,reg8,symbols
syn match instruction7B 'MOV\s\+A,\s*E'      contains=inst,reg8,symbols
syn match instruction7C 'MOV\s\+A,\s*H'      contains=inst,reg8,symbols
syn match instruction7D 'MOV\s\+A,\s*L'      contains=inst,reg8,symbols
syn match instruction7E 'MOV\s\+A,\s*M'      contains=inst,reg8,symbols
syn match instruction7F 'MOV\s\+A,\s*A'      contains=inst,reg8,symbols

syn match instruction80 'ADD\s\+B'           contains=inst,reg8
syn match instruction81 'ADD\s\+C'           contains=inst,reg8
syn match instruction82 'ADD\s\+D'           contains=inst,reg8
syn match instruction83 'ADD\s\+E'           contains=inst,reg8
syn match instruction84 'ADD\s\+H'           contains=inst,reg8
syn match instruction85 'ADD\s\+L'           contains=inst,reg8
syn match instruction86 'ADD\s\+M'           contains=inst,reg8
syn match instruction87 'ADD\s\+A'           contains=inst,reg8
syn match instruction88 'ADC\s\+B'           contains=inst,reg8
syn match instruction89 'ADC\s\+C'           contains=inst,reg8
syn match instruction8A 'ADC\s\+D'           contains=inst,reg8
syn match instruction8B 'ADC\s\+E'           contains=inst,reg8
syn match instruction8C 'ADC\s\+H'           contains=inst,reg8
syn match instruction8D 'ADC\s\+L'           contains=inst,reg8
syn match instruction8E 'ADC\s\+M'           contains=inst,reg8
syn match instruction8F 'ADC\s\+A'           contains=inst,reg8

syn match instruction90 'SUB\s\+B'           contains=inst,reg8
syn match instruction91 'SUB\s\+C'           contains=inst,reg8
syn match instruction92 'SUB\s\+D'           contains=inst,reg8
syn match instruction93 'SUB\s\+E'           contains=inst,reg8
syn match instruction94 'SUB\s\+H'           contains=inst,reg8
syn match instruction95 'SUB\s\+L'           contains=inst,reg8
syn match instruction96 'SUB\s\+M'           contains=inst,reg8
syn match instruction97 'SUB\s\+A'           contains=inst,reg8
syn match instruction98 'SBB\s\+B'           contains=inst,reg8
syn match instruction99 'SBB\s\+C'           contains=inst,reg8
syn match instruction9A 'SBB\s\+D'           contains=inst,reg8
syn match instruction9B 'SBB\s\+E'           contains=inst,reg8
syn match instruction9C 'SBB\s\+H'           contains=inst,reg8
syn match instruction9D 'SBB\s\+L'           contains=inst,reg8
syn match instruction9E 'SBB\s\+M'           contains=inst,reg8
syn match instruction9F 'SBB\s\+A'           contains=inst,reg8

syn match instructionA0 'ANA\s\+B'           contains=inst,reg8
syn match instructionA1 'ANA\s\+C'           contains=inst,reg8
syn match instructionA2 'ANA\s\+D'           contains=inst,reg8
syn match instructionA3 'ANA\s\+E'           contains=inst,reg8
syn match instructionA6 'ANA\s\+M'           contains=inst,reg8
syn match instructionA7 'ANA\s\+A'           contains=inst,reg8
syn match instructionA8 'XRA\s\+B'           contains=inst,reg8
syn match instructionA9 'XRA\s\+C'           contains=inst,reg8
syn match instructionAA 'XRA\s\+D'           contains=inst,reg8
syn match instructionAB 'XRA\s\+E'           contains=inst,reg8
syn match instructionAC 'XRA\s\+H'           contains=inst,reg8
syn match instructionAD 'XRA\s\+L'           contains=inst,reg8
syn match instructionAE 'XRA\s\+M'           contains=inst,reg8
syn match instructionAF 'XRA\s\+A'           contains=inst,reg8

syn match instructionB0 'ORA\s\+B'           contains=inst,reg8
syn match instructionB1 'ORA\s\+C'           contains=inst,reg8
syn match instructionB2 'ORA\s\+D'           contains=inst,reg8
syn match instructionB3 'ORA\s\+E'           contains=inst,reg8
syn match instructionB4 'ORA\s\+H'           contains=inst,reg8
syn match instructionB5 'ORA\s\+L'           contains=inst,reg8
syn match instructionB6 'ORA\s\+M'           contains=inst,reg8
syn match instructionB7 'ORA\s\+A'           contains=inst,reg8
syn match instructionB8 'CMP\s\+B'           contains=inst,reg8
syn match instructionB9 'CMP\s\+C'           contains=inst,reg8
syn match instructionBA 'CMP\s\+D'           contains=inst,reg8
syn match instructionBB 'CMP\s\+E'           contains=inst,reg8
syn match instructionBC 'CMP\s\+H'           contains=inst,reg8
syn match instructionBD 'CMP\s\+L'           contains=inst,reg8
syn match instructionBE 'CMP\s\+M'           contains=inst,reg8
syn match instructionBF 'CMP\s\+A'           contains=inst,reg8

syn match instructionC0 'RNZ'                contains=inst
syn match instructionC1 'POP\s\+B'           contains=inst,regstack
syn match instructionC2 'JNZ\s\+'            contains=inst nextgroup=input
syn match instructionC3 'JMP\s\+'            contains=inst nextgroup=input
syn match instructionC4 'CNZ\s\+'            contains=inst nextgroup=input
syn match instructionC5 'PUSH\s\+B'          contains=inst,regstack
syn match instructionC6 'ADI\s\+'            contains=inst nextgroup=input
"syn match instructionC7 'RST\s\+0'           contains=inst,numberWrapper
syn match instructionC8 'RZ'                 contains=inst
syn match instructionC9 'RET'                contains=inst
syn match instructionCA 'JZ\s\+'             contains=inst nextgroup=input
"syn match instructionCB '*JMP '              contains=inst nextgroup=input
syn match instructionCC 'CZ\s\+'             contains=inst nextgroup=input
syn match instructionCD 'CALL\s\+'           contains=inst nextgroup=input
syn match instructionCE 'ACI\s\+'            contains=inst nextgroup=input
"syn match instructionCF 'RST\s\+1'           contains=inst,numberWrapper

syn match instructionD0 'RNC'                contains=inst
syn match instructionD1 'POP\s\+D'           contains=inst,regstack
syn match instructionD2 'JNC\s\+'            contains=inst nextgroup=input
syn match instructionD3 'OUT\s\+'            contains=inst nextgroup=input
syn match instructionD4 'CNC\s\+'            contains=inst nextgroup=input
syn match instructionD5 'PUSH\s\+D'          contains=inst,regstack
syn match instructionD6 'SUI\s\+'            contains=inst nextgroup=input
"syn match instructionD7 'RST\s\+2'           contains=inst,numberWrapper
syn match instructionD8 'RC'                 contains=inst
"syn match instructionD9 '*RET'               contains=inst
syn match instructionDA 'JC\s\+'             contains=inst nextgroup=input
syn match instructionDB 'IN\s\+'             contains=inst nextgroup=input
syn match instructionDC 'CC\s\+'             contains=inst nextgroup=input
"syn match instructionDD '*CALL '             contains=inst nextgroup=input
syn match instructionDE 'SBI\s\+'            contains=inst nextgroup=input
"syn match instructionDF 'RST\s\+3'           contains=inst,numberWrapper

syn match instructionE0 'RPO'                contains=inst
syn match instructionE1 'POP\s\+H'           contains=inst,regstack
syn match instructionE2 'JP\s\+'             contains=inst nextgroup=input
syn match instructionE3 'JPO\s\+'            contains=inst nextgroup=input
syn match instructionE4 'XTHL'               contains=inst
syn match instructionE5 'CPO\s\+'            contains=inst nextgroup=input
syn match instructionE6 'PUSH\s\+H'          contains=inst,regstack
syn match instructionE7 'ANI\s\+'            contains=inst nextgroup=input
"syn match instructionE8 'RST\s\+4'           contains=inst,numberWrapper
syn match instructionE9 'RPE'                contains=inst
syn match instructionEA 'PCHL'               contains=inst
syn match instructionEB 'XCHG'               contains=inst
syn match instructionEC 'CPE\s\+'            contains=inst nextgroup=input
"syn match instructionED '*CALL '             contains=inst nextgroup=input
syn match instructionEE 'XRI\s\+'            contains=inst nextgroup=input
"syn match instructionEF 'RST\s\+5'           contains=inst,numberWrapper

syn match instructionF0 'RP'                 contains=inst
syn match instructionF1 'POP\s\+PSW'         contains=inst,regstack
syn match instructionF2 'JP\s\+'             contains=inst nextgroup=input
syn match instructionF3 'DI'                 contains=inst
syn match instructionF4 'CP\s\+'             contains=inst nextgroup=input
syn match instructionF5 'PUSH\s\+PSW'        contains=inst,regstack
syn match instructionF6 'ORI\s\+'            contains=inst nextgroup=input
"syn match instructionF7 'RST\s\+6'           contains=inst,numberWrapper
syn match instructionF8 'RM'                 contains=inst
syn match instructionF9 'SPHL'               contains=inst
syn match instructionFA 'JM\s\+'             contains=inst nextgroup=input
syn match instructionFB 'EI'                 contains=inst
syn match instructionFC 'CM\s\+'             contains=inst nextgroup=input
"syn match instructionFD '*CALL '             contains=inst nextgroup=input
syn match instructionFE 'CPI\s\+'            contains=inst nextgroup=input
"syn match instructionFF 'RST\s\+7'           contains=inst,numberWrapper
syn match instructionRST 'RST\s\+'           contains=inst nextgroup=input

" Random Symbols

" Comments
syn match commentStyle1 ';.*$' 
syn match commentStyle1 '^\*.*$' 

"syn match labeldef '\(\a\|\d\|$\)\+:\=' contained

" numbers
syn match numberWrapper '\(\x\|\$\)\+[BOQHD]\=' contained contains=numBin,numHex,numOct,numDec
syn match numDec '\d\(\d\|\$\)*\($\|D\)' contained
syn match numHex '0\(\x\|\$\)*H' contained
syn match numOct '0\(\o\|\$\)*[OQ]' contained
syn match numBin '0\([01]\|\$\)*B' contained

" String
syn match string '\'.*\'' contained

" Directives
syn keyword directive ORG END IF ENDIF EQU SET DB DW DS contained
syn match dirDefine 'D[BWS]\s\+' contains=directive nextgroup=input
syn match dirOrigin 'ORG\s\+' contains=directive nextgroup=input
syn match dirEnd 'END\($\|\s\+\)' contains=directive nextgroup=input
syn match dirConstant_step1 '\(\d\|\a\|\$\)\+\(:\=\s*\|\s\+\)\(EQU\|SET\)[^;!\n]\+' contains=dirConstant_step2,symbols
syn match dirConstant_step2 '\(\s\|:\)\(EQU\|SET\)\s\+' contained contains=directive nextgroup=input



" input
syn match input '[^;!\n]\+' contained contains=symbols,string,numberWrapper

syn match symbols '[\$,:!]'

"hi link labeldef Label

hi link inst Statement

hi link reg8 Constant
hi link reg16 Constant 
hi link regstack Constant

hi link numBin Number
hi link numOct Number
hi link numHex Number
hi link numDec Number

hi link string String

hi link symbols Special

hi link commentStyle1 Comment
hi link commentStyle2 Commwnt

hi link directive Macro

