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

"au BufRead,BufNewFile *.ASM setfiletype i8080
"au BufRead,BufNewFile *.asm setfiletype i8080
au BufRead,BufNewFile *.8080 setfiletype i8080
au BufRead,BufNewFile *.8080asm setfiletype i8080
au BufRead,BufNewFile *.i8080 setfiletype i8080
au BufRead,BufNewFile *.i8080asm setfiletype i8080

au BufRead,BufNewFile *.PRN setfiletype i8080prn
au BufRead,BufNewFile *.prn setfiletype i8080prn
au BufRead,BufNewFile *.8080prn setfiletype i8080prn
au BufRead,BufNewFile *.i8080prn setfiletype i8080prn
