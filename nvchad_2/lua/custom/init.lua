-- local my_plugin = require('/home/amansilla/www/plugins/react-create-components-vim/')
-- vim.keymap.set("n",'<leader>pl',)
-- Configura una función para obtener el nombre de archivo desde NvimTree
function GetSelectedFolder()
    local api = require("nvim-tree.api")
    api.tree.focus()
    local node = api.tree.get_node_under_cursor()

    if node and node.type == 'directory' then
        return node.absolute_path
    else
        return nil
    end
end

-- Configura una función que utilizará el nombre de archivo obtenido
-- function MyFunction()
--     local selected_filename = GetSelectedFilename()
--     if selected_filename then
--         -- Haz lo que necesites con el nombre de archivo
--         print("Nombre de archivo seleccionado: " .. selected_filename)
--     else
--         print("Ningún archivo seleccionado.")
--     end
-- end
function create_folder()
    local selected_directory = GetSelectedFolder()
    local new_component = vim.fn.input('Create ReactComponent: ')

    local component_directory = selected_directory .. '/' .. new_component
    vim.fn.mkdir(component_directory, 'p')

    -- Crea un archivo .tsx en el directorio seleccionado
    local component_file = component_directory .. '/' .. new_component .. '.tsx'

    -- Verificar si el archivo ya existe
    if vim.fn.filereadable(component_file) == 0 then
        local file_content = string.format(
        'import * as React from \'react\';\n\nexport interface %sInferface {}\n\nconst %s: React.FC<%sInferface> = () => {\n    return (\n        <div>%s Component</div>\n    )\n}\n\nexport default %s\n',
            new_component,
            new_component,
            new_component,
            new_component,
            new_component
        )
        vim.fn.writefile({}, component_file) -- Crear el archivo vacío
        local file = io.open(component_file, 'w')
        file:write(file_content)
        file:close()
        vim.cmd('edit ' .. component_file)   -- Abrir el archivo en el buffer actual
    else
        print('El archivo ya existe: ' .. component_file)
    end
end

vim.keymap.set('n', '<leader>cf', [[<Cmd>lua create_folder()<CR>]], { noremap = true, silent = true })


vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Emmet
--vim.keymap.set("n","<leader>,", )
--let g:user_emmet_leader_key='<C-Z>'

-- Git Status
vim.keymap.set("n","<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>ga", ":Gvdiffsplit<CR>")
-- Git Diff Split Vertical
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-M>", "<C-^>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>a", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left><Left>]])
--vim.keymap.set("v", "<C-r>", "hy:%s/<C-r>h//gc<left><left><left>")



--vim.opt.guicursor = ""

--set splitright = 2
--vim.opt.wrapmargin = 2
--window.completion.side_padding = 2
--vim.opt.splitright = true
-- Quitar Banner del explorador
vim.g.netrw_banner = 0

vim.opt.shiftwidth = 10
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
--vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.clipboard=exclude:*
-- set clipboard=exclude:*
-- set clipboard+=unnamed
-- set clipboard+=unnamedplus



--vim.opt.colorcolumn = "100"

vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.python2_host_prog = '/usr/bin/python2.7'
vim.g.loaded_python3_provider=1
