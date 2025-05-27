local M = {}

local const_augroup = "KeyboardLayout"

local fromchars = ""
local tochars = ""

local function mapkeyrow(from, to)
	local len = string.len(from)
	for i = 1, len do
		local left = string.sub(from, i, i)
		local right = string.sub(to, i, i)
		fromchars = fromchars .. left
		tochars = tochars .. right
	end
end

local function mapcase(from, to)
	mapkeyrow(from.NumRow, to.NumRow)
	mapkeyrow(from.TopRow, to.TopRow)
	mapkeyrow(from.MiddleRow, to.MiddleRow)
	mapkeyrow(from.BottomRow, to.BottomRow)
end

function M.setLayout(layout)
	local Config = require("keyboardlayout.init").getConfig()
	require("keyboardlayout.guide").SetGuide(layout)

	if Config.GuideOnly == false then
		vim.api.nvim_create_augroup(const_augroup, { clear = true })

		local OriginalLayout = require("keyboardlayout.map_" .. Config.OriginalLayout).getLayout()
		if layout.Title ~= OriginalLayout.Title then
			mapcase(OriginalLayout.lowercase, layout.lowercase)
			mapcase(OriginalLayout.uppercase, layout.uppercase)

			vim.api.nvim_create_autocmd("InsertCharPre", {
				group = const_augroup,
				callback = function()
					local i = string.find(fromchars, vim.v.char, 1, true)
					if i ~= nil then
						local to = string.sub(tochars, i, i)
						vim.v.char = to
					end
				end,
			})

			vim.api.nvim_create_autocmd("InsertEnter", {
				callback = function()
					if package.loaded["nvim-autopairs"] then
						require("nvim-autopairs").disable()
					end
				end,
			})
		end
	end
end

return M
