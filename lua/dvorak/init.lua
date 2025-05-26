local M = {}

local map_dvorak = require("dvorak.map_dvorak")

local GuideBuffer = 0

--[[local qwerty = {
	TopRow = "qwert yuiop[]\\",
	UpperTopRow = "QWERTYUIOP{}|",
	MiddleRow = "asdfghjkl;'",
	UpperMiddleRow = 'ASDFGHJKL:"',
	BottomRow = "zxcvbnm,./",
	UpperBottomRow = "ZXCVBNM<>?",
}]]
--

function M.setup(opts)
	--
end

local function formatRow(s)
	local sep = "█"
	local left = string.sub(s, 1, 4) .. sep .. string.sub(s, 5, 5)
	local right = string.sub(s, 6, 6) .. sep .. string.sub(s, 7, 10) .. sep .. string.sub(s, 11)
	return left .. right
end

function M.ShowGuide()
	vim.cmd("split")
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(win, GuideBuffer)
	vim.cmd("setlocal nospell nomodifiable winfixheight")
	vim.cmd("resize 3")
end

local function updateGuide(TargetLayout)
	local TopRow = " " .. formatRow(TargetLayout.TopRow) .. "     " .. TargetLayout.Title
	local MiddleRow = " " .. formatRow(TargetLayout.MiddleRow)
	local BottomRow = " " .. formatRow(TargetLayout.BottomRow)

	vim.api.nvim_buf_set_lines(GuideBuffer, 0, 2, false, { TopRow, MiddleRow, BottomRow, "" })
end

GuideBuffer = vim.api.nvim_create_buf(false, true)
updateGuide(map_dvorak.lowercase)

vim.api.nvim_create_user_command(
	"DvorakShowGuide",
	M.ShowGuide,
	{ nargs = 0, desc = "Dvorak key guide.", bang = false }
)

vim.api.nvim_create_user_command(
	"DvorakMapToDvorak",
	require("dvorak.remap").mapToDvorak,
	{ nargs = 0, desc = "Dvorak - Map insert mode keys to Dvorak layout.", bang = false }
)
vim.api.nvim_create_user_command(
	"DvorakMapToQWERTY",
	require("dvorak.remap").mapToQwerty,
	{ nargs = 0, desc = "Dvorak - Map insert mode keys to QWERTY layout.", bang = false }
)

require("dvorak.remap").mapToDvorak()
M.ShowGuide()

--disable blinks autobrackets
if package.loaded["blink.cmp"] then
	require("blink-cmp").setup({})
end

return M
