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


-- Layout ---------------------------------------------------------------------
xplr.config.layouts.builtin.default = {
    Horizontal = {
        config = {
            constraints = {
                { Percentage = 70 },
                { Percentage = 30 },
            },
        },
        splits = {
            {
                Vertical = {
                    config = {
                        constraints = {
                            { Length = 3 },
                            { Min = 1 },
                            { Length = 3 },
                        },
                    },
                    splits = {
                        "SortAndFilter",
                        "Table",
                        "InputAndLogs",
                    },
                },
            },
            {
                Vertical = {
                    config = {
                        constraints = {
                            { Percentage = 40 },
                            { Percentage = 30 },
                            { Percentage = 30 },
                        },
                    },
                    splits = {
                        {
                            CustomContent = {
                                title = "Preview",
                                body = { DynamicParagraph = { render = "custom.preview_pane.render" } },
                            },
                        },
                        "Selection",
                        "HelpMenu",
                    },
                },
            },
        },
    },
}

-- Text preview
local function stat(node)
    return node.mime_essence
end

local function read(path, height)
    local p = io.open(path)

    if p == nil then
        return nil
    end

    local i = 0
    local res = ""
    for line in p:lines() do
        if line:match("[^ -~\n\t]") then
            p:close()
            return
        end

        res = res .. line .. "\n"
        if i == height then
            break
        end
        i = i + 1
    end
    p:close()

    return res
end

xplr.fn.custom.preview_pane = {}
xplr.fn.custom.preview_pane.render = function(ctx)
    local n = ctx.app.focused_node

    if n and n.canonical then
        n = n.canonical
    end

    if n then
        if n.is_file then
            return read(n.absolute_path, ctx.layout_size.height)
        else
            return stat(n)
        end
    else
        return ""
    end
end


-- Key bindings ---------------------------------------------------------------
-- Batch rename
-- require: https://github.com/marcusbuffett/pipe-rename
xplr.config.modes.builtin.default.key_bindings.on_key.R = {
    help = "batch rename",
    messages = {
        {
            BashExec = [===[
                SELECTION=$(cat "${XPLR_PIPE_SELECTION_OUT:?}")
                NODES=${SELECTION:-$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}")}
                if [ "$NODES" ]; then
                    echo -e "$NODES" | renamer
                    "$XPLR" -m ExplorePwdAsync
                fi
            ]===],
        },
    },
}


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
    ["readme"]                  = meta_icon(" "),
    ["Readme"]                  = meta_icon(" "),
    ["README"]                  = meta_icon(" "),
    [".DS_Store"]               = meta_icon(" "),
    [".Dockerfile"]             = meta_icon(" "),
    [".gitlab-ci.yml"]          = meta_icon(" "),
    [".git"]                    = meta_icon(" "),
    ["Makefile"]                = meta_icon(" "),
    ["CMakeLists.txt"]          = meta_icon(" "),
    [".bashrc"]                 = meta_icon(" "),
    [".bashprofile"]            = meta_icon(" "),
    [".zshrc"]                  = meta_icon(" "),
    [".zshenv"]                 = meta_icon(" "),
    [".zprofile"]               = meta_icon(" "),
    ["license"]                 = meta_icon(" "),
    ["LICENSE"]                 = meta_icon(" "),
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
    ["pem"]      = meta_icon(" "),
    ["tex"]      = meta_icon(" "),
    ["bib"]      = meta_icon(" "),
}
