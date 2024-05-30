local OBSIDIAN_VAULT_ENV = "OBSIDIAN_DIRECTORY"
local TEMPLATE_DIRECTORY = "900 - Templates"
local NOTES_DIRECTORY = "000 - Zettelkasten"
local NOTE_TEMPLATE = "Core Zettel Idea"
local JOURNAL_DIRECTORY = "200 - Daily Journal"
local JOURNAL_TEMPLATE = "Core Journal Entry"
local FIRST_JOURNAL_ENTRY = os.time({ day = 09, month = 05, year = 2024 })

local createNoteWithDefaultTemplate = function()
	local obsidian = require("obsidian").get_client()
	local utils = require("obsidian.util")

	-- prompt for note title
	-- @see: borrowed from obsidian.command.new
	local note
	local title = utils.input("Enter title or path (optional): ")
	if not title then
		return
	elseif title == "" then
		title = nil
	end

	note = obsidian:create_note({ title = title, no_write = false, template = NOTE_TEMPLATE })

	if not note then
		return
	end
	-- open new note in a buffer
	obsidian:open_note(note, { sync = true })
end

local isVaultDirectory = function()
	local obsidianDirectory = vim.fn.resolve(vim.env[OBSIDIAN_VAULT_ENV])
	return vim.loop.cwd() == obsidianDirectory
end

return {
	"epwalsh/obsidian.nvim",
	enabled = isVaultDirectory(),
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local now = function()
			local now = os.date("*t", os.time())
			return os.time({ day = now.day, month = now.month, year = now.year })
		end

		local time_between = function(end_time, start_time)
			return math.floor(os.difftime(start_time, end_time) / (24 * 60 * 60))
		end

		require("obsidian").setup({
			workspaces = {
				{
					name = "personal",
					path = vim.env[OBSIDIAN_VAULT_ENV],
				},
			},
			daily_notes = {
				folder = JOURNAL_DIRECTORY,
				template = JOURNAL_TEMPLATE,
			},
			notes_subdir = NOTES_DIRECTORY,
			templates = {
				folder = TEMPLATE_DIRECTORY,
				substitutions = {
					daily_journal_count = function()
						return time_between(FIRST_JOURNAL_ENTRY, now()) + 1
					end,
				},
			},
		})

		vim.opt.conceallevel = 2
		vim.api.nvim_create_user_command("ObsidianNewWithTemplate", createNoteWithDefaultTemplate, {})
		require("which-key").register({
			["<leader>o"] = {
				name = "[O]bsidian",
				n = { ":ObsidianNewWithTemplate <cr>", "Create a [n]ew note" },
				d = { ":ObsidianToday <cr>", "Open to[d]ay's journal entry" },
				j = {
					":ObsidianDailies -" .. time_between(FIRST_JOURNAL_ENTRY, now()) .. "<cr><esc>",
					"Open [j]ournal browser",
				},
				g = {
					":ObsidianSearch <cr>",
					"[G]rep Obisdian notes",
				},
			},
		})
	end,
}
