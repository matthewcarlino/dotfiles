vim9script

def AddDenoLsp(): void
    var lspServers = [
        {
            name: 'tsserver',
            filetype: ['javascript', 'typescript'],
            path: 'deno',
            args: ['lsp'],
            debug: true,
            initializationOptions: {
                enable: true,
                lint: true
            }
        }
    ]
    g:LspAddServer(lspServers)
enddef

au FileType typescript,javascript AddDenoLsp()

#var lspServers = [
#    {
#        name: 'tsserver',
#        filetype: ['javascript', 'typescript'],
#        path: 'typescript-language-server',
#        args: ['--stdio']
#    }
#]
#g:LspAddServer(lspServers)
