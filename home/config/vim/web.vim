vim9script

# autocmd FileType htm,html inoremap <buffer> <C-j> <C-o>F<<CR><CR><Up><C-f>
# autocmd FileType htm,html inoremap <buffer> <C-i> <C-o>F<
# autocmd FileType htm,html imap <buffer> <C-x><C-o> ></
# autocmd CompleteDonePre call DoSomething()
# autocmd TextChangedP

# augroup web
#     if !exists("autoweb")
#         var autoweb = 1
#         g:user_emmet_install_global = 0
#         g:user_emmet_leader_key = ","
#         autocmd FileType html,css EmmetInstall

#         var lspServers = [

#             {
#                 name: 'emmet',
#                 filetype: 'html',
#                 path: 'emmet-language-server',
#                 args: ['--stdio']
#             },
#             {
#                 name: 'vscode-html-server',
#                 filetype: 'html',
#                 path: 'vscode-html-language-server',
#                 args: ['--stdio']
#             },
#             {
#                 name: 'vscode-css-server',
#                 filetype: 'css',
#                 path: 'vscode-css-language-server',
#                 args: ['--stdio']
#             }
#         ]
#         g:LspAddServer(lspServers)
#         g:LspOptionsSet({
#             "snippetSupport": v:true
#         })
#     endif
# augroup END
