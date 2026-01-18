return {
    -- main lsp config
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "clangd",
                "gopls",
                "jdtls",
                "cssls",
                "html",
                "jsonls",
                "pyright",
                "yamlls",
                "bashls",
                "marksman",
                "fish_lsp",
                "tailwindcss",
                "eslint"
            },
            handlers = {
                function(server)
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()
                    require("lspconfig")[server].setup({ capabilities = capabilities })
                end,
                tailwindcss = function()
                    require("lspconfig").tailwindcss.setup({
                        filetypes = {
                            "html",
                            "css",
                            "scss",
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "vue",
                            "svelte",
                        },
                        settings = {
                            tailwindCSS = {
                                experimental = {
                                    classRegex = {
                                        "tw`([^`]*)",
                                        'tw="([^"]*)',
                                        'tw={"([^"}]*)',
                                        "tw\\.\\w+`([^`]*)",
                                        "tw\\(.*?\\)`([^`]*)",
                                    },
                                },
                            },
                        },
                    })
                end,
                emmet_ls = function()
                    require("lspconfig").emmet_ls.setup({
                        filetypes = {
                            "html",
                            "css",
                            "scss",
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                        },
                    })
                end,
            },
        },
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {},
            },
            "neovim/nvim-lspconfig",
        },
    },
    -- formatter tools
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
        opts = {
            ensure_installed = {
                "stylua",
                "black",
                "isort",
                -- "prettierd",
                -- "prettier",
                "biome",
                "eslint_d",
                "clang-format",
                "google-java-format",
                "shfmt",
            },
            auto_update = false,
            run_on_start = false,
        },
    },
    -- cmp autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
                window = {
                    completion = cmp.config.window.bordered({
                        border = "rounded",
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel",
                        scrollbar = false,
                    }),
                    documentation = cmp.config.window.bordered({
                        border = "rounded",
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                        max_width = 80,
                        max_height = 20,
                    }),
                },
            })

            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    },
    -- conform formatter
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { "biome", "eslint_d", "prettierd", "prettier", stop_after_first = true },
                typescript = { "biome", "eslint_d", "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "biome", "eslint_d", "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "biome", "eslint_d", "prettierd", "prettier", stop_after_first = true },
                json = { "biome", "prettierd", "prettier", stop_after_first = true },
                html = { "biome", "prettierd", "prettier", stop_after_first = true },
                css = { "biome", "prettierd", "prettier", stop_after_first = true },
                yaml = { "biome", "prettierd", "prettier", stop_after_first = true },
                markdown = { "biome", "prettierd", "prettier", stop_after_first = true },
                rust = { "rustfmt", lsp_format = "fallback" },
                go = { "goimports", "gofmt" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                java = { "google-java-format" },
                sh = { "shfmt" },
                bash = { "shfmt" },
                fish = { "fish_indent" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    },
}
