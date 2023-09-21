local M = {}

function M.create_folder(path)
    vim.fn.mkdir(path, 'p') -- 'p' flag to create parent directories if they don't exist

    -- Abrir un nuevo split y mostrar el directorio actual
    local split_command = string.format("vsp %s", vim.fn.getcwd())
    vim.cmd(split_command)
end

return M

