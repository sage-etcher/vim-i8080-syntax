"
"  This file is a part of the intel 8080 syntax highlighting plugin
"
"  Copyright 2023 Sage I. Hendricks
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
" Latest Revision: Oct 27 2023

if exists("b:current_syntax")
	finish
endif


" Keywords
syn keyword i8080InstructionRegister MOV LDAX LDA MVI STA STAX
syn keyword i8080InstructionRegisterPair LXI LHLD SHLD SPHL XCHG XTHL
syn keyword i8080InstructionArithmetic ADD ADI ADC ACI SUB SUI SBB SBI DAD INR DCR INX DCX
syn keyword i8080InstructionControl DI EI NOP HLT
syn keyword i8080InstructionFlag DAA CMA STC CMC
syn keyword i8080InstructionRotate RLC RRC RAL RAR
syn keyword i8080InstructionLogical ANA ANI XRA XRI ORA ORI
syn keyword i8080InstructionBranch CMP CPI JMP JNZ JZ JNC JC JPO JPE JP JM PCHL CALL CNZ CZ CNC CC CPO CPE CP CM RET RNZ RZ RNC RC RPO RPE RP RM RST
syn keyword i8080InstructionStack PUSH POP
syn keyword i8080InstructionOther IN OUT

syn keyword i8080Register A B C D E F H L AF BC DE HL M SP PSW

syn keyword i8080Dirrective ORG END EQU SET IF ENDIF DB DW DS

" Matches
syn match i8080DirrectiveSymbol '\(\$\|!\)'
syn match i8080ArithmeticOperator '\(\%u002b\|-\|\*\|\/\|MOD\|(\|)\)'
syn match i8080LogicalOperator '\(NOT\|AND\|OR\|XOR\|SHL\|SHR\)'

syn match i8080GeneralSymbol '\(:\|,\)'

syn match i8080DecNumber '\d\+'
syn match i8080BinNumber '[01]\+B'
syn match i8080OctNumber '\o\+\(O\|Q\|o\|q\)'
syn match i8080HexNumber '0\=\x\+\(H\|h\)'
syn match i8080AltHexNumber '0x\x\+'

syn match i8080String '\'[^\n\']*\''
syn match i8008IllegalString '\"[^\n\"]*\"'

syn match i8080Comment ';[^\n]*'
syn match i8080Comment2 '^\*[^\n]*'


" Syntax Highlighting
let b:current_syntax = "8080"

hi def link i8080Instruction 				Statement
hi def link i8080InstructionRegister 		i8080Instruction
hi def link i8080InstructionRegisterPair 	i8080Instruction
hi def link i8080InstructionArithmetic 		i8080Instruction
hi def link i8080InstructionControl 		i8080Instruction
hi def link i8080InstructionFlag 			i8080Instruction
hi def link i8080InstructionRotate 			i8080Instruction
hi def link i8080InstructionLogical 		i8080Instruction
hi def link i8080InstructionBranch 			i8080Instruction
hi def link i8080InstructionStack 			i8080Instruction
hi def link i8080InstructionOther 			i8080Instruction

hi def link i8080Register 					Constant

hi def link i8080Dirrective 				Macro
hi def link i8080DirrectiveSymbol			i8080Dirrective
hi def link i8080ArithmeticOperator			i8080Dirrective
hi def link i8080LogicalOperator			i8080Dirrective

hi def link i8080GeneralSymbol				Special

hi def link i8080Number						Number
hi def link i8080DecNumber					i8080Number
hi def link i8080BinNumber					i8080Number
hi def link i8080HexNumber					i8080Number
hi def link i8080OctNumber					i8080Number
hi def link i8080AltHexNumber				i8080Number

hi def link i8080String 					String
hi def link i8080IllegalString				Error

hi def link i8080Comment					Comment
hi def link i8080Comment2					i8080Comment


