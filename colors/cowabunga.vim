" Vim color file
" Converted from Textmate theme Cowabunga using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Cowabunga"

hi Cursor  guifg=NONE guibg=#ffe929 gui=NONE
hi Visual  guifg=NONE guibg=#0eb9ff gui=NONE
hi CursorLine  guifg=NONE guibg=#342548 gui=NONE
hi CursorColumn  guifg=NONE guibg=#342548 gui=NONE
hi LineNr  guifg=#847c8f guibg=#2b1b41 gui=NONE
hi VertSplit  guifg=#4d405e guibg=#4d405e gui=NONE
hi MatchParen  guifg=#0cd8ff guibg=NONE gui=NONE
hi StatusLine  guifg=#dcdcdc guibg=#4d405e gui=bold
hi StatusLineNC  guifg=#dcdcdc guibg=#4d405e gui=NONE
hi Pmenu  guifg=NONE guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#0eb9ff gui=NONE
hi IncSearch  guifg=NONE guibg=#215980 gui=NONE
hi Search  guifg=NONE guibg=#215980 gui=NONE
hi Directory  guifg=#29ff1b guibg=NONE gui=NONE
hi Folded  guifg=#208974 guibg=#2b1b41 gui=NONE

hi Normal  guifg=#dcdcdc guibg=#2b1b41 gui=NONE
hi Boolean  guifg=#ff4b54 guibg=NONE gui=NONE
hi Character  guifg=#29ff1b guibg=NONE gui=NONE
hi Comment  guifg=#208974 guibg=NONE gui=NONE
hi Conditional  guifg=#0cd8ff guibg=NONE gui=NONE
hi Constant  guifg=NONE guibg=NONE gui=NONE
hi Define  guifg=#0cd8ff guibg=NONE gui=NONE
hi ErrorMsg  guifg=#dc0d00 guibg=NONE gui=NONE
hi WarningMsg  guifg=#dc0d00 guibg=NONE gui=NONE
hi Float  guifg=#b241ff guibg=NONE gui=NONE
hi Function  guifg=#da417e guibg=NONE gui=NONE
hi Identifier  guifg=#f9f100 guibg=NONE gui=NONE
hi Keyword  guifg=#0cd8ff guibg=NONE gui=NONE
hi Label  guifg=#ffa3ac guibg=NONE gui=NONE
hi NonText  guifg=#4ba7ff guibg=#342548 gui=NONE
hi Number  guifg=#b241ff guibg=NONE gui=NONE
hi Operator  guifg=#0cd8ff guibg=NONE gui=NONE
hi PreProc  guifg=#0cd8ff guibg=NONE gui=NONE
hi Special  guifg=#dcdcdc guibg=NONE gui=NONE
hi SpecialKey  guifg=#4ba7ff guibg=#342548 gui=NONE
hi Statement  guifg=#0cd8ff guibg=NONE gui=NONE
hi StorageClass  guifg=#f9f100 guibg=NONE gui=NONE
hi String  guifg=#ffa3ac guibg=NONE gui=NONE
hi Tag  guifg=#cedc76 guibg=NONE gui=NONE
hi Title  guifg=#dcdcdc guibg=NONE gui=bold
hi Todo  guifg=#208974 guibg=NONE gui=inverse,bold
hi Type  guifg=NONE guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#0cd8ff guibg=NONE gui=NONE
hi rubyFunction  guifg=#da417e guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#29ff1b guibg=NONE gui=NONE
hi rubyConstant  guifg=#32fb7b guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#ffa3ac guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#fff300 guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#ffb444 guibg=NONE gui=NONE
hi rubyInclude  guifg=#0cd8ff guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#ffb444 guibg=NONE gui=NONE
hi rubyRegexp  guifg=#ffa3ac guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#ffa3ac guibg=NONE gui=NONE
hi rubyEscape  guifg=#db2244 guibg=NONE gui=NONE
hi rubyControl  guifg=#0cd8ff guibg=NONE gui=NONE
hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyOperator  guifg=#0cd8ff guibg=NONE gui=NONE
hi rubyException  guifg=#0cd8ff guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#ffb444 guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#32fb7b guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#19a0dc guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#19a0dc guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#19a0dc guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#19a0dc guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#208974 guibg=NONE gui=NONE
hi erubyRailsMethod  guifg=#19a0dc guibg=NONE gui=NONE
hi htmlTag  guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag  guifg=NONE guibg=NONE gui=NONE
hi htmlTagName  guifg=NONE guibg=NONE gui=NONE
hi htmlArg  guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#29ff1b guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#f9f100 guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#19a0dc guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#cedc76 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#ffb444 guibg=NONE gui=NONE
hi yamlAlias  guifg=#ffb444 guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#ffa3ac guibg=NONE gui=NONE
hi cssURL  guifg=#fff300 guibg=NONE gui=NONE
hi cssFunctionName  guifg=#19a0dc guibg=NONE gui=NONE
hi cssColor  guifg=#29ff1b guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#14dc00 guibg=NONE gui=NONE
hi cssClassName  guifg=#14dc00 guibg=NONE gui=NONE
hi cssValueLength  guifg=#b241ff guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#77aedc guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE