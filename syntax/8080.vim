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
syn keyword intel8080OPCode MOV LDAX LDA MVI STA STAX LXI LHLD SHLD SPHL XCHG XTHL ADD ADI ADC ACI SUB SUI SBB SBI DAD INR DCR INX DCX DI EI NOP HLT DAA CMA STC CMC RLC RRC RAL RAR ANA ANI XRA XRI ORA ORI CMP CPI JMP JNZ JZ JNC JC JPO JPE JP JM PCHL CALL CNZ CZ CNC CC CPO CPE CP CM RET RNZ RZ RNC RC RPO RPE RP RM RST PUSH POP IN OUT contained
syn keyword intel8080Register8Bit  A B C D E H L M contained
syn keyword intel8080Register16Bit B D H SP        contained
syn keyword intel8080RegisterStack PSW B D H SP    contained

"

" OPCodes
syn match intel8080OPCode00wrapper 'NOP'                contains=intel8080OPCode
syn match intel8080OPCode01wrapper 'LXI\s\+B,\s*'       contains=intel8080OPCode,intel8080Register16Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode02wrapper 'STAX\s\+B'          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode03wrapper 'INX\s\+B'           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode04wrapper 'INR\s\+B'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode05wrapper 'DCR\s\+B'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode06wrapper 'MVI\s\+B,\s*'       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode07wrapper 'RLC'                contains=intel8080OPCode
"syn match intel8080OPCode08wrapper '*NOP'               contains=intel8080OPCode
syn match intel8080OPCode09wrapper 'DAD\s\+B'           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode0Awrapper 'LDAX\s\+B'          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode0Bwrapper 'DCX\s\+B'           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode0Cwrapper 'INR\s\+C'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode0Dwrapper 'DCR\s\+C'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode0Ewrapper 'MVI\s\+C,\s*'       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode0Fwrapper 'RRC'                contains=intel8080OPCode

"syn match intel8080OPCode10wrapper '*NOP'               contains=intel8080OPCode
syn match intel8080OPCode11wrapper 'LXI\s\+D,\s*'       contains=intel8080OPCode,intel8080Register16Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode12wrapper 'STAX\s\+D'          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode13wrapper 'INX\s\+D'           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode14wrapper 'INR\s\+D'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode15wrapper 'DCR\s\+D'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode16wrapper 'MVI\s\+D,\s*'       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode17wrapper 'RAL'                contains=intel8080OPCode
"syn match intel8080OPCode18wrapper '*NOP'               contains=intel8080OPCode
syn match intel8080OPCode19wrapper 'DAD\s\+D'           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode1Awrapper 'LDAX\s\+D'          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode1Bwrapper 'DCX\s\+D'           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode1Cwrapper 'INR\s\+E'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode1Dwrapper 'DCR\s\+E'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode1Ewrapper 'MVI\s\+E,\s*'       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode1Fwrapper 'RAR'                contains=intel8080OPCode

"syn match intel8080OPCode20wrapper '*NOP'               contains=intel8080OPCode
syn match intel8080OPCode21wrapper 'LXI\s\+H,\s*'       contains=intel8080OPCode,intel8080Register16Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode22wrapper 'SHLD\s\+'           contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCode23wrapper 'INX\s\+H'           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode24wrapper 'INR\s\+H'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode25wrapper 'DCR\s\+H'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode26wrapper 'MVI\s\+H,\s*'       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode27wrapper 'DAA'                contains=intel8080OPCode
"syn match intel8080OPCode28wrapper '*NOP'               contains=intel8080OPCode
syn match intel8080OPCode29wrapper 'DAD\s\+H'           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode2Awrapper 'LHLD\s\+'           contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCode2Bwrapper 'DCX\s\+H'           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode2Cwrapper 'INR\s\+L'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode2Dwrapper 'DCR\s\+L'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode2Ewrapper 'MVI\s\+L,\s*'       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode2Fwrapper 'CMA'                contains=intel8080OPCode

"syn match intel8080OPCode30wrapper '*NOP'               contains=intel8080OPCode
syn match intel8080OPCode31wrapper 'LXI\s\+SP,\s*'      contains=intel8080OPCode,intel8080Register16Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode32wrapper 'STA\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCode33wrapper 'INX\s\+SP'          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode34wrapper 'INR\s\+M'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode35wrapper 'DCR\s\+M'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode36wrapper 'MVI\s\+M,\s*'       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode37wrapper 'STC'                contains=intel8080OPCode
"syn match intel8080OPCode38wrapper '*NOP'               contains=intel8080OPCode
syn match intel8080OPCode39wrapper 'DAD\s\+SP'          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode3Awrapper 'LDA\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCode3Bwrapper 'DCX\s\+SP'          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode3Cwrapper 'INR\s\+A'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode3Dwrapper 'DCR\s\+A'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode3Ewrapper 'MVI\s\+A,\s*'       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode3Fwrapper 'CMC'                contains=intel8080OPCode

syn match intel8080OPCode40wrapper 'MOV\s\+B,\s*B'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode41wrapper 'MOV\s\+B,\s*C'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode42wrapper 'MOV\s\+B,\s*D'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode43wrapper 'MOV\s\+B,\s*E'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode44wrapper 'MOV\s\+B,\s*H'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode45wrapper 'MOV\s\+B,\s*L'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode46wrapper 'MOV\s\+B,\s*M'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode47wrapper 'MOV\s\+B,\s*A'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode48wrapper 'MOV\s\+C,\s*B'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode49wrapper 'MOV\s\+C,\s*C'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Awrapper 'MOV\s\+C,\s*D'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Bwrapper 'MOV\s\+C,\s*E'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Cwrapper 'MOV\s\+C,\s*H'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Dwrapper 'MOV\s\+C,\s*L'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Ewrapper 'MOV\s\+C,\s*M'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Fwrapper 'MOV\s\+C,\s*A'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol

syn match intel8080OPCode50wrapper 'MOV\s\+D,\s*B'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode51wrapper 'MOV\s\+D,\s*C'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode52wrapper 'MOV\s\+D,\s*D'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode53wrapper 'MOV\s\+D,\s*E'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode54wrapper 'MOV\s\+D,\s*H'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode55wrapper 'MOV\s\+D,\s*L'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode56wrapper 'MOV\s\+D,\s*M'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode57wrapper 'MOV\s\+D,\s*A'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode58wrapper 'MOV\s\+E,\s*B'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode59wrapper 'MOV\s\+E,\s*C'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Awrapper 'MOV\s\+E,\s*D'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Bwrapper 'MOV\s\+E,\s*E'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Cwrapper 'MOV\s\+E,\s*H'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Dwrapper 'MOV\s\+E,\s*L'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Ewrapper 'MOV\s\+E,\s*M'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Fwrapper 'MOV\s\+E,\s*A'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol

syn match intel8080OPCode60wrapper 'MOV\s\+H,\s*B'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode61wrapper 'MOV\s\+H,\s*C'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode62wrapper 'MOV\s\+H,\s*D'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode63wrapper 'MOV\s\+H,\s*E'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode64wrapper 'MOV\s\+H,\s*H'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode65wrapper 'MOV\s\+H,\s*L'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode66wrapper 'MOV\s\+H,\s*M'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode67wrapper 'MOV\s\+H,\s*A'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode68wrapper 'MOV\s\+L,\s*B'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode69wrapper 'MOV\s\+L,\s*C'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Awrapper 'MOV\s\+L,\s*D'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Bwrapper 'MOV\s\+L,\s*E'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Cwrapper 'MOV\s\+L,\s*H'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Dwrapper 'MOV\s\+L,\s*L'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Ewrapper 'MOV\s\+L,\s*M'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Fwrapper 'MOV\s\+L,\s*A'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol

syn match intel8080OPCode70wrapper 'MOV\s\+M,\s*B'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode71wrapper 'MOV\s\+M,\s*C'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode72wrapper 'MOV\s\+M,\s*D'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode73wrapper 'MOV\s\+M,\s*E'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode74wrapper 'MOV\s\+M,\s*H'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode75wrapper 'MOV\s\+M,\s*L'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode76wrapper 'HLT'                contains=intel8080OPCode
syn match intel8080OPCode77wrapper 'MOV\s\+M,\s*A'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode78wrapper 'MOV\s\+A,\s*B'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode79wrapper 'MOV\s\+A,\s*C'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Awrapper 'MOV\s\+A,\s*D'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Bwrapper 'MOV\s\+A,\s*E'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Cwrapper 'MOV\s\+A,\s*H'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Dwrapper 'MOV\s\+A,\s*L'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Ewrapper 'MOV\s\+A,\s*M'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Fwrapper 'MOV\s\+A,\s*A'      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol

syn match intel8080OPCode80wrapper 'ADD\s\+B'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode81wrapper 'ADD\s\+C'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode82wrapper 'ADD\s\+D'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode83wrapper 'ADD\s\+E'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode84wrapper 'ADD\s\+H'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode85wrapper 'ADD\s\+L'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode86wrapper 'ADD\s\+M'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode87wrapper 'ADD\s\+A'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode88wrapper 'ADC\s\+B'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode89wrapper 'ADC\s\+C'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Awrapper 'ADC\s\+D'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Bwrapper 'ADC\s\+E'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Cwrapper 'ADC\s\+H'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Dwrapper 'ADC\s\+L'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Ewrapper 'ADC\s\+M'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Fwrapper 'ADC\s\+A'           contains=intel8080OPCode,intel8080Register8Bit

syn match intel8080OPCode90wrapper 'SUB\s\+B'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode91wrapper 'SUB\s\+C'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode92wrapper 'SUB\s\+D'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode93wrapper 'SUB\s\+E'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode94wrapper 'SUB\s\+H'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode95wrapper 'SUB\s\+L'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode96wrapper 'SUB\s\+M'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode97wrapper 'SUB\s\+A'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode98wrapper 'SBB\s\+B'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode99wrapper 'SBB\s\+C'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Awrapper 'SBB\s\+D'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Bwrapper 'SBB\s\+E'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Cwrapper 'SBB\s\+H'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Dwrapper 'SBB\s\+L'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Ewrapper 'SBB\s\+M'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Fwrapper 'SBB\s\+A'           contains=intel8080OPCode,intel8080Register8Bit

syn match intel8080OPCodeA0wrapper 'ANA\s\+B'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA1wrapper 'ANA\s\+C'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA2wrapper 'ANA\s\+D'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA3wrapper 'ANA\s\+E'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA6wrapper 'ANA\s\+M'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA7wrapper 'ANA\s\+A'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA8wrapper 'XRA\s\+B'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA9wrapper 'XRA\s\+C'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeAAwrapper 'XRA\s\+D'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeABwrapper 'XRA\s\+E'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeACwrapper 'XRA\s\+H'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeADwrapper 'XRA\s\+L'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeAEwrapper 'XRA\s\+M'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeAFwrapper 'XRA\s\+A'           contains=intel8080OPCode,intel8080Register8Bit

syn match intel8080OPCodeB0wrapper 'ORA\s\+B'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB1wrapper 'ORA\s\+C'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB2wrapper 'ORA\s\+D'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB3wrapper 'ORA\s\+E'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB4wrapper 'ORA\s\+H'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB5wrapper 'ORA\s\+L'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB6wrapper 'ORA\s\+M'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB7wrapper 'ORA\s\+A'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB8wrapper 'CMP\s\+B'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB9wrapper 'CMP\s\+C'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBAwrapper 'CMP\s\+D'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBBwrapper 'CMP\s\+E'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBCwrapper 'CMP\s\+H'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBDwrapper 'CMP\s\+L'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBEwrapper 'CMP\s\+M'           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBFwrapper 'CMP\s\+A'           contains=intel8080OPCode,intel8080Register8Bit

syn match intel8080OPCodeC0wrapper 'RNZ'                contains=intel8080OPCode
syn match intel8080OPCodeC1wrapper 'POP\s\+B'           contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeC2wrapper 'JNZ\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeC3wrapper 'JMP\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeC4wrapper 'CNZ\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeC5wrapper 'PUSH\s\+B'          contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeC6wrapper 'ADI\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeC7wrapper 'RST\s\+0'           contains=intel8080OPCode,intel8080NumberWrapper
syn match intel8080OPCodeC8wrapper 'RZ'                 contains=intel8080OPCode
syn match intel8080OPCodeC9wrapper 'RET'                contains=intel8080OPCode
syn match intel8080OPCodeCAwrapper 'JZ\s\+'             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeCBwrapper '*JMP '              contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeCCwrapper 'CZ\s\+'             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeCDwrapper 'CALL\s\+'           contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeCEwrapper 'ACI\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeCFwrapper 'RST\s\+1'           contains=intel8080OPCode,intel8080NumberWrapper

syn match intel8080OPCodeD0wrapper 'RNC'                contains=intel8080OPCode
syn match intel8080OPCodeD1wrapper 'POP\s\+D'           contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeD2wrapper 'JNC\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeD3wrapper 'OUT\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeD4wrapper 'CNC\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeD5wrapper 'PUSH\s\+D'          contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeD6wrapper 'SUI\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeD7wrapper 'RST\s\+2'           contains=intel8080OPCode,intel8080NumberWrapper
syn match intel8080OPCodeD8wrapper 'RC'                 contains=intel8080OPCode
"syn match intel8080OPCodeD9wrapper '*RET'               contains=intel8080OPCode
syn match intel8080OPCodeDAwrapper 'JC\s\+'             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeDBwrapper 'IN\s\+'             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeDCwrapper 'CC\s\+'             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeDDwrapper '*CALL '             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeDEwrapper 'SBI\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeDFwrapper 'RST\s\+3'           contains=intel8080OPCode,intel8080NumberWrapper

syn match intel8080OPCodeE0wrapper 'RPO'                contains=intel8080OPCode
syn match intel8080OPCodeE1wrapper 'POP\s\+H'           contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeE2wrapper 'JP\s\+'             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeE3wrapper 'JPO\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeE4wrapper 'XTHL'               contains=intel8080OPCode
syn match intel8080OPCodeE5wrapper 'CPO\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeE6wrapper 'PUSH\s\+H'          contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeE7wrapper 'ANI\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeE8wrapper 'RST\s\+4'           contains=intel8080OPCode,intel8080NumberWrapper
syn match intel8080OPCodeE9wrapper 'RPE'                contains=intel8080OPCode
syn match intel8080OPCodeEAwrapper 'PCHL'               contains=intel8080OPCode
syn match intel8080OPCodeEBwrapper 'XCHG'               contains=intel8080OPCode
syn match intel8080OPCodeECwrapper 'CPE\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeEDwrapper '*CALL '             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeEEwrapper 'XRI\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeEFwrapper 'RST\s\+5'           contains=intel8080OPCode,intel8080NumberWrapper

syn match intel8080OPCodeF0wrapper 'RP'                 contains=intel8080OPCode
syn match intel8080OPCodeF1wrapper 'POP\s\+PSW'         contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeF2wrapper 'JP\s\+'             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeF3wrapper 'DI'                 contains=intel8080OPCode
syn match intel8080OPCodeF4wrapper 'CP\s\+'             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeF5wrapper 'PUSH\s\+PSW'        contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeF6wrapper 'ORI\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeF7wrapper 'RST\s\+6'           contains=intel8080OPCode,intel8080NumberWrapper
syn match intel8080OPCodeF8wrapper 'RM'                 contains=intel8080OPCode
syn match intel8080OPCodeF9wrapper 'SPHL'               contains=intel8080OPCode
syn match intel8080OPCodeFAwrapper 'JM\s\+'             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeFBwrapper 'EI'                 contains=intel8080OPCode
syn match intel8080OPCodeFCwrapper 'CM\s\+'             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeFDwrapper '*CALL '             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeFEwrapper 'CPI\s\+'            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeFFwrapper 'RST\s\+7'           contains=intel8080OPCode,intel8080NumberWrapper
"
syn match intel8080OPCodeRSTwrapper 'RST\s\+'           contains=intel8080OPCode nextgroup=intel8080ImplicitInput

" Random Symbols

" Comments
syn match intel8080CommentStyle1 ';.*$' 
syn match intel8080CommentStyle2 '\(!\|^\)\*.*$' 

"syn match labeldef '\(\a\|\d\|$\)\+:\=' contained

" numbers
"syn match intel8080NumberWrapper '\(\x\|\$\)\+[BOQHD]\=' contained contains=intel8080NumberBinary,intel8080NumberHexadecimal,intel8080NumberOctal,intel8080NumberDecimal
syn match intel8080NumberWrapper '\(\a\|\$\)\@<!\(\d\(\x\|\$\)*[BOQHD]\=\)\(\a\|\$\)\@!' contained contains=intel8080NumberBinary,intel8080NumberHexadecimal,intel8080NumberOctal,intel8080NumberDecimal,intel8080SpecialSymbol
syn match intel8080NumberDecimal     '\d\(\d\|\$\)*D\=' contained
syn match intel8080NumberHexadecimal '0\(\x\|\$\)*H'    contained
syn match intel8080NumberOctal       '0\(\o\|\$\)*[OQ]' contained
syn match intel8080NumberBinary      '0\([01]\|\$\)*B'  contained

" String
syn region intel8080CharacterArray start='\'' end='\'' contained

" Directives
syn keyword intel8080AssemblerDirective ORG END IF ENDIF EQU SET DB DW DS contained
syn match intel8080DefineData 'D[BWS]\s\+'     contains=intel8080AssemblerDirective nextgroup=intel8080ImplicitInput
syn match intel8080SetOrigin  'ORG\s\+'        contains=intel8080AssemblerDirective nextgroup=intel8080ImplicitInput
syn match intel8080SetEnd     'END\($\|\s\+\)' contains=intel8080AssemblerDirective nextgroup=intel8080ImplicitInput
syn match intel8080ConstantWrapper '\(\d\|\a\|\$\)\+\(:\=\s*\|\s\+\)\(EQU\|SET\)[^;!\n]\+' contains=intel8080Constant,intel8080SpecialSymbol
syn match intel8080Constant '\(\s\|:\)\(EQU\|SET\)\s\+' contained contains=intel8080AssemblerDirective nextgroup=intel8080ImplicitInput



" input
syn match intel8080ImplicitInput '[^;!\n]\+' contained contains=intel8080NumberWrapper,intel8080CharacterArray,intel8080SpecialSymbol

syn match intel8080SpecialSymbol '[\$,:!]'

hi link intel8080AssemblerDirective  Macro
hi link intel8080OPCode              Statement

hi link intel8080Register       Constant
hi link intel8080Register8Bit   intel8080Register
hi link intel8080Register16Bit  intel8080Register
hi link intel8080RegisterStack  intel8080Register

hi link intel8080Number             Number
hi link intel8080NumberBinary       intel8080Number
hi link intel8080NumberOctal        intel8080Number 
hi link intel8080NumberHexadecimal  intel8080Number 
hi link intel8080NumberDecimal      intel8080Number 

hi link intel8080CharacterArray  String

hi link intel8080SpecialSymbol   Special

hi link intel8080Comment        Comment
hi link intel8080CommentStyle1  intel8080Comment
hi link intel8080CommentStyle2  intel8080Comment



