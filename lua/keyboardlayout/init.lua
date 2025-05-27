local M = {}
local Config = require("keyboardlayout.config")

require("keyboardlayout.map_colemak")
require("keyboardlayout.map_dvorak")
require("keyboardlayout.map_qwerty")

function M.getConfig()
	return Config
end

function M.setup(opts)
	for i, v in pairs(opts) do
		Config[i] = v
	end

	require("keyboardlayout.remap").setLayout(Config.OriginalLayout)

	if Config.InitialLayout ~= nil then
		require("keyboardlayout.remap").setLayout(Config.InitialLayout)
		require("keyboardlayout.guide").SetGuide(Config.InitialLayout)
	end

	if Config.ShowGuide then
		require("keyboardlayout.guide").ShowGuide()
	end

	require("keyboardlayout.guide")
end

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		if package.loaded["nvim-autopairs"] then
			require("nvim-autopairs").disable()
		end
	end,
})

return M
