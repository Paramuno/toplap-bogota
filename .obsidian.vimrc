" Have j and k navigate visual lines rather than logical ones
" nmap j gj
" nmap k gk
" nmap I g0i
" nmap A g$a

" Set better macro performance - Unsupported
" set lazyredraw
" Set case sensitive only if search has case characters - Unsupported
" set smartcase

" Yank to system clipboard and unmap Ctrl+c so that it works normally
set clipboard=unnamed
unmap <C-c>
" Y consistent with D and C to the end of line
nmap Y y$
" Use jk to <Esc> in insert mode
imap jk <Esc> 
" insertions that only work on vim using our espanso leaderkey
imap |s  <Space>*~*<Space>[[
"" substitution commands to format into our obformat -- Literal space " " can't be read vy vimrc, and regex "\s" doesnt work on obsvim substitution mode, so we use regex pipeline plugin instead
" nmap |8 :%s/- /* /g
" Use standard VIM to fold and unfold headings, increasing fold sets cursor on heading
exmap decreasefold obcommand creases:decrease-fold-level-at-cursor
nmap zj :decreasefold
exmap increasefold obcommand creases:increase-fold-level-at-cursor
nmap &zk& :increasefold
nmap zk jK&zk&
exmap unfoldall obcommand editor:unfold-all
nmap zn :unfoldall
exmap foldall obcommand editor:fold-all
nmap zm :foldall
" For toggle <A-Y> fold YAML is better
" exmap foldproperties obcommand editor:toggle-fold-properties
" nmap zp :foldproperties
" I like using H and L for beginning/end of line
    " Moving to start of prev/next line doesn't match jk logic
nmap H ^
nmap L $
vmap H ^
vmap L $
" Moving between headers, and put cursor at the start of heading
exmap goToNextHeading obcommand obsidian-editor-shortcuts:goToNextHeading
nmap &j& :goToNextHeading
nmap J &j&T#l
vmap &j& :goToNextHeading
vmap J &j&T#l
exmap goToPrevHeading obcommand obsidian-editor-shortcuts:goToPrevHeading
nmap &k& :goToPrevHeading
nmap K &k&T#l
vmap &k& :goToPrevHeading
vmap K &k&T#l
" <Esc> clears notices & highlights (:nohl)
" exmap clearNotices obcommand obsidian-smarter-md-hotkeys:hide-notice
" nmap &c& :clearNotices
" nmap &n& :nohl
" nmap <Esc> &c&&n&
" Remapping this so that it doesnt need double - Unsupported
" noremap > >>
" noremap < <<
" So that it is consistent with JK and IO
noremap { }
noremap } {

" Space commands
unmap <Space>
" Jump to link v0.3.3
    " exmap jta obcommand mrj-jump-to-link-legacy:activate-jump-to-anywhere-legacy
    " nmap <S-Space> :jta
" Jump to lightspeed v0.4+
exmap jtl obcommand mrj-jump-to-link:activate-lightspeed-jump
nmap <Space> :jtl
exmap jta obcommand mrj-jump-to-link:activate-jump-to-anywhere
nmap <S-Space> :jta
" vmap <Space> 
" Map S to § so that it becomes our spacevim-leader key
nmap s §
vmap s §
" Select all ocurrences
exmap selectAllOccurrences obcommand obsidian-editor-shortcuts:selectAllOccurrences
nmap §y :selectAllOccurrences
" Add new property
" exmap addProperty markdown:add-metadata-property
" Copy (a)ll note content
nmap §a ggvGLy
" Select to brackets
exmap expandSelectionToBrackets obcommand obsidian-editor-shortcuts:expandSelectionToBrackets
nmap §b :expandSelectionToBrackets
" Select heading
exmap selectHeading obcommand macro-plugin:macro-plugin:select-heading
nmap §h :selectHeading
" Soft selects line
nmap §l T*lvL
" [R]eplace Word with yank register content
nmap §r viw"0p
vmap §r "0P
" [s]or[t] selection
vmap §t :'<,'>sort
" Insert new * > lines _below =above
exmap toQuote obcommand hotkeysplus-obsidian:toggle-block-quote
exmap toAsterisk obcommand obsidian-smarter-md-hotkeys:smarter-asterisk-italics
nmap &§&> :toQuote
nmap §> _j&§&>A
nmap &§&* :toAsterisk
nmap §* =k&§&*r<Space>A
nmap §8 _j&§&*r<Space>A
nmap §k &k&_j&§&*r<Space>A
" Insert callout template helper
exmap calloutHelper obcommand templater-obsidian:Templates/¤callout.md
nmap &§&c :calloutHelper
nmap §c _j&§&c<Esc>
" commentary.vim emulation
nmap §/ :.s/^|$/%%/g
" Clean register changes and deletions with S leader
nmap §w "_ciw
nmap §d "_daw

" so that VV... in normal mode just selects more lines
vmap V j

" allows Double Enter to add new line and indent with bullet points
nmap <CR> A
" on visual mode it inserts and saves to the register (it deleted before registering before)
vmap <CR> Di
" <CR> is not fully supported, so we can/t map to it

" Paste what was yanked, not what was deleted
" Paste before and after ]p [p need whole yanked lines
nmap <C-p> "0p
vmap <C-p> "0p

" UNDO consistently on one key, U doesn't work anyways
nmap U <C-r>
" vmap U <C-r>

" Use outline smarter in insert <C-a> and switch increment by N to <C-c>
nmap <C-c> <C-a>
" unmap <C-a>

" poor man's substitute.nvim 🥲
nmap §p Vp
nmap §P vg$p
"macros wont work wihtout substitution magic, we can't nest macroed remaps
" Todoist clean macro, all of this was solved with hotkey REGEX pipeline
" nmap &§*o&; :.s/$/*\sss/
" Sub checkmarks and src endings, then sends both
" nmap &§&x :%s/-<Space>\[x\]/*/g
" nmap &src& :%s/<Space>--<Space>p4<Space>--.*//g
" nmap §r qwvt[bbbhy§8<Esc>pkddq
" nmap §q &§*o&;

" Transporter macros
" exmap pushLineTo obcommand obsidian42-text-transporter:obsidian42-text-transporter-PLT
" nmap &§&t :pushLineTo
" nmap §t :pushLineTo

" Move words left right(equivalent to sibling-swap.nvim)
nmap <A-l> "zdawel"zph
nmap <A-h> "zdawbh"zph

" Add Blank Line above/below
nmap = mzO<Esc>`z
nmap _ mzo<Esc>`z

" Use Q to repeat the last macro
nmap Q @@

" go to last change - https://vimhelp.org/motion.txt.html#g%3B
nmap g; u<C-r>

" Go to box space
nmap gc Hlllci[

" [g]oto [f]ile (= Follow Link under cursor)
exmap followLinkUnderCursor obcommand editor:follow-link
exmap followLinkSplit obcommand editor:open-link-in-new-split
nmap gf :followLinkUnderCursor
vmap gf :followLinkUnderCursor
nmap gF :followLinkSplit
vmap gF :followLinkSplit

" [g]oto [h]eading
" requires Another Quick Switcher Plugin
exmap gotoHeading obcommand obsidian-another-quick-switcher:header-floating-search-in-file
nmap gh :gotoHeading
vmap gh :gotoHeading

" Append punctuation to end of line
" `&§&` are helper commands for addings substitution to command chain,
" `A;<Esc>` does not work as insert mode keystrokes aren't supported
" But substitution works very well
" nmap &§&. :.s/$/./
" nmap &§&, :.s/$/,/
nmap &§&; :.s/$/;/
nmap &§&" :.s/$/"/
nmap &§&' :.s/$/'/
nmap &§&: :.s/$/:/
nmap &§&) :.s/$/)/
nmap &§&] :.s/$/]/
nmap &§&} :.s/$/}/
nmap &§&? :.s/$/?/
" nmap §. mz&§&.`z
" nmap §, mz&§&,`z
nmap §; mz&§&;`z
nmap §" mz&§&"`z
nmap §' mz&§&'`z
nmap §: mz&§&:`z
nmap §) mz&§&)`z
nmap §] mz&§&]`z
nmap §} mz&§&}`z
nmap §? mz&§&?`z

"insert our backlink separator easily
" espanso |s gices us ( *~* )

" quicker access to [q]uote, [z]ingle quote, inline cod[e],
" [r]ectangular bracket, and [c]urly braces
    "omap is unsupported
omap aq a"
omap iq i"
omap az a'
omap iz i'
omap ae a`
omap ie i`
omap ir i[
omap ar a[
omap ac a{
omap ic i{

vmap aq a"
vmap iq i"
vmap az a'
vmap iz i'
vmap ae a`
vmap ie i`
vmap ir i[
vmap ar a[
vmap ac a{
vmap ic i{

" Surround text with [ ] and paste link ~this is solved with Obsidian plugin Alt+P
" This is bugged whenever we open new notes it modifies the line 40 below cursor
" NOTE: must use 'map' and not 'nmap'
" exmap brackets surround [ ]
" exmap parentheses surround ( )
" exmap backticks surround ` `
" map §[ :brackets
" map §( :parentheses
" map §x :backticks

" Unsupported by Obsidianvimrc so can't do this blackhole redirection
" " Make it so that d,c,x delete without overwriting the default register and instead use the d register because the blackhole one is unsupported
" nnoremap d "dd
" nnoremap dd "ddd
" nnoremap D "dD
" nnoremap c "dc
" nnoremap C "dC
" nnoremap x "dx
" nnoremap X "dX

" " Use leaderkey to overwrite the default register
" noremap §d d
" noremap §D D
" noremap §c c
" noremap §C C
" noremap §x x
" noremap §X X

" --- NON OBSIDIAN ---
" https://towardsdatascience.com/the-essential-ideavim-remaps-291d4cd3971b
" " window controls
" exmap wq obcommand workspace:close
" exmap q obcommand workspace:close
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" nnoremap <TAB> >>
" nnoremap <S-TAB> <<
" vnoremap <TAB> >gv
" vnoremap <S-TAB> <gv

" nnoremap > >>
" nnoremap < <<
" vnoremap < <gv
" vnoremap > >gv
