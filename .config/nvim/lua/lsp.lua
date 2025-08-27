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
vim.lsp.config["pyright"] = {
  cmd = { 'basedpyright-langserver', '--stdio' },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
  },
  filetypes = { "python" },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
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

-- Dart
vim.lsp.config["dartls"] = {
  cmd = { "dart", "language-server", "--protocol=lsp" },
  root_markers = { "pubspec.yaml" },
  filetypes = {
    "dart",
  },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true
    }
  }
}

vim.lsp.enable({
  "clangd",
  "pyright",
  "ts_ls",
  "dartls"
})
