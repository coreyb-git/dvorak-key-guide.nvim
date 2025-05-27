local M = {}

local layout = {
	Title = "Colemak",
	lowercase = {
		NumRow = "`1234567890-=",
		TopRow = "qwfpgjluy;[]\\",
		MiddleRow = "arstdhneio'",
		BottomRow = "zxcvbkm,./",
	},

	uppercase = {
		NumRow = "~!@#$%^&*()_+",
		TopRow = "QWFPGJLUY:{}|",
		MiddleRow = 'ARSTDHNEIO"',
		BottomRow = "ZXCVBKM<>?",
	},
}

function M.getLayout()
	return layout
end

local function setLayout()
	require("keyboardlayout.remap").setLayout(layout)
end

vim.api.nvim_create_user_command(
	"KeyboardLayoutMapToColemak",
	setLayout,
	{ nargs = 0, desc = "Colemak layout", bang = false }
)

return M
