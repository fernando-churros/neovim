return {

    -- ==========================================
    -- LSP + MASON
    -- ==========================================

    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()

            -- Mason
            require("mason").setup()

            -- Capacidades do autocomplete
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            -- Configuração Lua
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },

                        diagnostics = {
                            globals = { "vim" },
                        },

                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file(
                                "",
                                true
                            ),
                        },

                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- Mason LSP Config
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "jdtls",
                    "html",
                    "cssls",
                    "lua_ls",
                    "ts_ls",
                },

                automatic_enable = true,
            })

            -- Diagnósticos
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,

                float = {
                    border = "rounded",
                    source = true,
                },
            })

            -- Atalhos do LSP
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)

                    local opts = {
                        buffer = args.buf,
                    }

                    vim.keymap.set("n", "gd",
                        vim.lsp.buf.definition, opts)

                    vim.keymap.set("n", "gr",
                        vim.lsp.buf.references, opts)

                    vim.keymap.set("n", "gi",
                        vim.lsp.buf.implementation, opts)

                    vim.keymap.set("n", "K",
                        vim.lsp.buf.hover, opts)

                    vim.keymap.set("n", "<leader>rn",
                        vim.lsp.buf.rename, opts)

                    vim.keymap.set("n", "<leader>ca",
                        vim.lsp.buf.code_action, opts)

                    vim.keymap.set("n", "<leader>d",
                        vim.diagnostic.open_float, opts)

                    vim.keymap.set("n", "[d",
                        vim.diagnostic.goto_prev, opts)

                    vim.keymap.set("n", "]d",
                        vim.diagnostic.goto_next, opts)

                end,
            })

        end,
    },

    -- ==========================================
    -- AUTOCOMPLETE
    -- ==========================================

    {
        "hrsh7th/nvim-cmp",

        event = "InsertEnter",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },

        config = function()

            local cmp = require("cmp")

            cmp.setup({

                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({

                    ["<C-Space>"] = cmp.mapping.complete(),

                    ["<C-e>"] = cmp.mapping.abort(),

                    ["<CR>"] = cmp.mapping.confirm({
                        select = false,
                    }),

                    ["<C-j>"] = cmp.mapping.select_next_item(),

                    ["<C-k>"] = cmp.mapping.select_prev_item(),

                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),

                    ["<C-f>"] = cmp.mapping.scroll_docs(4),

                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer" },
                }),

            })

        end,
    },

    -- ==========================================
    -- FORMATACAO
    -- ==========================================

    {
        "stevearc/conform.nvim",

        event = { "BufWritePre" },

        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({
                        async = true,
                        lsp_format = "fallback",
                    })
                end,
                desc = "Formatar código",
            },
        },

        opts = {

            formatters_by_ft = {

                python = { "black" },

                java = { "google-java-format" },

                html = { "prettier" },

                css = { "prettier" },

                javascript = { "prettier" },

                javascriptreact = { "prettier" },

                typescript = { "prettier" },

                typescriptreact = { "prettier" },

                lua = { "stylua" },

            },

            format_on_save = {
                timeout_ms = 1000,
                lsp_format = "fallback",
            },

        },
    },

}

