---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- This is the built-in configuration file that gets loaded and sets the
-- default values when xplr loads, before loading any other custom
-- configuration file.
--
-- You can use this file as a reference to create a your custom config file.
--
-- To create a custom configuration file, you need to define the script version
-- for compatibility checks.
--
-- See https://xplr.dev/en/upgrade-guide
--
-- ```lua
-- version = "0.0.0"
-- ```
version = "0.20.2"


-- Package manager ------------------------------------------------------------
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
    .. ";"
    .. xpm_path
    .. "/?.lua;"
    .. xpm_path
    .. "/?/init.lua"

os.execute(
    string.format(
        "[ -e '%s' ] || git clone '%s' '%s'",
        xpm_path,
        xpm_url,
        xpm_path
    )
)

require("xpm").setup({
    plugins = {
        -- Let xpm manage itself
        'dtomvan/xpm.xplr',
        'sayanarijit/fzf.xplr',
    },
    auto_install = true,
    auto_cleanup = true,
})


-- Icons ----------------------------------------------------------------------
-- Common icons
xplr.config.node_types.directory.meta.icon = " "
xplr.config.node_types.file.meta.icon      = " "
xplr.config.node_types.symlink.meta.icon   = " "

-- Icons based on special file name
xplr.config.node_types.special             = {
    -- Directories
    ["AmazonWorkDocsCompanion"] = { meta = { icon = " " } },
    ["Applications"]            = { meta = { icon = " " } },
    ["Desktop"]                 = { meta = { icon = " " } },
    ["Documents"]               = { meta = { icon = " " } },
    ["Downloads"]               = { meta = { icon = " " } },
    ["Dropbox"]                 = { meta = { icon = " " } },
    ["Library"]                 = { meta = { icon = " " } },
    ["Movies"]                  = { meta = { icon = " " } },
    ["Music"]                   = { meta = { icon = " " } },
    ["Pictures"]                = { meta = { icon = " " } },
    ["Public"]                  = { meta = { icon = " " } },
    ["Templates"]               = { meta = { icon = " " } },
    ["Videos"]                  = { meta = { icon = " " } },
    ["datasets"]                = { meta = { icon = " " } },
    ["workspace"]               = { meta = { icon = " " } },
    ["workspaces"]              = { meta = { icon = " " } },
    [".dotfiles"]               = { meta = { icon = " " } },
    [".steam"]                  = { meta = { icon = " " } },
    -- Files
    ["CMakeLists.txt"]          = { meta = { icon = " " } },
    [".DS_Store"]               = { meta = { icon = " " } },
    [".Dockerfile"]             = { meta = { icon = " " } },
    [".gitlab-ci.yml"]          = { meta = { icon = " " } },
    [".git"]                    = { meta = { icon = " " } },
}

-- Icons by file type
xplr.config.node_types.mime_essence        = {
    application = {
        ["*"]                                                             = { meta = { icon = " " } },
        ["pdf"]                                                           = { meta = { icon = " " } },
        -- word
        ["msword"]                                                        = { meta = { icon = " " } },
        ["vnd.openxmlformats-officedocument.wordprocessingml.document"]   = { meta = { icon = " " } },
        ["vnd.oasis.opendocument.text"]                                   = { meta = { icon = " " } },
        -- excel
        ["vnd.ms-excel"]                                                  = { meta = { icon = " " } },
        ["vnd.openxmlformats-officedocument.spreadsheetml.sheet"]         = { meta = { icon = " " } },
        ["vnd.oasis.opendocument.spreadsheet"]                            = { meta = { icon = " " } },
        -- powerpoint
        ["vnd.ms-powerpoint"]                                             = { meta = { icon = " " } },
        ["vnd.openxmlformats-officedocument.presentationml.presentation"] = { meta = { icon = " " } },
        ["vnd.oasis.opendocument.presentation"]                           = { meta = { icon = " " } },
    },
    text = {
        ["*"] = { meta = { icon = " " } },
        html  = { meta = { icon = " " } },
        css   = { meta = { icon = " " } },
    },
    image = {
        ["*"] = { meta = { icon = " " } },
    },
    video = {
        ["*"] = { meta = { icon = " " } },
    },
    audio = {
        ["*"] = { meta = { icon = " " } },
    },
    font = {
        ["*"] = { meta = { icon = " " } },
    },
}

xplr.config.node_types.extension = {
    ["py"] = { meta = { icon = " " } },
}
