local M = {}
local qwerty = require("dvorak.map_qwerty")
local dvorak = require("dvorak.map_dvorak")

local const_augroup = "DvorakAutoGroup"
local autocmdgroup = vim.api.nvim_create_augroup(const_augroup, { clear = true })

local problemkeys = "-_=+[{]}\\|;:'\""

local function mapkeyrow(from, to)
	local len = string.len(from)
	for i = 1, len do
		local locali = i
		local left = string.sub(from, locali, locali)
		local right = string.sub(to, locali, locali)
		--vim.print("from:" .. left .. " to:" .. right)
		--local modes = { "i", "t", "s" }
		if string.find(problemkeys, left, 1, true) == nil then
			vim.keymap.set("i", left, right, { noremap = true, silent = true })
		else
			--
		end
	end
	vim.api.nvim_create_autocmd("InsertCharPre", {
		pattern = "'",
		group = autocmdgroup,
		callback = function()
			vim.print("changing ' to -")
			vim.v.char = "-"
		end,
	})
end

local function mapcase(from, to)
	mapkeyrow(from.TopRow, to.TopRow)
	mapkeyrow(from.MiddleRow, to.MiddleRow)
	mapkeyrow(from.BottomRow, to.BottomRow)
end

local function mapKeys(from, to)
	mapcase(from.lowercase, to.lowercase)
	mapcase(from.uppercase, to.uppercase)
end

function M.mapToDvorak()
	autocmdgroup = vim.api.nvim_create_augroup(const_augroup, { clear = true })
	mapKeys(qwerty, dvorak)
	vim.notify("Dvorak layout")
end

function M.mapToQwerty()
	autocmdgroup = vim.api.nvim_create_augroup(const_augroup, { clear = true })
	mapKeys(qwerty, qwerty)
	vim.notify("QWERTY layout")
end

return M
