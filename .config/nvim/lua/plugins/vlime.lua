return {
  {
    "vlime/vlime",
    ft = "lisp",
    config = function()
      vim.g.vlime_cl_connection_type = "swank"
      vim.g.vlime_cl_swank_cmd = "sbcl --load ~/quicklisp/setup.lisp --eval '(ql:quickload :swank)' --eval '(swank:create-server :port 4005 :dont-close t)'"
    end,
  },
}
