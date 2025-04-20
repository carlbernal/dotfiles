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
    ".git"
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
    "go.mod",
    ".git"
  },
  filetypes = {
    "go",
    "gomod",
    "gowork",
    "gotmpl"
  }
}

-- Lua
vim.lsp.config["lua_ls"] = {
  cmd = { "lua-language-server"},
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git"
  },
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      runtime = {
        version = 'LuaJIT',
      }
    },
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
    ".git"
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
    ".git"
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
  "lua_ls",
  "pyright",
  "ts_ls"
})
