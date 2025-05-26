local M = {}

local GuideBuffer = 0

local dvorak_lowercase = {
	Title = "DVORAK key guide",
	TopRow = "',.pyfgcrl/=\\",
	MiddleRow = "aoeuidhtns-",
	BottomRow = ";qjkxbmwvz",
}

local dvorak_uppercase = {
	Title = "DVORAK [UPPERCASE]",
	TopRow = '"<>PYFGCRL?+|',
	MiddleRow = "AOEUIDHTNS_",
	BottomRow = ":QJKXBMWVZ",
}

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
updateGuide(dvorak_lowercase)

vim.api.nvim_create_user_command(
	"DvorakGuideShow",
	M.ShowGuide,
	{ nargs = 0, desc = "Dvorak key guide.", bang = false }
)

M.ShowGuide()

return M
