local M = {}

local GuideBuffer = vim.api.nvim_create_buf(false, true)

local function formatRow(s, IndexFingerKeyNum)
	local sep = "█"
	local Left = string.sub(s, 1, IndexFingerKeyNum)
	local Mid = string.sub(s, IndexFingerKeyNum + 1, IndexFingerKeyNum + 1)
		.. string.sub(s, IndexFingerKeyNum + 2, IndexFingerKeyNum + 2)
	local RightIndex = IndexFingerKeyNum + 3
	local Right = string.sub(s, RightIndex, RightIndex + 3)
	local Extra = string.sub(s, RightIndex + 4)
	return Left .. sep .. Mid .. sep .. Right .. sep .. Extra
end

function M.ShowGuide()
	vim.cmd("split")
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(win, GuideBuffer)
	vim.cmd("setlocal nospell winfixheight")
	vim.cmd("resize 4")
end

function M.SetGuide(TargetLayout)
	local spacer = "     "
	local NumRow = formatRow(TargetLayout.lowercase.NumRow, 5)
		.. " "
		.. spacer
		.. formatRow(TargetLayout.uppercase.NumRow, 5)
		.. "     "
		.. TargetLayout.Title
	local TopRow = " "
		.. formatRow(TargetLayout.lowercase.TopRow, 4)
		.. spacer
		.. " "
		.. formatRow(TargetLayout.uppercase.TopRow, 4)
	local MiddleRow = " "
		.. formatRow(TargetLayout.lowercase.MiddleRow, 4)
		.. "  "
		.. spacer
		.. " "
		.. formatRow(TargetLayout.uppercase.MiddleRow, 4)
	local BottomRow = " "
		.. formatRow(TargetLayout.lowercase.BottomRow, 4)
		.. "   "
		.. spacer
		.. " "
		.. formatRow(TargetLayout.uppercase.BottomRow, 4)

	vim.api.nvim_buf_set_lines(GuideBuffer, 0, 3, false, { NumRow, TopRow, MiddleRow, BottomRow, "" })
end

vim.api.nvim_create_user_command(
	"DvorakShowGuide",
	M.ShowGuide,
	{ nargs = 0, desc = "Dvorak key guide.", bang = false }
)

return M
