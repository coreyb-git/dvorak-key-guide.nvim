local M = {}

local layout = {
	Title = "QWERTY",
	lowercase = {
		Title = "QWERTY lowercase",
		NumRow = "`1234567890-=",
		TopRow = "qwertyuiop[]\\",
		MiddleRow = "asdfghjkl;'",
		BottomRow = "zxcvbnm,./",
	},

	uppercase = {
		Title = "QWERTY [UPPERCASE]",
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
	require("dvorak.remap").setLayout(layout)
end

vim.api.nvim_create_user_command("DvorakMapToQWERTY", setLayout, { nargs = 0, desc = "QWERTY", bang = false })

return M
