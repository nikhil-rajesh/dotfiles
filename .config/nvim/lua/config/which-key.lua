local wk = require("which-key")

-- Language Server Protocols
wk.register({
    ["<space>"] = {
        name = "lsp",
        e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float with diagnostic" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Set diagnostic to location list" },
        wa = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace Folder" },
        wr = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace Folder" },
        wl = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Workspace Folders" },
        D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
        rn = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename variable" },
        ca = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Formats the buffer" },
    },
    gD = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
    gd = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" },
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Information" },
    gi = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation" },
    gr = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Goto prev diagnostic" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Goto next diagnostic" },
    ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show Signature Help" },
}, { silent = true })

-- Normal Mode
wk.register({
    ["<leader>"] = {
        name = "custom",
        v = {
            name = "vimrc",
            e = { "<cmd>e $MYVIMRC<CR>", "Edit vimrc" },
            s = { ":luafile %<CR>", "Soucre vimrc" }
        },
        f = {
            name = "SnipRun",
            [""] = { "<Plug>SnipRunOperator", "Operator Mode", silent=true},
            f = { "<Plug>SnipRun", "Run current line", silent=true}
        },
        y = { '"+y', "Copy to System Clipboard" },
        p = { '"+p', "Paste from System Clipboard" },
        m = {
            name = "markdown",
            p = { "<cmd>Glow<cr>", "Markdown Preview" },
        },
        s = {
            name = "sidebar",
            i = { "<cmd>NvimTreeToggle<cr>", "File Tree Sidebar" },
            s = { "<cmd>SymbolsOutline<cr>", "Symbols Sidebar" },
        },
        ["<space>"] = { ":nohlsearch<cr>", "Search Highlight Off"}
    },
    ["<C-f>"] = {
        name = "file",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        g = { "<cmd>Telescope live_grep<cr>", "Search Inside Files" },
        b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
        r = { "<cmd>Telescope registers<cr>", "Find Register" },
        t = { "<cmd>Telescope treesitter<cr>", "Find Treesitter Symbols" },
        o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    },
    n = { "nzzzv", "Force Next Search Term to center"},
    N = { "Nzzzv", "Force Prev Search Term to center"},
    Y = { "Copy from cursor to EOL" },
    g = {
        c = {
            name = "Linewise Comments",
            c = { "Comment Current Line" },
            o = { "Comment next line and enter INSERT mode" },
            O = { "Comment prev line and enter INSERT mode" },
            A = { "Comment EOL and enter INSERT mode" },
        },
        b = {
            name = "Blockwise Comments",
            c = { "Comment Current Line" },
        }
    },
    ["<C-h>"] = { "<C-w><C-h>", "Goto Left Split" },
    ["<C-j>"] = { "<C-w><C-j>", "Goto Bottom Split" },
    ["<C-k>"] = { "<C-w><C-k>", "Goto Top Split" },
    ["<C-l>"] = { "<C-w><C-l>", "Goto Right Split" },
    ["<C-u>"] = { "Scroll Half Page Up" },
    ["<C-d>"] = { "Scroll Half Page Down" },
    ["<C-b>"] = { "Scroll Full Page Up" },
    ["<C-y>"] = { "Scroll Quarter Page Up" },
    ["<C-e>"] = { "Scroll Quarter Page Down" },
})

-- Insert Mode
wk.register({
    ["<Tab>"] = {
        "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
        "Jump to next selection in snippet",
        noremap=false,
        expr=true
    },
    ["<S-Tab>"] = {
        "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
        "Jump to prev selection in snippet",
        noremap=false,
        expr=true
    },
}, { mode = "i" })

-- Select Mode
wk.register({
    ["<Tab>"] = {
        "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
        "Jump to next selection in snippet",
        noremap=false,
        expr=true
    },
    ["<S-Tab>"] = {
        "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
        "Jump to prev selection in snippet",
        noremap=false,
        expr=true
    },
}, { mode = "s"})

-- Visual Mode
wk.register({
    ["<leader>"] = {
        y = { '"+y', "Copy to System Clipboard" },
        p = { '"+p', "Paste from System Clipboard" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename selected", silent=true },
        f = { "<Plug>SnipRun", "Run selected code", silent=true}
    }
}, { mode = "v" })

wk.setup{}
