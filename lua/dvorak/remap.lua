local M = {}
local qwerty = require("dvorak.map_qwerty")
local dvorak = require("dvorak.map_dvorak")

local const_augroup = "DvorakAutoGroup"

local fromchars = ""
local tochars = ""

local function mapkeyrow(from, to)
	local len = string.len(from)
	for i = 1, len do
		local left = string.sub(from, i, i)
		local right = string.sub(to, i, i)
		fromchars = fromchars .. left
		tochars = tochars .. right
	end
end

local function mapcase(from, to)
	mapkeyrow(from.NumRow, to.NumRow)
	mapkeyrow(from.TopRow, to.TopRow)
	mapkeyrow(from.MiddleRow, to.MiddleRow)
	mapkeyrow(from.BottomRow, to.BottomRow)
end

local function mapKeys(from, to)
	mapcase(from.lowercase, to.lowercase)
	mapcase(from.uppercase, to.uppercase)
end

function M.mapToDvorak()
	vim.api.nvim_create_augroup(const_augroup, { clear = true })
	mapKeys(qwerty, dvorak)

	--[[local len = string.len(fromchars)
	for i = 1, len do
		vim.keymap.set("i", string.sub(fromchars, i, i), string.sub(tochars, i, i), { noremap = true })
	end]]
	--
	vim.api.nvim_create_autocmd("InsertCharPre", {
		group = const_augroup,
		callback = function()
			local i = string.find(fromchars, vim.v.char, 1, true)
			if i ~= nil then
				local to = string.sub(tochars, i, i)
				vim.v.char = to
			end
		end,
	})
	vim.notify("Dvorak layout")
end

function M.mapToQwerty()
	vim.api.nvim_create_augroup(const_augroup, { clear = true })
	--mapKeys(qwerty, qwerty)
	vim.notify("QWERTY layout")
end

return M
