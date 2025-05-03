
-- local wezterm = require 'wezterm'

local module = {}

function isLightMode()
    local output
    if Uname == 'Darwin' then
        -- TODO: Vibe coded darwin support - needs testing
        local fh = io.popen([[ defaults read -g AppleInterfaceStyle 2> /dev/null || echo "light" ]])
        output = fh:read("*a")
        fh:close()
    else
        local fh = io.popen("gsettings get org.cinnamon.theme name 2> /dev/null")
        output = fh:read("*a")
        fh:close()
    end

    -- sanitize output
    output = output:gsub("'", ""):gsub("%s+$", "")

    return output:lower():match("dark") == nil
end

function module.apply(config)
    if isLightMode() then
        config.color_scheme = 'Londontube (light) (terminal.sexy)'
    else
        config.color_scheme = 'Londontube (dark) (terminal.sexy)'
    end
    config.font_size = 9.0
    config.line_height = 1.1
    config.window_background_opacity = 0.8
    if Uname == 'Darwin' then
        print('Using Darwin Graphics')
        config.webgpu_preferred_adapter = {
            backend = "Metal",
            device = 0,
            device_type = "IntegratedGpu",
            name = "Apple M1 Pro",
            vendor = 0
        }
        config.front_end = 'WebGpu'
    else
        config.front_end = 'OpenGL'
    end
end

return module
