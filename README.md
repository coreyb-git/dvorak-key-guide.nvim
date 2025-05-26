Features:

1.  Changes layout for all modes except Normal mode so that typical navigation and edit keybinds remain in their usual position!
2.  Can be changed back to QWERTY.
3.  Shows the Dvorak keyboard layout guide in a window.

Commands:

1.  :DvorakShowGuide
1.  :DvorakMapToDvorak
1.  :DvorakMapToQWERTY

Loading this plugin assumes you wish to use Dvorak, thus the Dvorak layout is set and the guide shown.

Load with Lazy plugin manager:

```
return {
  "coreyb-git/dvorak.nvim",
	dependencies = {},
	keys = {
		{ "<leader>D", "", desc = "[D]vorak plugin" },
		{ "<leader>Dd", "<cmd>DvorakMapToDvorak<cr>", desc = "[d]vorak key layout" },
		{ "<leader>Dq", "<cmd>DvorakMapToQWERTY<cr>", desc = "[q]qwerty key layout" },
		{ "<leader>Dg", "<cmd>DvorakShowGuide<cr>", desc = "[g]uide" },
	},
	opts = {},
	lazy = false,
}
```

Known issues:

- QWERTY keys for brackets, single quotes, and double quotes, still insert their closing bracket/quote but with the substituted Dvorak character.
