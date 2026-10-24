-- Pairs to insert automatically.
local pair_map = {
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ['"'] = '"',
    ["'"] = "'",
}

-- Closing delimiters with dedicated skip mappings.
local closers = {
    [")"] = true,
    ["]"] = true,
    ["}"] = true,
}

-- Filetypes where autopairs should remain disabled.
local excluded_filetypes = {
    NvimTree = true,
    [""] = true,
}

-- Mappings managed by this module.
local buffer_mappings = {
    "(", "[", "{", '"', "'",
    ")", "]", "}",
    "<BS>", "<CR>",
}

-- Get the character under the cursor in Insert mode.
local function next_char()
    local col = vim.fn.col(".")
    return vim.fn.getline("."):sub(col, col)
end

-- Insert a pair, or skip an existing quote.
local function open_pair(char)
    local next = next_char()

    if next == char and (char == '"' or char == "'") then
        return "<Right>"
    end

    return char .. pair_map[char] .. "<Left>"
end

-- Skip a closing delimiter that is already present.
local function close_pair(char)
    if next_char() == char then
        return "<Right>"
    end

    return char
end

-- Delete both delimiters when the cursor is between an empty pair.
local function backspace()
    local col = vim.fn.col(".")
    local line = vim.fn.getline(".")

    local prev = line:sub(col - 1, col - 1)
    local next = line:sub(col, col)

    if pair_map[prev] == next then
        return "<BS><Del>"
    end

    return "<BS>"
end

-- Expand an empty bracket pair onto separate lines.
-- Neovim and the active indentexpr handle indentation.
local function enter_pair()
    local col = vim.fn.col(".")
    local line = vim.fn.getline(".")

    local prev = line:sub(col - 1, col - 1)
    local next = line:sub(col, col)

    if pair_map[prev] == next
        and (prev == "(" or prev == "[" or prev == "{")
    then
        return "<C-g>u<CR><C-c>O"
    end

    return "<CR>"
end

-- Remove previous mappings before reevaluating the filetype.
local function clear_buffer(buf)
    for _, lhs in ipairs(buffer_mappings) do
        pcall(vim.keymap.del, "i", lhs, { buffer = buf })
    end
end

-- Install mappings only in buffers where autopairs is enabled.
local function setup_buffer(buf)
    clear_buffer(buf)

    if excluded_filetypes[vim.bo[buf].filetype] then
        return
    end

    for char in pairs(pair_map) do
        vim.keymap.set("i", char, function()
            return open_pair(char)
        end, {
            buffer = buf,
            expr = true,
            replace_keycodes = true,
            desc = "Autopairs: insert pair",
        })
    end

    for char in pairs(closers) do
        vim.keymap.set("i", char, function()
            return close_pair(char)
        end, {
            buffer = buf,
            expr = true,
            replace_keycodes = true,
            desc = "Autopairs: skip closer",
        })
    end

    vim.keymap.set("i", "<BS>", backspace, {
        buffer = buf,
        expr = true,
        replace_keycodes = true,
        desc = "Autopairs: delete empty pair",
    })

    vim.keymap.set("i", "<CR>", enter_pair, {
        buffer = buf,
        expr = true,
        replace_keycodes = true,
        desc = "Autopairs: expand pair",
    })
end

-- Reconfigure mappings whenever the filetype changes.
local group = vim.api.nvim_create_augroup("UserAutoPairs", {
    clear = true,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
        setup_buffer(args.buf)
    end,
})

