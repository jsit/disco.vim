" Vim color file Disco
" Maintainer: [jsit] <jay@jaysitter.com>
" Last Change:  
" URL: http://jaysitter.com
" Description: A full set of 1-, 8-, 16-, 88-, 256-, and GUI-color-compatible colors.

" Sets the highlighting for the given group. {{{
" From github.com/jsit/vim-tomorrow-theme
" Originally by Chris Kempson and contributors
fun! <SID>set_colors(group, fg, bg, attr)

	if !empty(a:fg)
		if type(a:fg) == 3 " If a:fg is a list
			exec "hi " . a:group . " guifg=" . get(a:fg, 1) . " ctermfg=" . get(a:fg, 0)
		else
			exec "hi " . a:group . " guifg=" . a:fg . " ctermfg=" . a:fg
		endif
	endif

	if !empty(a:bg)
		if type(a:bg) == 3 " If a:bg is a list
			exec "hi " . a:group . " guibg=" . get(a:bg, 1) . " ctermbg=" . get(a:bg, 0)
		else
			exec "hi " . a:group . " guibg=" . a:bg . " ctermbg=" . a:bg
		endif
	endif

	if a:attr != ""
		exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
	endif

endfun
" }}}



hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "disco"

" Check to see if we can do colors 8-15
if has('gui_running') || (&t_Co > 8 && (!exists('g:disco_nobright') || g:disco_nobright != 1))
	let s:gt_eight = 1
else
	let s:gt_eight = 0
endif

" Check to see if we can do italic
if (&t_ZH != '' && &t_ZH != '[7m')
	let s:italic = 1
else
	let s:italic = 0
endif



" Define our colors based on the background setting {{{
if &background == "dark" && s:gt_eight
	let s:dim          = [8  , 'DarkGray']
	let s:dimtwo       = [7  , 'LightGray']
	let s:bg           = [0  , 'Black']
	let s:fg           = [15 , 'White']
	let s:blue         = [12 , 'Blue']
	let s:yellow       = [11 , 'Yellow']
	let s:red          = [9  , 'Red']
	let s:green        = [10 , 'Green']
	let s:cyan         = [14 , 'Cyan']
	let s:magenta      = [13 , 'Magenta']
	let s:dimred       = [1  , 'DarkRed']
	let s:dimgreen     = [2  , 'DarkGreen']
	let s:dimcyan      = [6  , 'DarkCyan']
	let s:brightyellow = [11 , 'Yellow']
else
	let s:fg           = [0  , 'Black']
	let s:blue         = [4  , 'DarkBlue']
	let s:yellow       = [3  , 'DarkYellow']
	let s:red          = [1  , 'DarkRed']
	let s:green        = [2  , 'DarkGreen']
	let s:cyan         = [6  , 'DarkCyan']
	let s:magenta      = [5  , 'DarkMagenta']
	if s:gt_eight
		let s:dim          = [7  , 'LightGray']
		let s:dimtwo       = [8  , 'DarkGray']
		let s:bg           = [15 , 'White']
		let s:dimred       = [9  , 'Red']
		let s:dimgreen     = [10 , 'Green']
		let s:dimcyan      = [14 , 'Cyan']
		let s:brightyellow = [11 , 'Yellow']
	else
		let s:dim          = [7      , 'LightGray']
		let s:dimtwo       = [7      , 'LightGray']
		let s:bg           = ['NONE' , 'NONE']
		let s:dimred       = s:red
		let s:dimgreen     = s:green
		let s:dimcyan      = s:cyan
		let s:brightyellow = s:yellow
	endif
endif

" Use something other than red if user has asked to use red only for errors
if exists('g:disco_red_error_only') && g:disco_red_error_only == 1
	let s:alt_red = s:dimcyan
else
	let s:alt_red = s:red
endif
" }}}



" Highlight Groups (:h highlight-groups) {{{

if s:dimtwo != s:dim " Needs to be different from Comment
	call <SID>set_colors("ColorColumn"  , "NONE" , s:dim , "")
	call <SID>set_colors("CursorColumn" , "NONE" , s:dim , "")
	if s:gt_eight " Only turn off bold if we have enough colors
		call <SID>set_colors("CursorLine" , "NONE" , s:dim , "NONE")
	else
		call <SID>set_colors("CursorLine" , "NONE" , s:dim , "")
	endif
else
	call <SID>set_colors("ColorColumn"  , "NONE" , "NONE" , "")
	call <SID>set_colors("CursorColumn" , "NONE" , "NONE" , "")
	call <SID>set_colors("CursorLine"   , "NONE" , "NONE" , "")
endif

call <SID>set_colors("Conceal"  , ""     , "NONE" , "")
call <SID>set_colors("Cursor"   , "NONE" , "NONE" , "reverse")
call <SID>set_colors("CursorIM" , ""     , ""     , "")

call <SID>set_colors("CursorLineNr" , "NONE"   , s:dim      , "")
call <SID>set_colors("Directory"    , s:blue   , ""         , "")
call <SID>set_colors("DiffAdd"      , s:bg     , s:dimgreen , "")
call <SID>set_colors("DiffDelete"   , s:bg     , s:dimred   , "")
call <SID>set_colors("DiffChange"   , s:fg    , s:dimcyan  , "")
call <SID>set_colors("DiffText"     , s:bg , s:cyan     , "NONE")
hi link EndOfBuffer NonText
call <SID>set_colors("ErrorMsg"     , s:fg     , s:red      , "")

if s:dimtwo != s:dim " Needs to be different from SignColumn
	call <SID>set_colors("VertSplit" , s:dimtwo , s:dimtwo , "NONE")
else
	call <SID>set_colors("VertSplit" , s:fg     , s:fg , "reverse")
endif

if s:dimtwo != s:dim
	call <SID>set_colors("Folded"     , s:dimtwo , s:dim    , "")
	call <SID>set_colors("FoldColumn" , s:dimtwo , s:dim    , "")
	call <SID>set_colors("SignColumn" , s:dimtwo , s:dim    , "")
else
	call <SID>set_colors("Folded"     , "NONE"   , s:dimtwo , "")
	call <SID>set_colors("FoldColumn" , "NONE"   , s:dimtwo , "")
	call <SID>set_colors("SignColumn" , "NONE"   , s:dimtwo , "")
endif

call <SID>set_colors("IncSearch"  , s:brightyellow , "black" , "reverse")
call <SID>set_colors("LineNr"     , s:dim          , ""      , "")
call <SID>set_colors("MatchParen" , s:yellow       , "NONE"  , "")
call <SID>set_colors("ModeMsg"    , s:green        , ""      , "")
call <SID>set_colors("MoreMsg"    , s:green        , ""      , "")
call <SID>set_colors("NonText"    , s:dim          , ""      , "")

if &background == "dark" && has('gui_running')
	call <SID>set_colors("Normal" , "white" , "black" , "")
else
	call <SID>set_colors("Normal" , ""      , ""      , "")
endif

call <SID>set_colors("PMenu"        , s:fg           , s:dim          , "")

if s:dimtwo != s:dim
	call <SID>set_colors("PMenuSel" , s:dim , s:dimtwo , "")
else
	call <SID>set_colors("PMenuSel" , s:dim , s:fg     , "")
endif

call <SID>set_colors("PMenuSbar"        , s:fg       , s:dim          , "")
call <SID>set_colors("PMenuThumb"       , s:fg       , s:dim          , "")
call <SID>set_colors("Question"         , s:green    , ""             , "")
call <SID>set_colors("Search"           , "black"    , s:brightyellow , "")
call <SID>set_colors("SpecialKey"       , s:dim      , ""             , "")
call <SID>set_colors("SpellBad"         , s:dimred   , s:fg           , "reverse")
call <SID>set_colors("SpellCap"         , ""         , s:red          , "reverse")
call <SID>set_colors("SpellLocal"       , ""         , s:red          , "reverse")
call <SID>set_colors("SpellRare"        , s:dimred   , s:fg           , "reverse")
call <SID>set_colors("StatusLine"       , ""         , ""             , "reverse")
call <SID>set_colors("StatusLineNC"     , s:dim      , ""             , "")
call <SID>set_colors("StatusLineTerm"   , s:green    , "NONE"         , "reverse")
call <SID>set_colors("StatusLineTermNC" , s:dimgreen , "NONE"         , "reverse")
call <SID>set_colors("TabLine"          , s:fg       , s:dim          , "NONE")
call <SID>set_colors("TabLineFill"      , s:dim      , s:dimtwo       , "")
call <SID>set_colors("TabLineSel"       , ""         , ""             , "NONE")
call <SID>set_colors("Title"            , "NONE"     , ""             , "")
call <SID>set_colors("Visual"           , ""         , s:dim          , "")
call <SID>set_colors("VisualNOS"        , s:dim      , ""             , "")
call <SID>set_colors("WarningMsg"       , s:red      , "NONE"             , "")
call <SID>set_colors("WildMenu"         , s:green    , s:dim          , "")

" End Highlight Groups }}}



" Group Names (:h group-name) {{{

if (s:italic)
	call <SID>set_colors("Comment", s:dimtwo, "", "italic")
else
	call <SID>set_colors("Comment", s:dimtwo, "", "")
endif

call <SID>set_colors("Constant", s:green, "", "")
hi link String    Constant
hi link Character Constant
hi link Number    Constant
hi link Boolean   Constant
hi link Float     Constant

if s:gt_eight " Only turn off bold if we have enough colors
	call <SID>set_colors("Identifier", s:alt_red, "", "NONE")
else
	call <SID>set_colors("Identifier", s:alt_red, "", "")
endif
hi link Function Identifier

call <SID>set_colors("Statement", s:magenta, "", "")
hi link Conditional Statement
hi link Repeat      Statement
hi link Label       Statement
hi link Operator    Statement
hi link Keyword     Statement
hi link Exception   Statement

call <SID>set_colors("PreProc", s:blue, "", "")
hi link Include   PreProc
hi link Define    PreProc
hi link Macro     PreProc
hi link PreCondit PreProc

call <SID>set_colors("Type", s:cyan, "", "")
hi link StorageClass Type
hi link Structure    Type
hi link Typedef      Type

call <SID>set_colors("Special", s:yellow, "", "")
hi link SpecialChar    Special
hi link Tag            Special
hi link Delimiter      Special
hi link SpecialComment Special
hi link Debug          Special

call <SID>set_colors("Underlined" , "NONE" , ""       , "underline")
call <SID>set_colors("Ignore"     , s:dim  , ""       , "")
call <SID>set_colors("Error"      , s:red  , "white"  , "reverse")
call <SID>set_colors("Todo"       , s:bg   , s:yellow , "")

" End Group Names }}}



" Syntax-specific highlighting {{{
" From github.com/jsit/vim-tomorrow-theme
" Originally by Chris Kempson and contributors

" Vim Highlighting
exe 'hi link vimCommand Function'

" C Highlighting
call <SID>set_colors("cType"         , s:yellow  , "NONE" , "")
call <SID>set_colors("cStorageClass" , s:magenta , "NONE" , "")
call <SID>set_colors("cConditional"  , s:magenta , "NONE" , "")
call <SID>set_colors("cRepeat"       , s:magenta , "NONE" , "")

" PHP Highlighting
call <SID>set_colors("phpVarSelector"    , s:alt_red , "NONE" , "")
call <SID>set_colors("phpKeyword"        , s:magenta , "NONE" , "")
call <SID>set_colors("phpRepeat"         , s:magenta , "NONE" , "")
call <SID>set_colors("phpConditional"    , s:magenta , "NONE" , "")
call <SID>set_colors("phpStatement"      , s:magenta , "NONE" , "")
call <SID>set_colors("phpMemberSelector" , s:fg      , "NONE" , "")

" Ruby Highlighting
call <SID>set_colors("rubySymbol"                 , s:green   , "NONE" , "")
call <SID>set_colors("rubyConstant"               , s:yellow  , "NONE" , "")
call <SID>set_colors("rubyAttribute"              , s:blue    , "NONE" , "")
call <SID>set_colors("rubyInclude"                , s:blue    , "NONE" , "")
call <SID>set_colors("rubyLocalVariableOrMethod"  , s:cyan    , "NONE" , "")
call <SID>set_colors("rubyCurlyBlock"             , s:cyan    , "NONE" , "")
call <SID>set_colors("rubyStringDelimiter"        , s:green   , "NONE" , "")
call <SID>set_colors("rubyInterpolationDelimiter" , s:cyan    , "NONE" , "")
call <SID>set_colors("rubyConditional"            , s:magenta , "NONE" , "")
call <SID>set_colors("rubyRepeat"                 , s:magenta , "NONE" , "")

" Python Highlighting
exe 'hi link pythonInclude Include'
exe 'hi link pythonStatement Statement'
exe 'hi link pythonConditional Conditional'
exe 'hi link pythonRepeat Repeat'
exe 'hi link pythonException Exception'
exe 'hi link pythonFunction Function'

" Go Highlighting
exe 'hi link goStatement Statement'
exe 'hi link goConditional Conditional'
exe 'hi link goRepeat Repeat'
exe 'hi link goException Exception'
call <SID>set_colors("goDeclaration" , s:blue , "NONE" , "")
exe 'hi link goConstants Constant'
call <SID>set_colors("goBuiltins"    , s:cyan , "NONE" , "")

" CoffeeScript Highlighting
exe 'hi link coffeeKeyword Keyword'
exe 'hi link coffeeConditional Conditional'

" JavaScript Highlighting
exe 'hi link javaScriptBraces Normal'
exe 'hi link javaScriptFunction Function'
exe 'hi link javaScriptConditional Conditional'
exe 'hi link javaScriptRepeat Repeat'
exe 'hi link javaScriptNumber Number'
exe 'hi link javaScriptMember Type'

" HTML Highlighting
exe 'hi link htmlTag       Identifier'
exe 'hi link htmlTagName   Identifier'
exe 'hi link htmlArg       Statement'
exe 'hi link htmlScriptTag Exception'
exe 'hi link htmlSpecialTagName Exception'

" Diff Highlighting
exe 'hi link diffAdded   DiffAdd'
exe 'hi link diffRemoved DiffDelete'

" vim-showmarks
call <SID>set_colors("ShowMarksHLl" , s:bg , s:blue , "")
call <SID>set_colors("ShowMarksHLu" , s:bg , s:blue , "")
call <SID>set_colors("ShowMarksHLo" , s:bg , s:blue , "")

" End syntax-specific highlighting }}}



" Clean up
delf <SID>set_colors
unlet s:dim s:dimtwo s:bg s:fg s:blue s:yellow s:red s:green s:cyan s:magenta s:brightyellow s:dimred s:dimgreen s:dimcyan
