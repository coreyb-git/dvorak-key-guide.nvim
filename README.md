Features:

1.  Changes layout for all modes except Normal mode so that typical navigation and edit keybinds remain in their usual position!
2.  Can be changed back to QWERTY.
3.  Shows the keyboard layout guide in a window.

Commands:

1.  :KeyboardLayoutShowGuide
1.  :KeyboardLayoutMapToDvorak
1.  :KeyboardLayoutMapToQWERTY

Load with Lazy plugin manager:

```
return {
  "coreyb-git/dvorak.nvim",
	dependencies = {},
	keys = {
		{ "<leader>K", "", desc = "[K]eyboard Layout" },
		{ "<leader>Kg", "<cmd>KeyboardLayoutShowGuide<cr>", desc = "[g]uide" },
		{ "<leader>Kc", "<cmd>KeyboardLayoutMapToColemak<cr>", desc = "[c]olemak key layout" },
		{ "<leader>Kd", "<cmd>KeyboardLayoutMapToDvorak<cr>", desc = "[d]vorak key layout" },
		{ "<leader>Kq", "<cmd>KeyboardLayoutMapToQWERTY<cr>", desc = "[q]qwerty key layout" },
	},
	opts = {
	  Separator = "│",
	  OriginalLayout = "qwerty",
	  --InitialLayout = "dvorak",
	  GuideOnly = false,
	  ShowGuide = true,
	},
	lazy = false,
}
```

Known issues:

-  The autopairs plugin interjects and tries to close brackets and quotes, but the wrong key is inserted when this plugin is running.  autopairs is disabled to prevent this.
