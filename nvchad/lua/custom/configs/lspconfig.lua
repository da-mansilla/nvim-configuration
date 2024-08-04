local config = require("plugins.configs.lspconfig")


local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local util = require "lspconfig/util"

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"}
})


local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
    }
    vim.lsp.buf.execute_command(params)
end

local log = require 'vim.lsp.log';

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.uri, 'react/index.d.ts') == nil
end
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"typescriptreact", "typescript", "javascript"},
  commands = {
      OrganizeImports = {
          organize_imports,
          description="Organize Imports"
      }
  },
  handlers = {
    ["textDocument/definition"] = function(_, result, params)
      if result == nil or vim.tbl_isempty(result) then
        local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, 'No location found')
        return nil
      end

      if vim.tbl_islist(result) then
        vim.lsp.util.jump_to_location(result[1])
        -- if #result > 1 then
        --   local isReactDTs = false
        --   for key, value in pairs(result) do
        --     if string.match(value.uri, "react/index.d.ts") then
        --       isReactDTs = true
        --       break
        --     end
        --   end
        --   if not isReactDTs then
        --     vim.fn.setqflist(vim.lsp.util.locations_to_items(result))
        --     vim.api.nvim_command("copen")
        --   end
        -- end
      else
        vim.lsp.util.jump_to_location(result)
      end

    end
  };
})

lspconfig.clangd.setup({})

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes= {"go","gomod","gowork","gotmpl"},
  root_dir = util.root_pattern("go.work","go.mod",".git")

})

lspconfig.solang.setup({})

lspconfig.stylelint_lsp.setup({
  filetypes = { "css", "scss","ts","tsx","js","jsx"},
  root_dir = lspconfig.util.root_pattern("package.json", ".git"),
  settings = {
    stylelintplus = {
      -- see available options in stylelint-lsp documentation
    },
  },
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})

lspconfig.terraformls.setup({
    settings = {

        validation= {
            enableEnhancedValidation= false}
    }

})
lspconfig.yamlls.setup({})
lspconfig.awk_ls.setup({})

-- lspconfig.awkl.setup({})
-- lspconfig.tflint.setup({})


-- local filetypes = {
--   typescript = {'stylelint'},
--   typescriptreact = {'stylelint'},
-- }
-- local linters = {
--   stylelint = {
--     sourceName = 'stylelint',
--     command = 'stylelint',
--     args = {'--formatter', 'compact', '%filepath'},
--     rootPatterns = {'.stylelintrc'},
--     debounce = 100,
--     formatPattern = {
--       [[: line (\d+), col (\d+), (warning|error) - (.+?) \((.+)\)]],
--       {
--         line = 1,
--         column = 2,
--         security = 3,
--         message = {4, ' [', 5, ']'},
--       },
--     },
--     securities = {
--       warning = 'warning',
--       error = 'error',
--     },
--   },
-- }
--
-- local formatters = {
--   stylelint = {
--     command = 'stylelint',
--     args = {'--fix', '--stdin', '--stdin-filename', '%filepath'},
--   }
-- }
-- local formatFiletypes = {
--   typescript = {'stylelint'},
--   typescriptreact = {'stylelint'},
-- }
--
-- lspconfig.diagnosticls.setup({
--     filetypes = vim.tbl_keys(filetypes),
--     init_options = {
--         filetypes = filetypes,
--         linters = linters,
--         formatters = formatters,
--         formatFiletypes = formatFiletypes,
--   }
--
-- })
