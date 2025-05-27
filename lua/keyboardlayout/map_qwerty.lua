local M = {}

local layout = {
	Title = "QWERTY",
	lowercase = {
		NumRow = "`1234567890-=",
		TopRow = "qwertyuiop[]\\",
		MiddleRow = "asdfghjkl;'",
		BottomRow = "zxcvbnm,./",
	},

	uppercase = {
		NumRow = "~!@#$%^&*()_+",
		TopRow = "QWERTYUIOP{}|",
		MiddleRow = 'ASDFGHJKL:"',
		BottomRow = "ZXCVBNM<>?",
	},
}

function M.getLayout()
	return layout
end

local function setLayout()
	require("keyboardlayout.remap").setLayout(layout)
end

vim.api.nvim_create_user_command("KeyboardLayoutMapToQWERTY", setLayout, { nargs = 0, desc = "QWERTY", bang = false })

return M
