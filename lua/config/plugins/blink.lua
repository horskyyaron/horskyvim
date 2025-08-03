return {
  { "L3MON4D3/LuaSnip", keys = {} },
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "1.*",
    fuzzy = {
      -- Controls which implementation to use for the fuzzy matcher.
      --
      -- 'prefer_rust_with_warning' (Recommended) If available, use the Rust implementation, automatically downloading prebuilt binaries on supported systems. Fallback to the Lua implementation when not available, emitting a warning message.
      -- 'prefer_rust' If available, use the Rust implementation, automatically downloading prebuilt binaries on supported systems. Fallback to the Lua implementation when not available.
      -- 'rust' Always use the Rust implementation, automatically downloading prebuilt binaries on supported systems. Error if not available.
      -- 'lua' Always use the Lua implementation, doesn't download any prebuilt binaries
      --
      -- See the prebuilt_binaries section for controlling the download behavior
      implementation = 'prefer_rust_with_warning',

      -- Allows for a number of typos relative to the length of the query
      -- Set this to 0 to match the behavior of fzf
      -- Note, this does not apply when using the Lua implementation.
      max_typos = function(keyword) return math.floor(#keyword / 4) end,

      -- Frecency tracks the most recently/frequently used items and boosts the score of the item
      -- Note, this does not apply when using the Lua implementation.
      use_frecency = true,

      -- Proximity bonus boosts the score of items matching nearby words
      -- Note, this does not apply when using the Lua implementation.
      use_proximity = true,

      -- UNSAFE!! When enabled, disables the lock and fsync when writing to the frecency database. This should only be used on unsupported platforms (i.e. alpine termux)
      -- Note, this does not apply when using the Lua implementation.
      use_unsafe_no_lock = false,

      -- Controls which sorts to use and in which order, falling back to the next sort if the first one returns nil
      -- You may pass a function instead of a string to customize the sorting
      sorts = {
	-- (optionally) always prioritize exact matches
	-- 'exact',

	-- pass a function for custom behavior
	-- function(item_a, item_b)
	  --   return item_a.score > item_b.score
	  -- end,

	  'score',
	  'sort_text',
	},

	prebuilt_binaries = {
	  -- Whether or not to automatically download a prebuilt binary from github. If this is set to `false`,
	  -- you will need to manually build the fuzzy binary dependencies by running `cargo build --release`
	  -- Disabled by default when `fuzzy.implementation = 'lua'`
	  download = true,

	  -- Ignores mismatched version between the built binary and the current git sha, when building locally
	  ignore_version_mismatch = false,

	  -- When downloading a prebuilt binary, force the downloader to resolve this version. If this is unset
	  -- then the downloader will attempt to infer the version from the checked out git tag (if any).
	  --
	  -- Beware that if the fuzzy matcher changes while tracking main then this may result in blink breaking.
	  force_version = nil,

	  -- When downloading a prebuilt binary, force the downloader to use this system triple. If this is unset
	  -- then the downloader will attempt to infer the system triple from `jit.os` and `jit.arch`.
	  -- Check the latest release for all available system triples
	  --
	  -- Beware that if the fuzzy matcher changes while tracking main then this may result in blink breaking.
	  force_system_triple = nil,

	  -- Extra arguments that will be passed to curl like { 'curl', ..extra_curl_args, ..built_in_args }
	  extra_curl_args = {},

	  proxy = {
	    -- When downloading a prebuilt binary, use the HTTPS_PROXY environment variable
	    from_env = true,

	    -- When downloading a prebuilt binary, use this proxy URL. This will ignore the HTTPS_PROXY environment variable
	    url = nil,
	  },
	},
      },
      config = function()
	require("blink.cmp").setup({
	  snippets = { preset = "luasnip" },
	  signature = { enabled = true },
	  appearance = {
	    use_nvim_cmp_as_default = false,
	    nerd_font_variant = "normal",
	  },
	  sources = {
	    default = { "lsp", "path", "snippets", "buffer" },
	    providers = {
	      cmdline = {
		min_keyword_length = 2,
	      },
	    },
	  },
	  keymap = {
	    ["<C-f>"] = {},
	  },
	  cmdline = {
	    enabled = false,
	    completion = { menu = { auto_show = true } },
	    keymap = {
	      ["<CR>"] = { "accept_and_enter", "fallback" },
	    },
	  },
	  completion = {
	    menu = {
	      border = nil,
	      scrolloff = 1,
	      scrollbar = false,
	      draw = {
		columns = {
		  { "kind_icon" },
		  { "label",      "label_description", gap = 1 },
		  { "kind" },
		  { "source_name" },
		},
	      },
	    },
	    documentation = {
	      window = {
		border = nil,
		scrollbar = false,
		winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
	      },
	      auto_show = true,
	      auto_show_delay_ms = 500,
	    },
	  },
	})


	require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  }
