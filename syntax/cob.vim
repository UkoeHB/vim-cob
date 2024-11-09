" Syntax file for COB
" COB: Coweb Asset Format
" Author: koe <ukoe@protonmail.com>
" License: MIT, see https://github.com/UkoeHB/vim-cob/blob/main/LICENSE

if exists("b:current_syntax")
  finish
endif

syn keyword basicLanguageKeywords auto none nan inf

syn region cobStruct start="(" end=")" transparent fold
syn region cobSeq start="\[" end="\]" transparent fold
syn region cobMap start="{" end="}" transparent fold

syn region cobString oneline start=/"/ skip=/\\\\\|\\"/ end=/"/

syn match cobSection /\<#\w\+\ze:/ display

syn match cobIdentifier /\<[A-Z]\w*\s*\ze(/ display

syn match cobKey /\<\w\+\ze:/ display

syn match cobInteger /\<[+-]\=[0-9]\(_\=\d\)*\>/ display

syn match cobFloat /\<[+-]\=[0-9]\(_\=\d\)*\.\d\+\>/ display
syn match cobFloat /\<[+-]\=[0-9]\(_\=\d\)*\(\.[0-9]\(_\=\d\)*\)\=[eE][+-]\=[0-9]\(_\=\d\)*\>/ display

syn match cobBoolean /\<\%(true\|false\)\>/ display

syn keyword cobTodo TODO FIXME XXX BUG contained

syn match cobComment /\/\/.*/ contains=cobTodo
syn region cobComment start="/\*" end="\*/" fold extend contains=cobTodo,cobCommentB

hi def link cobString String
hi def link cobInteger Number
hi def link cobFloat Float
hi def link cobBoolean Boolean
hi def link cobTodo Todo
hi def link cobComment Comment
hi def link cobSection PreProc
hi def link cobIdentifier Identifier
hi def link cobKey Keyword

let b:current_syntax = "cob"
