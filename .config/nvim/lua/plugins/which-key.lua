local wk = require "which-key"

local opts = {
	mode = "n",   -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	f = {
		name = "File Ops",                                                      -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" },                   -- create a binding with label
		w = { "<cmd>Telescope live_grep<cr>", "Live Grep" },                    -- create a binding with label
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false }, -- additional options for creating the keymap
		n = { "New File" },                                                     -- just a label. don't create any mapping
		e = "Edit File",                                                        -- same as above
	},
	t = {
		name = "Terminal",
		t = { ":ToggleTerm<cr>", "Split Below" },
		f = { toggle_float, "Floating Terminal" },
		l = { toggle_lazygit, "LazyGit" },
	},
	p = {
		name = "Packer",
		r = { ":PackerClean<cr>", "Remove Unused Plugins" },
		c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
		i = { ":PackerInstall<cr>", "Install Plugins" },
		p = { ":PackerProfile<cr>", "Packer Profile" },
		s = { ":PackerSync<cr>", "Sync Plugins" },
		S = { ":PackerStatus<cr>", "Packer Status" },
		u = { ":PackerUpdate<cr>", "Update Plugins" },
	},
	l = {
		name = "LSP",
		i = { ":LspInfo<cr>", "Connected Language Servers" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
		w = { "<cmd>lua vim.lsp.remove_workspace_folder()<cr>", "Add Workspace folder" },
		W = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace folders" },
		l = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to Declaration" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		e = { "<cmd>lua vim.diagnostic.open_float({scope='line'})<cr>", "Show line diagnostic" },
		n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go to next diagnostic" },
		N = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go to previous diagnostic" },
	},
	b = {
		name = "Buffer Commands",
		b = { "<Cmd>BufferOrderByBufferNumber<CR>", "Order buffers by Number" },
		d = { "<Cmd>BufferOrderByDirectory<CR>", "Order buffers by Directory" },
		l = { "<Cmd>BufferOrderByLanguage<CR>", "Order buffers by Language" },
		w = { "<Cmd>BufferOrderByWindowNumber<CR>", "Order buffers by window number" },
		p = { "<Cmd>BufferPick<CR>", "Pick buffer" },
	},
}
-- Sort automatically by...

wk.register(mappings, opts)
