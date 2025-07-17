vim9script

# -yegappan/lsp
# :h fold-commands for keybinding
# set keywordprg=:LspHover
#

# HTML/CSS
def AddEmmetLsp(): void

    g:user_emmet_leader_key = ","
    var lspServers = [
        {
            filetype: ['gohtml', 'html', 'css'],
            path: 'emmet-language-server',
            args: ['--stdio'],
        }
    ]
    g:LspAddServer(lspServers)

    EmmetInstall
enddef
au FileType gohtml,html,css AddEmmetLsp()

# HTML/CSS/JSON/ESLint (vscode-langservers-extracted)
def AddHtmlLsp(): void
    var lspServers = [
        {
            filetype: ['html'],
            path: 'vscode-html-language-server',
            args: ['--stdio'],
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType html AddHtmlLsp()

def AddCssLsp(): void
    var lspServers = [
        {
            filetype: ['css'],
            path: 'vscode-css-language-server',
            args: ['--stdio'],
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType css AddCssLsp()

def AddJsonLsp(): void
    var lspServers = [
        {
            filetype: ['json'],
            path: 'vscode-json-language-server',
            args: ['--stdio'],
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType json AddJsonLsp()

def AddMdLsp(): void
    var lspServers = [
        {
            filetype: ['markdown'],
            path: 'vscode-md-language-server',
            args: ['--stdio'],
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType markdown AddMdLsp()

# Javascript, Typescript (Deno LSP)
# def AddDenoLsp(): void
#     var lspServers = [
#         {
#             filetype: ['javascript', 'typescript'],
#             path: 'deno',
#             args: ['lsp'],
#             debug: true,
#             initializationOptions: {
#                 enable: true,
#                 lint: true
#             }
#         }
#     ]
#     g:LspAddServer(lspServers)
# enddef
# au FileType typescript,javascript AddDenoLsp()

def AddTsLsp(): void
    var lspServers = [
        {
            name: 'tsserver',
            filetype: ['javascript', 'typescript'],
            path: 'typescript-language-server',
            args: ['--stdio']
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType typescript,javascript AddTsLsp()

# Rust
def AddRustLsp(): void
    var lspServers = [
        {
            filetype: ['rust'],
            path: 'rust-analyzer',
            args: [],
            syncInit: v:true,
            initializationOptions: {
                inlayHints: {
                    typeHints: {
                        enable: v:true
                    },
                    parameterHints: {
                        enable: v:true
                    }
                }
            }
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType rust AddRustLsp()

# Lua
def AddLuaLsp(): void
    var lspServers = [
        {
            filetype: 'lua',
            path: 'lua-language-server',
            args: []
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType lua AddLuaLsp()

# Rust
def AddGoLsp(): void
    var lspServers = [
        {
            filetype: 'go',
            path: 'gopls',
            args: ['serve']
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType go AddGoLsp()
au BufNewFile,BufRead *.gohtml dist#ft#FThtml()

# Bash
def AddBashLsp(): void
    var lspServers = [
        {
            filetype: 'sh',
            path: 'bash-language-server',
            args: ['start']
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType sh AddBashLsp()

# PHP
def AddPhpLsp(): void
    var lspServers = [
        {
            filetype: 'php',
            path: 'phpactor',
            args: ['language-server']
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType php AddPhpLsp()

# Python
def AddPythonLsp(): void
    var lspServers = [
        {
            filetype: 'python',
            path: 'jedi-language-server',
            args: []
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType python AddPythonLsp()

# OCaml
def AddOcamlLsp(): void
    var lspServers = [
        {
            filetype: 'ocaml',
            path: 'ocamllsp',
            args: []
        }
    ]
    g:LspAddServer(lspServers)
enddef
au FileType ocaml AddOcamlLsp()

# g:LspAddServer(lspServers)
# # Can I set and unset options based on FileType?
g:LspOptionsSet({
    "snippetSupport": v:true, # this is just for emmet
    "useQuickfixForLocations": v:true
})

# autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

# Tab through lsp suggestions
# inoremap <expr> <tab> pumvisible() ? '<c-n>' : '<tab>'
# inoremap <expr> <S-tab> pumvisible() ? '<c-p>' : '<S-tab>'

# :LspCodeLens<CR>                  # applies
# :LspCodeAction<CR>
# :LspDiag current<CR>              # current line / optionally popup, auto
# :LspDiag! current<CR>             # ditto
# :LspDiag here<CR>                 # jump
# :LspDaig first<CR>                # jump
# :LspDiag next<CR>                 # jump
nnoremap gn :LspDiag nextWrap<CR>
# :LspDiag prev<CR>                 # jump
nnoremap gN :LspDiag prevWrap<CR>
# :LspDiag last<CR>                 # jump
# :LspDiag highlight enable<CR>     # default
# :LspDiag highlight disable<CR>
# :LspDiag show<CR>

# :LspDocumentSymbol<CR>            # popup
# :LspHover<CR>                     # K seems already mapped
# :LspInlayHints enable<CR>
# :LspInlayHints disable<CR>
# :LspOutline<CR>
# :LspShowReferences<CR>

# :LspGotoDeclaration<CR>
nnoremap gd :LspGotoDefinition<CR>
nnoremap gi :LspGotoImpl<CR>
nnoremap gt :LspGotoTypeDef<CR>
# :LspPeekDeclaration<CR>
# :LspPeekDefinition<CR>
# :LspPeekImpl<CR>
# :LspPeekReferences<CR>
# :LspPeekTypeDef<CR>
# :LspSymbolSearch<CR>

# :LspHightlight<CR>
# :LspHighlightClear<CR>

# :LspSelectionExpand<CR>
# :LspSelectionShrink<CR>

# :LspCallHierarchyRefresh<CR>
# :LspCallHierarchyIncoming<CR>
# :LspCallHierarchyOutgoing<CR>
# :LspSubTypeHierarchy<CR>
# :LspSuperTypeHierarchy<CR>

# :LspFold
# :LspFormat
# :LspRename

# :LspServer restart
# :LspShowAllServers
