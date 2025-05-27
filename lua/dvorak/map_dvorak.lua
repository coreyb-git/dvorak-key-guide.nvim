local M = {}

local layout = {
	Title = "Dvorak",
	lowercase = {
		Title = "DVORAK lowercase",
		NumRow = "`1234567890[]",
		TopRow = "',.pyfgcrl/=\\",
		MiddleRow = "aoeuidhtns-",
		BottomRow = ";qjkxbmwvz",
	},

	uppercase = {
		Title = "DVORAK UPPERCASE",
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
	require("dvorak.remap").setLayout(layout)
end

vim.api.nvim_create_user_command("DvorakMapToDvorak", setLayout, { nargs = 0, desc = "Dvorak layout", bang = false })

return M
