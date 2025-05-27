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

	local OriginalLayout = require("keyboardlayout.map_" .. Config.OriginalLayout).getLayout()
	require("keyboardlayout.remap").setLayout(OriginalLayout)

	if Config.InitialLayout ~= nil then
		local layout = require("keyboardlayout.map_" .. Config.InitialLayout).getLayout()
		require("keyboardlayout.remap").setLayout(layout)
		require("keyboardlayout.guide").SetGuide(layout)
	end

	if Config.ShowGuide then
		require("keyboardlayout.guide").ShowGuide()
	end

	require("keyboardlayout.guide")
end

return M
