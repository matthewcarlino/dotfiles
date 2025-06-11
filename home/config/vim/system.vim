vim9script

def GetUname(): string
    var uname = trim(system('uname'))
    return uname
enddef

def g:IsLightMode(): bool
    var mode = ''
    if g:uname == 'Darwin'
        mode = system('defaults read -g AppleInterfaceStyle 2> /dev/null || echo "light"')
    else
        mode = system('gsettings get org.cinnamon.theme name 2> /dev/null')
    endif

    return stridx(tolower(mode), 'dark') == -1
enddef

g:uname = GetUname()




