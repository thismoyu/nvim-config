-- https://github.com/nvimdev/dashboard-nvim
-- 欢迎页面
return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { 
            'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('dashboard').setup{
                theme = 'hyper',
                config = {
                    week_header = {
                        enable = true,
                    },
                    packages = { enable = true }, -- show how many plugins neovim loaded
                    shortcut = {
                        { 
                            desc = 'Plugin Update', 
                            group = '@property', 
                            action = 'Lazy update', 
                            key = 'u' 
                        },
                        {
                            desc = 'Find Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                    },
                    -- limit how many projects list, action when you press key or enter it will run this action.
                    -- action can be a functino type, e.g.
                    -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
                    project = { enable = true, limit = 3, icon = '🖿', label = '  Projects', action = 'Telescope find_files cwd=' },
                    footer = {}, -- footer
                },
            }
        end
    }
}

