vim.pack.add({ "https://github.com/goolord/alpha-nvim" })

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local total_plugins = #vim.pack.get(nil, { info = false })
local datetime = tonumber(os.date(" %H "))
-- Set header
dashboard.section.header.val = {
	"                                                                   ",
	"      ████ ██████           █████      ██                    ",
	"     ███████████             █████                            ",
	"     █████████ ███████████████████ ███   ███████████  ",
	"    █████████  ███    █████████████ █████ ██████████████  ",
	"   █████████ ██████████ █████████ █████ █████ ████ █████  ",
	" ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
	"██████  █████████████████████ ████ █████ █████ ████ ██████",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
	dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
	dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
	dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
	-- dashboard.button("SPC sr", "󰁯  > Restore Session For Current Directory", "<cmd>AutoSession restore<CR>"),
	dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
}

local function footer()
	local footer_datetime = os.date("  %m-%d-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
	-- local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
	local value = footer_datetime .. "  Plugins " .. total_plugins .. nvim_version_info
	return value
end

dashboard.section.footer.val = footer()

local greeting = function()
	-- Determine the appropriate greeting based on the hour
	local mesg
	local username = os.getenv("USER")
	if datetime >= 0 and datetime < 6 then
		mesg = "Dreaming..󰒲 󰒲 "
	elseif datetime >= 6 and datetime < 12 then
		mesg = "🌅 Hi " .. username .. ", Good Morning ☀️"
	elseif datetime >= 12 and datetime < 18 then
		mesg = "🌞 Hi " .. username .. ", Good Afternoon ☕️"
	elseif datetime >= 18 and datetime < 21 then
		mesg = "🌆 Hi " .. username .. ", Good Evening 🌙"
	else
		mesg = "Hi " .. username .. ", it's getting late, get some sleep 😴"
	end
	return mesg
end

local bottom_section = {
	type = "text",
	val = greeting,
	opts = {
		position = "center",
	},
}

local section = {
	header = dashboard.section.header,
	bottom_section = bottom_section,
	buttons = dashboard.section.buttons,
	footer = dashboard.section.footer,
}

local opts = {
	layout = {
		{ type = "padding", val = 4 },
		section.header,
		{ type = "padding", val = 4 },
		section.buttons,
		{ type = "padding", val = 2 },
		section.bottom_section,
		{ type = "padding", val = 1 },
		section.footer,
	},
}

-- Send config to alpha
alpha.setup(opts)

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

