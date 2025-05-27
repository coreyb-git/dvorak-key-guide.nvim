local M = {}

local layout = {
	Title = "Dvorak",
	lowercase = {
		NumRow = "`1234567890[]",
		TopRow = "',.pyfgcrl/=\\",
		MiddleRow = "aoeuidhtns-",
		BottomRow = ";qjkxbmwvz",
	},

	uppercase = {
		NumRow = "~!@#$%^&*(){}",
		TopRow = '"<>PYFGCRL?+|',
		MiddleRow = "AOEUIDHTNS_",
		BottomRow = ":QJKXBMWVZ",
	},
}

function M.getLayout()
	return layout
end

local function setLayout()
	require("keyboardlayout.remap").setLayout(layout)
end

vim.api.nvim_create_user_command(
	"KeyboardLayoutMapToDvorak",
	setLayout,
	{ nargs = 0, desc = "Dvorak layout", bang = false }
)

return M
