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
        "dtomvan/xpm.xplr",
        "sayanarijit/fzf.xplr",
        "sayanarijit/dual-pane.xplr",
    },
    auto_install = true,
    auto_cleanup = true,
})


-- Icons ----------------------------------------------------------------------
local function meta_icon(my_icon)
    return { meta = { icon = my_icon } }
end

-- Common icons
xplr.config.node_types.directory.meta.icon = " "
xplr.config.node_types.file.meta.icon      = " "
xplr.config.node_types.symlink.meta.icon   = " "

-- Icons based on special file name
xplr.config.node_types.special             = {
    -- Directories
    ["AmazonWorkDocsCompanion"] = meta_icon(" "),
    ["Amazon WorkDocs Drive"]   = meta_icon(" "),
    ["Applications"]            = meta_icon(" "),
    ["Desktop"]                 = meta_icon(" "),
    ["Documents"]               = meta_icon(" "),
    ["Downloads"]               = meta_icon(" "),
    ["Dropbox"]                 = meta_icon(" "),
    ["Drop Box"]                = meta_icon(" "),
    ["Library"]                 = meta_icon(" "),
    ["Movies"]                  = meta_icon(" "),
    ["Music"]                   = meta_icon(" "),
    ["Pictures"]                = meta_icon(" "),
    ["Public"]                  = meta_icon(" "),
    ["Templates"]               = meta_icon(" "),
    ["Videos"]                  = meta_icon(" "),
    ["datasets"]                = meta_icon(" "),
    ["workspace"]               = meta_icon(" "),
    ["workspaces"]              = meta_icon(" "),
    [".dotfiles"]               = meta_icon(" "),
    [".steam"]                  = meta_icon(" "),
    -- Files
    ["Makefile"]                = meta_icon(" "),
    ["README"]                  = meta_icon(" "),
    [".DS_Store"]               = meta_icon(" "),
    [".Dockerfile"]             = meta_icon(" "),
    [".gitlab-ci.yml"]          = meta_icon(" "),
    [".git"]                    = meta_icon(" "),
    ["CMakeLists.txt"]          = meta_icon(" "),
    [".bashrc"]                 = meta_icon(" "),
    [".bashprofile"]            = meta_icon(" "),
    [".zshrc"]                  = meta_icon(" "),
    [".zshenv"]                 = meta_icon(" "),
    [".zprofile"]               = meta_icon(" "),
}

-- Icons by MIME list
xplr.config.node_types.mime_essence        = {
    application = {
        ["*"]                                                             = meta_icon(" "),
        ["pdf"]                                                           = meta_icon(" "),
        ["vnd.amazon.ebook"]                                              = meta_icon(" "),
        ["octet-stream"]                                                  = meta_icon(" "),
        ["x-sh"]                                                          = meta_icon(" "),
        ["rtf"]                                                           = meta_icon(" "),
        -- word
        ["msword"]                                                        = meta_icon(" "),
        ["vnd.openxmlformats-officedocument.wordprocessingml.document"]   = meta_icon(" "),
        ["vnd.oasis.opendocument.text"]                                   = meta_icon(" "),
        -- excel
        ["vnd.ms-excel"]                                                  = meta_icon(" "),
        ["vnd.openxmlformats-officedocument.spreadsheetml.sheet"]         = meta_icon(" "),
        ["vnd.oasis.opendocument.spreadsheet"]                            = meta_icon(" "),
        -- powerpoint
        ["vnd.ms-powerpoint"]                                             = meta_icon(" "),
        ["vnd.openxmlformats-officedocument.presentationml.presentation"] = meta_icon(" "),
        ["vnd.oasis.opendocument.presentation"]                           = meta_icon(" "),
        -- archive
        ["gzip"]                                                          = meta_icon(" "),
        ["java-archive"]                                                  = meta_icon(" "),
        ["vnd.rar"]                                                       = meta_icon(" "),
        ["x-7z-compressed"]                                               = meta_icon(" "),
        ["x-bzip"]                                                        = meta_icon(" "),
        ["x-bzip2"]                                                       = meta_icon(" "),
        ["x-freearc"]                                                     = meta_icon(" "),
        ["x-tar"]                                                         = meta_icon(" "),
        ["zip"]                                                           = meta_icon(" "),
    },
    text = {
        ["*"]    = meta_icon(" "),
        ["html"] = meta_icon(" "),
        ["css"]  = meta_icon(" "),
    },
    image = {
        ["*"] = meta_icon(" "),
    },
    video = {
        ["*"] = meta_icon(" "),
    },
    audio = {
        ["*"] = meta_icon(" "),
    },
    font = {
        ["*"] = meta_icon(" "),
    },
}

-- Icons by other extension
xplr.config.node_types.extension           = {
    ["py"]       = meta_icon(" "),
    ["ipynb"]    = meta_icon(" "),
    ["lua"]      = meta_icon(" "),
    ["zsh"]      = meta_icon(" "),
    ["bash"]     = meta_icon(" "),
    ["md"]       = meta_icon(" "),
    ["mdx"]      = meta_icon(" "),
    ["markdown"] = meta_icon(" "),
    ["rmd"]      = meta_icon(" "),
    ["conf"]     = meta_icon(" "),
}
