local options = {
  ensure_installed = {
    'css', 'html', 'javascript',
    'lua', 'python', 'scss', 'tsx',
    'typescript', 'vim',
  },
  autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  context_commentstring= {
      enable = true,
      enable_autocmd = false ,

  }

  -- indent = { enable = true },
}

return options
