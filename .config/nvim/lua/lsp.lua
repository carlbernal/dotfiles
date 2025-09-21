-- Global config
vim.lsp.config("*", {
  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end,
  root_markers = {
    '.git'
  },
})

-- C / C++
vim.lsp.config["clangd"] = {
  cmd = { "clangd" },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac",
  },
  filetypes = {
    "c",
    "cpp"
  },
}

-- Python
vim.lsp.config["pylsp"] = {
  cmd = { "pylsp" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
  },
  filetypes = { "python" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
        mccabe = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
      }
    }
  }
}

-- JS
vim.lsp.config["ts_ls"] = {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
  },
  filetypes = {
    "javascript",
  },
  init_options = {
    hostInfo = "neovim"
  }
}

vim.lsp.enable({
  "clangd",
  "pylsp",
  "ts_ls",
})
