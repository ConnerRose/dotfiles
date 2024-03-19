return {
  "lervag/vimtex",
  dependencies = {
    "xuhdev/vim-latex-live-preview",
  },
  ft = { "tex" },
  config = function()
    vim.cmd [[
        "
        " let g:vimtex_compiler_progname = "nvr"
        " let g:vimtex_view_method = "skim"
        " let g:vimtex_imaps_enabled = 0
        " let g:vimtex_complete_enabled = 0
        "
        " call vimtex#init()
        "
        " set conceallevel=2
        " let g:vimtex_syntax_conceal["math_super_sub"]=0
        " highlight Conceal guifg=#d19a66 guibg=NONE
        "

        " autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pvc -pdf %<CR>
        " let g:latexindent_opt = '-m -y="~/.indentconfig.yaml"'
        let maplocalleader = " "
        let g:tex_flavor='latex'
        let g:vimtex_view_method='skim'
        let g:vimtex_quickfix_mode=0
        set conceallevel=1
        let g:tex_conceal='abdmg'

        augroup vimtex_config
        au!
        au User VimtexEventQuit call vimtex#compiler#clean(0)
        augroup END

        let g:vimtex_syntax_custom_cmds = [
          \ {'name': 'F', 'mathmode': 1, 'concealchar': '𝓕'},
          \ {'name': 'R', 'mathmode': 1, 'concealchar': 'ℝ'},
          \ {'name': 'O', 'mathmode': 1, 'concealchar': 'Ω'},
          \ {'name': 'P', 'mathmode': 1, 'concealchar': 'ℙ'},
          \ {'name': 'eps', 'mathmode': 1, 'concealchar': 'ε'},
          \ {'name': '1', 'mathmode': 1, 'concealchar': '𝟙'},
          \ {'name': 'C', 'mathmode': 1, 'concealchar': 'ℂ'},
        \]
        ]]
  end,
}
