-------------------------------------------------------------------------------
-- Highlight the current window
-- nvim-zh/colorful-winsep.nvim
-------------------------------------------------------------------------------
local ok, winsep = pcall(require, 'colorful-winsep')
if not ok then return end


-- local contains = function(tab, val)
--     for _, value in ipairs(tab) do
--         if value == val then
--             return true
--         end
--     end

--     return false
-- end

-- local count_valid_bufs = function()
--     local n_loaded = 0

--     for _, buf_nr in ipairs(vim.api.nvim_list_bufs()) do
--         local name = vim.api.nvim_buf_get_name(buf_nr)
--         local filetype = vim.api.nvim_buf_get_option(buf_nr, 'filetype')

--         local is_loaded = vim.api.nvim_buf_is_loaded(buf_nr)
--         local valid_name = name ~= ''
--         local valid_type = not contains({'NvimTree'}, filetype)

--         if is_loaded and valid_name and valid_type then
--             n_loaded = n_loaded + 1
--         end
--     end

--     return n_loaded
-- end


winsep.setup({
    no_exec_files = {
        'packer', 'TelescopePrompt', 'mason', 'CompetiTest', 'NvimTree',
        'Outline', 'toggleterm'
    },
    -- create_event = function()
    --     local buf_n = count_valid_bufs()
    --     if buf_n == 1 then
    --         winsep.NvimSeparatorDel()
    --     end
    -- end
})
