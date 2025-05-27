local M = {}

local map_dvorak = require("dvorak.map_dvorak")
require("dvorak.map_qwerty")

function M.setup(opts) end

require("dvorak.remap").setLayout(map_dvorak.getLayout())
require("dvorak.guide").SetGuide(map_dvorak.getLayout())
require("dvorak.guide").ShowGuide()

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		if package.loaded["nvim-autopairs"] then
			require("nvim-autopairs").disable()
		end
	end,
})

return M
