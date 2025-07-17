vim9script

def GetUname(): string
    var uname = trim(system('uname'))
    return uname
enddef

def g:IsLightMode(): bool
    var mode = ''
    if g:uname == 'Darwin'
        mode = system('defaults read -g AppleInterfaceStyle 2> /dev/null || echo "dark"')
    else
        mode = system('gsettings get org.cinnamon.theme name 2> /dev/null || echo "dark"')
    endif

    return stridx(tolower(mode), 'dark') == -1
enddef

g:uname = GetUname()

g:user_emmet_install_global = 0
g:gitgutter_preview_win_floating = 1


