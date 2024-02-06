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


" file-static constants
" Intel 8080 config 
let s:OPCODE_ARR = [
    \ 'MOV',  'LDAX', 'LDA',  'MVI',  'STA',  'STAX', 'LXI',  'LHLD',
    \ 'SHLD', 'SPHL', 'XCHG', 'XTHL', 'ADD',  'ADI',  'ADC',  'ACI',
    \ 'SUB',  'SUI',  'SBB',  'SBI',  'DAD',  'INR',  'DCR',  'INX',
    \ 'DCX',  'DI',   'EI',   'NOP',  'HLT',  'DAA',  'CMA',  'STC',
    \ 'CMC',  'RLC',  'RRC',  'RAL',  'RAR',  'ANA',  'ANI',  'XRA',
    \ 'XRI',  'ORA',  'ORI',  'CMP',  'CPI',  'JMP',  'JNZ',  'JZ',
    \ 'JNC',  'JC',   'JPO',  'JPE',  'JP',   'JM',   'PCHL', 'CALL',
    \ 'CNZ',  'CZ',   'CNC',  'CC',   'CPO',  'CPE',  'CP',   'CM',
    \ 'RET',  'RNZ',  'RZ',   'RNC',  'RC',   'RPO',  'RPE',  'RP',
    \ 'RM',   'RST',  'PUSH', 'POP',  'IN',   'OUT'
    \ ]

let s:REGISTER_ARR = [
    \ 'A', 'B', 'C', 'D', 'E', 'H', 'L', 
    \ 'M', 'SP', 'PSW' 
    \ ]

let s:OPCODE_PARAM_SEPERATOR = ','
let s:LABEL_SYMBOL = ':'


" Regex config
let s:REGEX_MODE = '\v\c'
let s:START_OF_LINE = '^'
let s:END_OF_LINE = '$'
let s:WHITESPACE = '\s'


" Vim config
let s:GROUP_PREFIX = 'intel8080'

let s:OPCODE_MATCH = s:GROUP_PREFIX . 'OPCode'

let s:REGISTER_MATCH = s:GROUP_PREFIX . 'Register'

let s:SPECIAL_SYMBOL_MATCH = s:GROUP_PREFIX . 'SpecialSymbol'

let s:NUM_GROUP = s:GROUP_PREFIX . 'Number'
let s:HEX_MATCH = s:GROUP_PREFIX . s:NUM_GROUP . 'Hexadecimal'
let s:DEC_MATCH = s:GROUP_PREFIX . s:NUM_GROUP . 'Decimal'
let s:OCT_MATCH = s:GROUP_PREFIX . s:NUM_GROUP . 'Octal'
let s:BIN_MATCH = s:GROUP_PREFIX . s:NUM_GROUP . 'Binary'


" Regex Helper functions
function! RegExOr(match_arr)
   return join(a:match_arr, '|')
endfunction

function! RegExLookBehind(regex_str)
   return '(' . a:regex_str . ')@<='
endfunction

function! RegExLookAhead(regex_str)
   return '(' . a:regex_str . ')@='
endfunction

function! RegExOptional(regex_str)
    return '(' . a:regex_str . ')='
endfunction


" Vim helper functions
function! VimMatch(regex_str, match_name, extra='')
    " Generate a new syn match command based on parameters
    let l:cmd =
        \ 'syn match' .
        \ ' ' . a:match_name . ' ' .
        \ '/' . a:regex_str . '/' .
        \ ' ' . a:extra

    " Execute the command
    exec l:cmd

    return
endfunction


function! VimHiLink(match_name, link_name)
    " Generate new hi link command based on parameters
    let l:cmd =
        \ 'hi link' .
        \ ' ' . a:match_name .
        \ ' ' . a:link_name

    " Execute the command
    exec l:cmd

    return
endfunction


" Style Functions
function! ApplyStyleCPM ()
    " define local constants
    let l:LOGICAL_EOL = '!'
    let l:COMMENT_A = ';'
    let l:COMMENT_B = '\*'
    let l:MATH_SYMBOLS = [ '\+', '\-', '\*', '\/', '\(', '\)' ]
    let l:MATH_KEYWORDS = [ 'MOD' ]
    let l:LOGIC_KEYWORDS = [ 'NOT', 'AND', 'OR', 'XOR', 'SHL', 'SHR' ]
    let l:ASM_DIRECTIVES = [ 
        \ 'ORG', 'END', 'IF', 'ENDIF', 'DB', 'DW', 'DS', 'EQU', 'SET'
        \ ]
    let l:IGNORED_SEPERATOR = '\$'

    " use nested local functions
    let l:cpm = {}


    function cpm.opcodes()
        
        let l:OPCODE_PREFIX = [
            \ s:START_OF_LINE,
            \ l:LOGICAL_EOL
            \ s:WHITESPACE,
            \ s:LABEL_SYMBOL,
            \ ]

        let l:OPCODE_SUFFIX = [
            \ s:END_OF_LINE,
            \ s:LOGICAL_EOL,
            \ s:WHITESPACE,
            \ s:COMMENT_A
            \ ]
           
        let l:OPCODE_REGEX =
            \ s:REGEX_MODE .
            \ RegExLookBehind(RegExOr(l:OPCODE_PREFIX)) .
            \ RegExOr(s:OPCODE_ARR) .
            \ RegExLookAhead(RegExOr(l:OPCODE_SUFFIX))
    
        call VimMatch(l:OPCODE_REGEX, s:OPCODE_MATCH)

        return
    endfunction

    function cpm.asm_registers()
        let l:REGISTER_PREFIX = [
            \ s:WHITESPACE,
            \ s:OPCODE_PARAM_SEPERATOR
            \ ]
        
        let l:REGISTER_SUFFIX = [
            \ s:WHITESPACE,
            \ s:OPCODE_PARAM_SEPERATOR,
            \ s:COMMENT_A,
            \ s:LOGICAL_EOL,
            \ s:END_OF_LINE
            \ ]

        let l:REGISTER_REGEX =
            \ s:REGEX_MODE .
            \ RegExLookBehind(RegExOr(l:REGISTER_PREFIX)) .
            \ RegExOr(s:REGISTER_ARR) .
            \ RegExLookAhead(RegExOr(l:REGISTER_SUFFIX))
    
        call VimMatch(l:REGISTER_REGEX, s:REGISTER_MATCH)

        return
    endfunction

    function cpm.numbers()
        let l:NUMBER_PREFIX = [
            \ s:WHITESPACE,
            \ s:START_OF_LINE,
            \ s:OPCODE_PARAM_SEPERATOR
            \ ]
        call extend(l:NUMBER_PREFIX, l:MATH_SYMBOLS)
        
        let l:NUMBER_SUFFIX = [
            \ s:WHITESPACE,
            \ l:COMMENT_A,
            \ l:LOGICAL_EOL,
            \ s:OPCODE_PARAM_SEPERATOR,
            \ s:END_OF_LINE
            \ ]
        call extend(l:NUMBER_SUFFIX, l:MATH_SYMBOLS)

        let l:DEC_REGEX =
            \ s:REGEX_MODE .
            \ RegExLookBehind(RegExOr(l:NUMBER_PREFIX)) .
            \ '\d(\d|\$)*D=' .
            \ RegExLookAhead(RegExOr(l:NUMBER_SUFFIX))

        let l:HEX_REGEX =
            \ s:REGEX_MODE .
            \ RegExLookBehind(RegExOr(l:NUMBER_PREFIX)) .
            \ '\d(\x|\$)*H' .
            \ RegExLookAhead(RegExOr(l:NUMBER_SUFFIX))

        let l:OCT_REGEX =
            \ s:REGEX_MODE .
            \ RegExLookBehind(RegExOr(l:NUMBER_PREFIX)) .
            \ '\o(\o|\$)*[OQ]' .
            \ RegExLookAhead(RegExOr(l:NUMBER_SUFFIX))

        let l:BIN_REGEX =
            \ s:REGEX_MODE .
            \ RegExLookBehind(RegExOr(l:NUMBER_PREFIX)) .
            \ '[01]([01]|\$)*B' .
            \ RegExLookAhead(RegExOr(l:NUMBER_SUFFIX))
    
             
        call VimMatch(l:DEC_REGEX, s:DEC_MATCH)
        call VimMatch(l:HEX_REGEX, s:HEX_MATCH)
        call VimMatch(l:OCT_REGEX, s:OCT_MATCH)
        call VimMatch(l:BIN_REGEX, s:BIN_MATCH)

        return
    endfunction 


    call l:cpm.opcodes()
    call l:cpm.asm_registers()
    call l:cpm.numbers()

    return
endfunction


function! ApplyStyleNONE ()
    " use nested local functions
    let l:none = {}

    function none.opcodes()
        " OPCode Config 
        let l:OPCODE_PREFIX = [
            \ s:START_OF_LINE,
            \ s:WHITESPACE,
            \ s:LABEL_SYMBOL
            \ ]

        let l:OPCODE_SUFFIX = [
            \ s:END_OF_LINE,
            \ s:WHITESPACE
            \ ]
        
        let l:OPCODE_REGEX =
            \ s:REGEX_MODE .
            \ RegExLookBehind(RegExOr(l:OPCODE_PREFIX)) .
            \ RegExOr(s:OPCODE_ARR) .
            \ RegExLookAhead(RegExOr(l:OPCODE_SUFFIX))
       
        call VimMatch(l:OPCODE_REGEX, s:OPCODE_MATCH)

        return
    endfunction

    function none.numbers()
        " Basic Hex Config
        let l:HEX_PREFIX = [
            \ s:START_OF_LINE,
            \ s:WHITESPACE,
            \ s:OPCODE_PARAM_SEPERATOR
            \ ]

        let l:HEX_SUFFIX = [
            \ s:END_OF_LINE,
            \ s:WHITESPACE,
            \ s:OPCODE_PARAM_SEPERATOR
            \ ]
        
        let l:HEX_REGEX =
            \ s:REGEX_MODE .
            \ RegExLookBehind(RegExOr(l:HEX_PREFIX)) .
            \ '\x+' .
            \ RegExLookAhead(RegExOr(l:HEX_SUFFIX))
        
        call VimMatch(l:HEX_REGEX, s:HEX_MATCH)
        
        return
    endfunction

    function none.symbols()
        " Symbol Match
        let l:SYMBOL_ARR = [
            \ s:OPCODE_PARAM_SEPERATOR,
            \ s:LABEL_SYMBOL
            \ ]

        let l:SYMBOL_REGEX = 
            \ s:REGEX_MODE .
            \ RegExOr(l:SYMBOL_ARR)

        call VimMatch(l:SYMBOL_REGEX, s:SPECIAL_SYMBOL_MATCH)

        return
    endfunction

    function none.asm_registers()
        " Register Match
        let l:REGISTER_PREFIX = [
            \ s:WHITESPACE,
            \ s:OPCODE_PARAM_SEPERATOR
            \ ]

        let l:REGISTER_SUFFIX = [
            \ s:END_OF_LINE,
            \ s:WHITESPACE,
            \ s:OPCODE_PARAM_SEPERATOR
            \ ]
        
        let l:REGISTER_REGEX =
            \ s:REGEX_MODE .
            \ RegExLookBehind(RegExOr(l:REGISTER_PREFIX)) .
            \ RegExOr(s:REGISTER_ARR) .
            \ RegExLookAhead(RegExOr(l:REGISTER_SUFFIX))
        
        call VimMatch(l:REGISTER_REGEX, s:REGISTER_MATCH)

        return
    endfunction


    " Add individual elements
    call l:none.opcodes()
    call l:none.asm_registers()
    call l:none.numbers()
    call l:none.symbols()

    return
endfunction


function! SyntaxHighlighting ()

    call VimHiLink(s:NUM_GROUP, "Number")
    call VimHiLink(s:HEX_MATCH, s:NUM_GROUP)
    call VimHiLink(s:DEC_MATCH, s:NUM_GROUP)
    call VimHiLink(s:OCT_MATCH, s:NUM_GROUP)
    call VimHiLink(s:BIN_MATCH, s:NUM_GROUP)

    call VimHiLink(s:SPECIAL_SYMBOL_MATCH, "Special")

    call VimHiLink(s:OPCODE_MATCH, "Statement")

    call VimHiLink(s:REGISTER_MATCH, "Keyword")

    return
endfunction


"call ApplyStyleCPM()
"call SyntaxHighlighting()
