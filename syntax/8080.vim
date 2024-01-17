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
syn match intel8080OPCode00wrapper /\vNOP/               contains=intel8080OPCode
syn match intel8080OPCode01wrapper /\vLXI\s+B,\s*/       contains=intel8080OPCode,intel8080Register16Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode02wrapper /\vSTAX\s+B/          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode03wrapper /\vINX\s+B/           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode04wrapper /\vINR\s+B/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode05wrapper /\vDCR\s+B/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode06wrapper /\vMVI\s+B,\s*/       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode07wrapper /\vRLC/               contains=intel8080OPCode
"syn match intel8080OPCode08wrapper /\v*NOP/              contains=intel8080OPCode
syn match intel8080OPCode09wrapper /\vDAD\s+B/           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode0Awrapper /\vLDAX\s+B/          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode0Bwrapper /\vDCX\s+B/           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode0Cwrapper /\vINR\s+C/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode0Dwrapper /\vDCR\s+C/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode0Ewrapper /\vMVI\s+C,\s*/       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode0Fwrapper /\vRRC/               contains=intel8080OPCode

"syn match intel8080OPCode10wrapper /\v*NOP/              contains=intel8080OPCode
syn match intel8080OPCode11wrapper /\vLXI\s+D,\s*/       contains=intel8080OPCode,intel8080Register16Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode12wrapper /\vSTAX\s+D/          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode13wrapper /\vINX\s+D/           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode14wrapper /\vINR\s+D/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode15wrapper /\vDCR\s+D/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode16wrapper /\vMVI\s+D,\s*/       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode17wrapper /\vRAL/               contains=intel8080OPCode
"syn match intel8080OPCode18wrapper /\v*NOP/              contains=intel8080OPCode
syn match intel8080OPCode19wrapper /\vDAD\s+D/           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode1Awrapper /\vLDAX\s+D/          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode1Bwrapper /\vDCX\s+D/           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode1Cwrapper /\vINR\s+E/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode1Dwrapper /\vDCR\s+E/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode1Ewrapper /\vMVI\s+E,\s*/       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode1Fwrapper /\vRAR/               contains=intel8080OPCode

"syn match intel8080OPCode20wrapper /\v*NOP/              contains=intel8080OPCode
syn match intel8080OPCode21wrapper /\vLXI\s+H,\s*/       contains=intel8080OPCode,intel8080Register16Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode22wrapper /\vSHLD\s+/           contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCode23wrapper /\vINX\s+H/           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode24wrapper /\vINR\s+H/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode25wrapper /\vDCR\s+H/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode26wrapper /\vMVI\s+H,\s*/       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode27wrapper /\vDAA/               contains=intel8080OPCode
"syn match intel8080OPCode28wrapper /\v*NOP/              contains=intel8080OPCode
syn match intel8080OPCode29wrapper /\vDAD\s+H/           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode2Awrapper /\vLHLD\s+/           contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCode2Bwrapper /\vDCX\s+H/           contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode2Cwrapper /\vINR\s+L/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode2Dwrapper /\vDCR\s+L/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode2Ewrapper /\vMVI\s+L,\s*/       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode2Fwrapper /\vCMA/               contains=intel8080OPCode

"syn match intel8080OPCode30wrapper /\v*NOP/              contains=intel8080OPCode
syn match intel8080OPCode31wrapper /\vLXI\s+SP,\s*/      contains=intel8080OPCode,intel8080Register16Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode32wrapper /\vSTA\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCode33wrapper /\vINX\s+SP/          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode34wrapper /\vINR\s+M/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode35wrapper /\vDCR\s+M/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode36wrapper /\vMVI\s+M,\s*/       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode37wrapper /\vSTC/               contains=intel8080OPCode
"syn match intel8080OPCode38wrapper /\v*NOP/              contains=intel8080OPCode
syn match intel8080OPCode39wrapper /\vDAD\s+SP/          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode3Awrapper /\vLDA\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCode3Bwrapper /\vDCX\s+SP/          contains=intel8080OPCode,intel8080Register16Bit
syn match intel8080OPCode3Cwrapper /\vINR\s+A/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode3Dwrapper /\vDCR\s+A/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode3Ewrapper /\vMVI\s+A,\s*/       contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol nextgroup=intel8080ImplicitInput
syn match intel8080OPCode3Fwrapper /\vCMC/               contains=intel8080OPCode

syn match intel8080OPCode40wrapper /\vMOV\s+B,\s*B/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode41wrapper /\vMOV\s+B,\s*C/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode42wrapper /\vMOV\s+B,\s*D/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode43wrapper /\vMOV\s+B,\s*E/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode44wrapper /\vMOV\s+B,\s*H/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode45wrapper /\vMOV\s+B,\s*L/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode46wrapper /\vMOV\s+B,\s*M/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode47wrapper /\vMOV\s+B,\s*A/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode48wrapper /\vMOV\s+C,\s*B/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode49wrapper /\vMOV\s+C,\s*C/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Awrapper /\vMOV\s+C,\s*D/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Bwrapper /\vMOV\s+C,\s*E/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Cwrapper /\vMOV\s+C,\s*H/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Dwrapper /\vMOV\s+C,\s*L/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Ewrapper /\vMOV\s+C,\s*M/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode4Fwrapper /\vMOV\s+C,\s*A/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol

syn match intel8080OPCode50wrapper /\vMOV\s+D,\s*B/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode51wrapper /\vMOV\s+D,\s*C/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode52wrapper /\vMOV\s+D,\s*D/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode53wrapper /\vMOV\s+D,\s*E/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode54wrapper /\vMOV\s+D,\s*H/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode55wrapper /\vMOV\s+D,\s*L/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode56wrapper /\vMOV\s+D,\s*M/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode57wrapper /\vMOV\s+D,\s*A/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode58wrapper /\vMOV\s+E,\s*B/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode59wrapper /\vMOV\s+E,\s*C/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Awrapper /\vMOV\s+E,\s*D/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Bwrapper /\vMOV\s+E,\s*E/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Cwrapper /\vMOV\s+E,\s*H/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Dwrapper /\vMOV\s+E,\s*L/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Ewrapper /\vMOV\s+E,\s*M/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode5Fwrapper /\vMOV\s+E,\s*A/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol

syn match intel8080OPCode60wrapper /\vMOV\s+H,\s*B/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode61wrapper /\vMOV\s+H,\s*C/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode62wrapper /\vMOV\s+H,\s*D/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode63wrapper /\vMOV\s+H,\s*E/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode64wrapper /\vMOV\s+H,\s*H/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode65wrapper /\vMOV\s+H,\s*L/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode66wrapper /\vMOV\s+H,\s*M/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode67wrapper /\vMOV\s+H,\s*A/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode68wrapper /\vMOV\s+L,\s*B/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode69wrapper /\vMOV\s+L,\s*C/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Awrapper /\vMOV\s+L,\s*D/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Bwrapper /\vMOV\s+L,\s*E/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Cwrapper /\vMOV\s+L,\s*H/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Dwrapper /\vMOV\s+L,\s*L/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Ewrapper /\vMOV\s+L,\s*M/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode6Fwrapper /\vMOV\s+L,\s*A/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol

syn match intel8080OPCode70wrapper /\vMOV\s+M,\s*B/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode71wrapper /\vMOV\s+M,\s*C/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode72wrapper /\vMOV\s+M,\s*D/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode73wrapper /\vMOV\s+M,\s*E/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode74wrapper /\vMOV\s+M,\s*H/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode75wrapper /\vMOV\s+M,\s*L/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode76wrapper /\vHLT/               contains=intel8080OPCode
syn match intel8080OPCode77wrapper /\vMOV\s+M,\s*A/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode78wrapper /\vMOV\s+A,\s*B/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode79wrapper /\vMOV\s+A,\s*C/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Awrapper /\vMOV\s+A,\s*D/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Bwrapper /\vMOV\s+A,\s*E/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Cwrapper /\vMOV\s+A,\s*H/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Dwrapper /\vMOV\s+A,\s*L/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Ewrapper /\vMOV\s+A,\s*M/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol
syn match intel8080OPCode7Fwrapper /\vMOV\s+A,\s*A/      contains=intel8080OPCode,intel8080Register8Bit,intel8080SpecialSymbol

syn match intel8080OPCode80wrapper /\vADD\s+B/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode81wrapper /\vADD\s+C/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode82wrapper /\vADD\s+D/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode83wrapper /\vADD\s+E/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode84wrapper /\vADD\s+H/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode85wrapper /\vADD\s+L/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode86wrapper /\vADD\s+M/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode87wrapper /\vADD\s+A/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode88wrapper /\vADC\s+B/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode89wrapper /\vADC\s+C/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Awrapper /\vADC\s+D/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Bwrapper /\vADC\s+E/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Cwrapper /\vADC\s+H/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Dwrapper /\vADC\s+L/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Ewrapper /\vADC\s+M/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode8Fwrapper /\vADC\s+A/           contains=intel8080OPCode,intel8080Register8Bit

syn match intel8080OPCode90wrapper /\vSUB\s+B/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode91wrapper /\vSUB\s+C/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode92wrapper /\vSUB\s+D/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode93wrapper /\vSUB\s+E/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode94wrapper /\vSUB\s+H/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode95wrapper /\vSUB\s+L/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode96wrapper /\vSUB\s+M/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode97wrapper /\vSUB\s+A/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode98wrapper /\vSBB\s+B/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode99wrapper /\vSBB\s+C/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Awrapper /\vSBB\s+D/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Bwrapper /\vSBB\s+E/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Cwrapper /\vSBB\s+H/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Dwrapper /\vSBB\s+L/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Ewrapper /\vSBB\s+M/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCode9Fwrapper /\vSBB\s+A/           contains=intel8080OPCode,intel8080Register8Bit

syn match intel8080OPCodeA0wrapper /\vANA\s+B/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA1wrapper /\vANA\s+C/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA2wrapper /\vANA\s+D/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA3wrapper /\vANA\s+E/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA6wrapper /\vANA\s+M/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA7wrapper /\vANA\s+A/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA8wrapper /\vXRA\s+B/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeA9wrapper /\vXRA\s+C/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeAAwrapper /\vXRA\s+D/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeABwrapper /\vXRA\s+E/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeACwrapper /\vXRA\s+H/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeADwrapper /\vXRA\s+L/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeAEwrapper /\vXRA\s+M/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeAFwrapper /\vXRA\s+A/           contains=intel8080OPCode,intel8080Register8Bit

syn match intel8080OPCodeB0wrapper /\vORA\s+B/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB1wrapper /\vORA\s+C/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB2wrapper /\vORA\s+D/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB3wrapper /\vORA\s+E/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB4wrapper /\vORA\s+H/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB5wrapper /\vORA\s+L/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB6wrapper /\vORA\s+M/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB7wrapper /\vORA\s+A/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB8wrapper /\vCMP\s+B/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeB9wrapper /\vCMP\s+C/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBAwrapper /\vCMP\s+D/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBBwrapper /\vCMP\s+E/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBCwrapper /\vCMP\s+H/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBDwrapper /\vCMP\s+L/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBEwrapper /\vCMP\s+M/           contains=intel8080OPCode,intel8080Register8Bit
syn match intel8080OPCodeBFwrapper /\vCMP\s+A/           contains=intel8080OPCode,intel8080Register8Bit

syn match intel8080OPCodeC0wrapper /\vRNZ/               contains=intel8080OPCode
syn match intel8080OPCodeC1wrapper /\vPOP\s+B/           contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeC2wrapper /\vJNZ\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeC3wrapper /\vJMP\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeC4wrapper /\vCNZ\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeC5wrapper /\vPUSH\s+B/          contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeC6wrapper /\vADI\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeC7wrapper /\vRST\s+0/           contains=intel8080OPCode,intel8080NumberWrapper
syn match intel8080OPCodeC8wrapper /\vRZ/                contains=intel8080OPCode
syn match intel8080OPCodeC9wrapper /\vRET/               contains=intel8080OPCode
syn match intel8080OPCodeCAwrapper /\vJZ\s+/             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeCBwrapper /\v*JMP /             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeCCwrapper /\vCZ\s+/             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeCDwrapper /\vCALL\s+/           contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeCEwrapper /\vACI\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeCFwrapper /\vRST\s+1/           contains=intel8080OPCode,intel8080NumberWrapper

syn match intel8080OPCodeD0wrapper /\vRNC/               contains=intel8080OPCode
syn match intel8080OPCodeD1wrapper /\vPOP\s+D/           contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeD2wrapper /\vJNC\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeD3wrapper /\vOUT\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeD4wrapper /\vCNC\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeD5wrapper /\vPUSH\s+D/          contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeD6wrapper /\vSUI\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeD7wrapper /\vRST\s+2/           contains=intel8080OPCode,intel8080NumberWrapper
syn match intel8080OPCodeD8wrapper /\vRC/                contains=intel8080OPCode
"syn match intel8080OPCodeD9wrapper /\v*RET/              contains=intel8080OPCode
syn match intel8080OPCodeDAwrapper /\vJC\s+/             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeDBwrapper /\vIN\s+/             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeDCwrapper /\vCC\s+/             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeDDwrapper /\v*CALL /            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeDEwrapper /\vSBI\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeDFwrapper /\vRST\s+3/           contains=intel8080OPCode,intel8080NumberWrapper

syn match intel8080OPCodeE0wrapper /\vRPO/               contains=intel8080OPCode
syn match intel8080OPCodeE1wrapper /\vPOP\s+H/           contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeE2wrapper /\vJP\s+/             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeE3wrapper /\vJPO\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeE4wrapper /\vXTHL/              contains=intel8080OPCode
syn match intel8080OPCodeE5wrapper /\vCPO\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeE6wrapper /\vPUSH\s+H/          contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeE7wrapper /\vANI\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeE8wrapper /\vRST\s+4/           contains=intel8080OPCode,intel8080NumberWrapper
syn match intel8080OPCodeE9wrapper /\vRPE/               contains=intel8080OPCode
syn match intel8080OPCodeEAwrapper /\vPCHL/              contains=intel8080OPCode
syn match intel8080OPCodeEBwrapper /\vXCHG/              contains=intel8080OPCode
syn match intel8080OPCodeECwrapper /\vCPE\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeEDwrapper /\v*CALL /             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeEEwrapper /\vXRI\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeEFwrapper /\vRST\s+5/           contains=intel8080OPCode,intel8080NumberWrapper

syn match intel8080OPCodeF0wrapper /\vRP/                contains=intel8080OPCode
syn match intel8080OPCodeF1wrapper /\vPOP\s+PSW/         contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeF2wrapper /\vJP\s+/             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeF3wrapper /\vDI/                contains=intel8080OPCode
syn match intel8080OPCodeF4wrapper /\vCP\s+/             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeF5wrapper /\vPUSH\s+PSW/        contains=intel8080OPCode,intel8080RegisterStack
syn match intel8080OPCodeF6wrapper /\vORI\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeF7wrapper /\vRST\s+6/           contains=intel8080OPCode,intel8080NumberWrapper
syn match intel8080OPCodeF8wrapper /\vRM/                contains=intel8080OPCode
syn match intel8080OPCodeF9wrapper /\vSPHL/              contains=intel8080OPCode
syn match intel8080OPCodeFAwrapper /\vJM\s+/             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeFBwrapper /\vEI/                contains=intel8080OPCode
syn match intel8080OPCodeFCwrapper /\vCM\s+/             contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeFDwrapper /\v*CALL /            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
syn match intel8080OPCodeFEwrapper /\vCPI\s+/            contains=intel8080OPCode nextgroup=intel8080ImplicitInput
"syn match intel8080OPCodeFFwrapper /\vRST\s+7/           contains=intel8080OPCode,intel8080NumberWrapper
"
syn match intel8080OPCodeRSTwrapper /\vRST\s+/           contains=intel8080OPCode nextgroup=intel8080ImplicitInput

" Random Symbols

" Comments
syn match intel8080CommentStyle1 /\v;.*$/ 
syn match intel8080CommentStyle2 /\v(!|^)\*.*$/ 

" numbers
syn match intel8080NumberWrapper /\v(\a|\$)@<!(\d(\x|\$)*[BOQHD]=)(\a|\$)@!/ contained contains=intel8080NumberBinary,intel8080NumberHexadecimal,intel8080NumberOctal,intel8080NumberDecimal,intel8080SpecialSymbol
syn match intel8080NumberDecimal     /\v\d(\d|\$)*D=/  contained
syn match intel8080NumberHexadecimal /\v0(\x|\$)*H/    contained
syn match intel8080NumberOctal       /\v0(\o|\$)*[OQ]/ contained
syn match intel8080NumberBinary      /\v0([01]|\$)*B/  contained

" String
syn region intel8080CharacterArray start=/\v'/ end=/\v'/ contained

" Directives
syn keyword intel8080AssemblerDirective ORG END IF ENDIF EQU SET DB DW DS contained
syn match intel8080DefineData      /\vD[BWS]\s+/  contains=intel8080AssemblerDirective nextgroup=intel8080ImplicitInput
syn match intel8080SetOrigin       /\vORG\s+/     contains=intel8080AssemblerDirective nextgroup=intel8080ImplicitInput
syn match intel8080SetEnd          /\vEND($|\s+)/ contains=intel8080AssemblerDirective nextgroup=intel8080ImplicitInput
syn match intel8080ConstantWrapper /\v(\d|\a|\$)+(:=s*|\s+)(EQU|SET)[^;!\n]+/ contains=intel8080Constant,intel8080SpecialSymbol
syn match intel8080Constant        /\v(\s|:)(EQU|SET)\s+/ contained contains=intel8080AssemblerDirective nextgroup=intel8080ImplicitInput


" input
syn match intel8080ImplicitInput /\v[^;!\n]+/ contained contains=intel8080NumberWrapper,intel8080CharacterArray,intel8080SpecialSymbol

syn match intel8080SpecialSymbol /\v[\$,:!]/


" Pretty Coloring
hi link intel8080AssemblerDirective  Macro
hi link intel8080OPCode              Statement

hi link intel8080Register            Constant
hi link intel8080Register8Bit        intel8080Register
hi link intel8080Register16Bit       intel8080Register
hi link intel8080RegisterStack       intel8080Register

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



