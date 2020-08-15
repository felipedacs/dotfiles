" Arquivo de configurações com ou sem plugins/packages que afetam a
" performance do vimrc base.
"
set number relativenumber   " exibe régua com o numero relativo das linhas

"## Autocomplete
" Fake auto complete (:h ins-completion)

" origem das palavras do wildmenu:
"   - . buffer corrente
"   - b buffers escondidos
"   - k dicionários
"   - w de outras janelas (splits)
set complete=.,b,k,w

" 1. autocomplete de filename <c-x><c-f> com o arquivo aberto sendo a
"    referencia ao invés da raiz do projeto (troca temporariamente :pwd)
"    THANKS: https://superuser.com/a/604180
" 2. quando em insertmode, as sugestões são case sensitive, fora não
" 3. a cada caracter inserido tenta ativar autocomplete
"    THANKS: https://gist.github.com/maxboisvert/a63e96a67d0a83d71e9f49af73e71d93
"    OBS: pode criar multiplos bugs de funções como macros de ":normal!", para
"    evitar é preciso osar ":noa normal!"
augroup autocompleteOnInsert
    au!
    autocmd InsertEnter * 
                \ let save_cwd = getcwd() |
                \ execute "set tags=".fnameescape(save_cwd)."/tags" |
                \ set autochdir |
                \ set noignorecase
    autocmd InsertLeave * 
                \ set noautochdir |
                \ execute 'cd' fnameescape(save_cwd) |
                \ set ignorecase

    " TODO existe diferença de perf mudando o evento?
    " autocmd InsertCharPre * call AutoComplete()
    " autocmd CursorMovedI * call AutoComplete2()
    autocmd CursorHoldI * call AutoComplete2()
augroup END

function! AutoComplete2()
    " if !pumvisible()
        " noa call feedkeys("\<C-n>", 'n')
    " endif  

    " Encerra o if sem calculo caso ja exista um popup
    if !pumvisible()
        if getline('.')[col('.') - 3] =~ '\K' && getline('.')[col('.') - 2] =~ '\K' " last two chars
            noa call feedkeys("\<C-n>", 'n')
        endif
    endif
endfunction

" Antigo
" THANKS:
"   - https://github.com/skywind3000/vim-auto-popmenu
"   - https://stackoverflow.com/a/47967462/9881278
"
"function! OpenCompletion()
"    " if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
"        " call feedkeys("\<C-x>\<C-o>", "n")
"        call feedkeys("\<C-n>")
"    endif
"endfunction

" Antigo
" autocmd InsertCharPre * call AutoComplete()
" Minimalist-AutoCompletePop-Plugin
" THANKS:
"   - https://vi.stackexchange.com/a/8902/28875
"   - https://www.reddit.com/r/vim/comments/4tu844/vim_completion_without_plugin/
"   - https://gist.github.com/maxboisvert/a63e96a67d0a83d71e9f49af73e71d93

" Habilita quebra de linha mesmo com popup visível
inoremap <expr> <CR> pumvisible() ? "\<esc>a\<CR>" : "\<CR>"
" inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" Antigo
"fun! AutoComplete()
"    " TODO add omnifunc nas sugestões
"    if v:char =~ '\K'
"        \ && getline('.')[col('.') - 4] !~ '\K'
"        \ && getline('.')[col('.') - 3] =~ '\K'
"        \ && getline('.')[col('.') - 2] =~ '\K' " last char
"        \ && getline('.')[col('.') - 1] !~ '\K'
"
"        " trecho necessário pelo bug de selecionar automaticamente se
"        " <c-x><c-o> já estiver aberto antes de 3 chars
"        if !pumvisible()
"            noa call feedkeys("\<C-n>", 'n')
"        endif
"    end
"endfun
