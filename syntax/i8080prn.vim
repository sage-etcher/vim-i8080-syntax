" Source the main config file
runtime syntax/i8080.vim

" Address is a 16 bit hex value on line 2
" Hex value is 0-5 8 bit hex values on line 7 (or an equal sign)
syn match intel8080PrintOutAddr /\v%2v\x{4}/ 
syn match intel8080PrintOutHex  /\v%7v((\x{2}){1,5}|\=)/

" Comments wont start at base of line, instead they will start at column 17
syn match intel8080CommentStyle2 /\v((!)@<=|%17v)\*.*$/


hi link intel8080PrintOutAddr Label
hi link intel8080PrintOutHex  Number

