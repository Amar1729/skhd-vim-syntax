" Vim syntax file
" Language: skhd syntax file
" Maintainer: amar paul
" Latest Revision: 18 Nov 2021

" Based off of kwm/khd syntaxes by:
" mario d'amore

"prevents it from being loaded if syntax highlighting has already been enabled for this buffer
if exists("b:current_syntax")
  finish
endif

" ---- misc keywords: skhd and yabai, since they show up frequently in .skhdrc

syntax match khdKeyword "[:; ]\zsskhd\>"
syntax match khdKeyword "[:; ]\zsyabai\>"
highlight link khdKeyword Keyword

" ---- skhd syntax

syntax match khdKeyword '\.blacklist'
syntax match khdKeyword '\.load'
highlight link khdKeyword Keyword

" non-greedy match
syntax match khdString '".\{-}"'
highlight link khdString String

syntax match khdKey '[lr]\?cmd'
syntax match khdKey '[lr]\?alt'
syntax match khdKey '[lr]\?ctrl'
syntax match khdKey '[lr]\?shift'
highlight link khdKey Keyword

" these are not contained by anything yet, I haven't figured out the
" encompassing groups
syntax match khdLiteral '\<[0-9a-zA-Z]\>' contained display
syntax match khdLiteral '\<0x\d\d\>' contained display
syntax keyword khdLiteral return left right up down contained
highlight link khdLiteral Constant

syntax match khdOperator '-'
syntax match khdOperator '+'
syntax match khdOperator ':'
syntax match khdOperator ';'
syntax match khdOperator '<'
syntax match khdOperator '->'
highlight link khdOperator Operator

syntax match khdMode '\<[a-zA-Z]\+\>' contained display
syntax region khdModeDefn start='^::' end=':' contains=khdMode
highlight link khdMode Identifier

syntax region khdKeySymMode start='^' end='<' contains=khdMode oneline
syntax region khdModeActivate start=';' end='$' contains=khdMode oneline

" this region prevents words being mis-identified as khdMode in commands that
" include ';'
syntax region khdCommand start='[^#:]:' end='$' oneline contains=khdString,khdKeyword

" define comments last to override some other regions
syntax match  khdComment "^\s*#.*$"
highlight link khdComment  Comment

let b:current_syntax = "skhd"
