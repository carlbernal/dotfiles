return {
	{
		"Olical/conjure",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		ft = {
			"scheme",
			"python",
			"sql",
		},
        enabled = true,
		lazy = true,
		init = function()
			-- vim.g["conjure#debug"] = true
            -- vim.g["conjure#client_on_load"] = false

			vim.g["conjure#eval#inline_results"] = false
			vim.g["conjure#log#hud#enabled"] = false
			vim.g["conjure#log#wrap"] = true

            -- Remove log mappings
			vim.g["conjure#eval#mapping#log_close_visible"] = false
			vim.g["conjure#eval#mapping#log_jump_to_latest"] = false
			vim.g["conjure#eval#mapping#log_toggle"] = false
			vim.g["conjure#eval#mapping#log_buf"] = false
			vim.g["conjure#eval#mapping#log_tab"] = false
			vim.g["conjure#eval#mapping#log_split"] = false
			-- vim.g["conjure#eval#mapping#log_vsplit"] = false

            -- Remove eval mappings
			vim.g["conjure#eval#mapping#eval_comment_current_form"] = false
			vim.g["conjure#eval#mapping#eval_comment_root_form"] = false
			vim.g["conjure#eval#mapping#eval_comment_word"] = false

            -- Remove lsp mappings
			vim.g["conjure#eval#mapping#def_word"] = false
			vim.g["conjure#eval#mapping#doc_word"] = false
		end,
	},
}
