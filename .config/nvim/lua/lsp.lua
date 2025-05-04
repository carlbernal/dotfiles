-- Global config
vim.lsp.config("*", {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = {
    '.git'
  },
})

-- C, C++
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
    "cpp",
    "proto"
  },
}

-- Golang
vim.lsp.config["gopls"] = {
  cmd = { "gopls" },
  root_markers = {
    "go.work",
    "go.mod"
  },
  filetypes = {
   "go",
   "gomod",
   "gowork",
   "gotmpl"
  },
}

-- Python
vim.lsp.config["pyright"] = {
  cmd = { "pyright-langserver", "--stdio" },
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
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true
      }
    }
  }
}

-- JS, TS
vim.lsp.config["ts_ls"] = {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
  },
  filetypes = {
    "javascript",
    "typescript"
  },
  init_options = {
    hostInfo = "neovim"
  }
}

vim.lsp.enable({
  "clangd",
  "gopls",
  "pyright",
  "ts_ls"
})
