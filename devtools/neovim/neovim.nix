{ lib, pkgs, ... }:
with lib;
{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      #style
      tokyonight-nvim
      alpha-nvim

      #editor
      nvim-autopairs
      nvim-surround
      nvim-ts-autotag
      nvim-treesitter.withAllGrammars
      nvim-tree-lua
      telescope-nvim
      plenary-nvim
      nvim-web-devicons
      telescope-file-browser-nvim
      indent-blankline-nvim

      #ui
      trouble-nvim
      toggleterm-nvim
      bufferline-nvim
      lualine-nvim

      #keybinds
      which-key-nvim

      #lsp and cmp
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      null-ls-nvim
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-nvim-lsp
      cmp_luasnip
      luasnip
      friendly-snippets

      #dap
      nvim-dap
    ];
    extraPackages = with pkgs; [
      ripgrep
      manix
      nil
      sumneko-lua-language-server
    ];

    extraConfig = ''
      lua << EOF
        ${ builtins.readFile ./config/autocmd.lua }
        ${ builtins.readFile ./config/cmp.lua }
        ${ builtins.readFile ./config/editor.lua }
        ${ builtins.readFile ./config/globals.lua }
        ${ builtins.readFile ./config/keybinds.lua }
        ${ builtins.readFile ./config/lsp.lua }
        ${ builtins.readFile ./config/dap.lua }
        ${ builtins.readFile ./config/options.lua }
        ${ builtins.readFile ./config/style.lua }
        ${ builtins.readFile ./config/ui.lua }
        ${ builtins.readFile ./config/which-key.lua }
      EOF
    '';
  };
}
