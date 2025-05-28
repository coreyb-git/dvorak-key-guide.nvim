Features:

1.  Changes layout for INSERT mode.
1.  Shows the keyboard layout guide in a window.
1.  Can be set to show the guide without attempting to change the key bindings, for when the keyboard layout has already been set in the system settings, but the layout is unfamiliar.

Why?

As a way to learn a different layout without having to change the layout of the operating system, thus containing the change to within just NeoVim.

Functioning only within INSERT mode is partially due to technical constraints, but also to keep the usual NORMAL mode key bindings and movements unaffected.  The intention is to use this plugin while writing long prose, not while writing code.  Once competent with the new layout the operating system should have the layout changed completely, but of course then the Vim movements will be be in different locations, so now you'll have a new problem.

If you want to fully dive-into a new layout by changing the system keyboard layout then the guide can be used on its own to give a visual aid.

Commands:

1.  :KeyboardLayoutShowGuide
1.  :KeyboardLayoutMapToColemak
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

-  The autopairs plugin interjects and tries to close brackets and quotes, but the wrong key is inserted when this plugin is running.  Autopairs is disabled to prevent this.
