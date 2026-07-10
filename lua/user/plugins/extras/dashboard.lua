return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { {'nvim-tree/nvim-web-devicons'}},
	config = function()

		local header_list = require("user.dashboard-headers").list
		math.randomseed(os.time())
		local random_header = header_list[math.random(1, #header_list)]
		require('dashboard').setup {
			theme = 'doom',
			config = {
				header = random_header,
				center = {
					{
						icon = '  ',
						icon_hl = 'Title',
						desc = 'Find file   ',
						desc_hl = 'String',
						key = 'f',
						-- keymap = 'SPC f f',
						key_hl = 'Number',
						key_format = ' %s', -- remove default surrounding `[]`
						action = ':FzfLua files'
					},
					{
						icon = '󱋡  ',
						desc = 'Find recent files   ',
						key = 'r',
						-- keymap = 'SPC f r',
						icon_hl = 'Title',
						key_hl = 'Number',
						desc_hl = 'String',
						key_format = ' %s', -- remove default surrounding `[]`
						action = 'FzfLua oldfiles'
					},
					{
						icon = ' ',
						desc = ' Load last session   ',
						key = 's',
						key_format = ' %s',
						icon_hl = 'Title',
						key_hl = 'Number',
						desc_hl = 'String',
						action = 'LoadSession ' .. vim.fn.stdpath("config") .. '/lastsession.vim'
					},
					{
						icon = '󰈆  ',
						desc = 'Quit neovim   ',
						key = 'q',
						-- keymap = 'SPC f r',
						icon_hl = 'Title',
						key_hl = 'Number',
						desc_hl = 'String',
						key_format = ' %s', -- remove default surrounding `[]`
						action = 'q'
					}
				},
				footer = function()
					-- 1. Obtener datos
					local v = vim.version()
					local nvim_version = string.format("  v%d.%d.%d", v.major, v.minor, v.patch)
					local plugins_count = "  " .. require("lazy").stats().count .. " plugins installed"
					local date_str = "  " .. os.date("%A, %d de %B | %Y")
					local time_str = "󰥔  " .. os.date("%H:%M")

					-- 2. Definir las líneas de contenido (sin bordes aún)
					local lines = {
						nvim_version,
						plugins_count,
						date_str,
						time_str
					}

					-- 3. Calcular el ancho máximo para que el recuadro sea uniforme
					local max_len = 0
					for _, line in ipairs(lines) do
						local len = vim.fn.strdisplaywidth(line)
						if len > max_len then max_len = len end
					end

					-- 4. Construir el recuadro con padding
					local padding = 2
					local inner_width = max_len + (padding * 2)
					local top_border = "╭" .. string.rep("─", inner_width) .. "╮"
					local bottom_border = "╰" .. string.rep("─", inner_width) .. "╯"

					local result = {
						"", -- Espaciado superior
						"",
						top_border
					}

					for _, line in ipairs(lines) do
						local line_len = vim.fn.strdisplaywidth(line)
						local total_padding = inner_width - line_len
						local left_pad = math.floor(total_padding / 2)
						local right_pad = total_padding - left_pad

						table.insert(result, "│" .. string.rep(" ", left_pad) .. line .. string.rep(" ", right_pad) .. "│")
					end

					table.insert(result, bottom_border)

					return result
				end			}
			}
		end,
	}
