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

		if layout.Title ~= Config.OriginalLayout.Title then
			mapcase(Config.OriginalLayout.lowercase, layout.lowercase)
			mapcase(Config.OriginalLayout.uppercase, layout.uppercase)

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
		end
	end
end

return M
