-- return {
-- 	{
-- 		"benlubas/molten-nvim",
-- 		version = "^1.0.0",
-- 		-- dependencies = { "3rd/image.nvim" },
-- 		build = ":UpdateRemotePlugins",
-- 		init = function()
-- 			-- vim.g.molten_image_provider = "image.nvim"
-- 			vim.g.molten_output_win_max_height = 20
-- 		end,
-- 	},
-- 	-- {
-- 	-- 	"3rd/image.nvim",
-- 	-- 	opts = {
-- 	-- 		backend = "ueberzugpp",
-- 	-- 		max_width = 100,
-- 	-- 		max_height = 12,
-- 	-- 		max_height_window_percentage = math.huge,
-- 	-- 		max_width_window_percentage = math.huge,
-- 	-- 		window_overlap_clear_enabled = true,
-- 	-- 		window_overlap_clear_ft_ignore = { "cpm_menu", "cmp_docs", "" },
-- 	--
-- 	-- 	},
-- 	-- },
-- 	-- {
-- 	-- 		"vhyrro/luarocks.nvim",
-- 	-- 		priority = 1001, -- this plugin needs to run before anything else
-- 	-- 		opts = {
-- 	-- 				rocks = { "magick" },
-- 	-- 		},
-- 	-- },
-- }
return {
  {
    "kiyoon/jupynium.nvim",
    -- build = "pip3 install --user .",
    build = "conda run --no-capture-output -n CV pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
  },
}
