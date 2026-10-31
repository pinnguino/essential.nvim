vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function(ev)
    -- The colorscheme name -> ev.match
    local colorscheme = ev.match

    -- Absolute path to file
    local file_path = vim.fn.stdpath("config") .. "/lua/user/colorscheme.lua"

    -- The content of the file
    local content = string.format('vim.cmd.colorscheme("%s")\n', colorscheme)

    -- Open the file in write mode (overwrites the file if exists)
    local file = io.open(file_path, "w")
    if file then
      file:write(content)
      file:close()
    else
      vim.notify("Failed to persist colorscheme: " .. file_path, vim.log.levels.ERROR)
    end
  end,
})
