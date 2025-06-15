{ colors, pkgs, lib, ... }: {
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };
  programs.nix-your-shell = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.htop = {
    enable = true;
    package = pkgs.htop-vim;
    settings = {
      fields = [ 0 48 46 47 1 ];
      screen_tabs = 0;
      hide_function_bar = 2;
    };
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "${lib.getExe pkgs.eza} --icons -l -s type -a --git";
      ls = "${lib.getExe pkgs.eza} --icons -s type -a --git";
      tree =
        "${lib.getExe pkgs.eza} --icons -s type -a --git -T -I '.git|target'";
      img = "${lib.getExe pkgs.timg}";
      cp = "${lib.getExe pkgs.xcp} -r";
      rm = "${lib.getExe pkgs.rip2}";
      top = "htop";
      du = "du -h";
      df = "df -h";
      iw = "iwctl station wlan0";
      find = "fd -H";
      fd = "fd -H";
      grep = "rg";
      copy = "wl-copy";
      ":q" = "exit";
      mkdir = "mkdir -p";
      nr = "sudo nixos-rebuild switch --flake ~/.dotfiles#kitaro";
      pm = "${lib.getExe pkgs.pulsemixer}";
      bt = "${lib.getExe pkgs.bluetuith}";
      ipinfo = "curl -s ipinfo.io";
      c = "clear";
      g = "git";
    };
    shellInit = ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec sway

      set fish_greeting
      fish_config theme choose theme

      ${lib.getExe pkgs.nix-your-shell} fish | source

      function __neovim_cwd_hook -v PWD
          nvim --server $NVIM_LISTEN_SOCKET --remote-send "<C-\><C-n><cmd>tchdir $PWD<cr>i"
      end

      function ":e" 
        nvim --server $NVIM_LISTEN_SOCKET --remote-send "<C-\><C-n><cmd>e $argv<cr>"
      end

      function ":h" 
        nvim --server $NVIM_LISTEN_SOCKET --remote-send "<C-\><C-n><cmd>Man $argv<cr>"
      end

      function fish_prompt
          if test $status -eq 0
              set_color ${colors.teal}
          else
              set_color ${colors.red}
          end
          echo " "
          echo -n "λ "
          set_color normal
      end
    '';
  };

  xdg.configFile."fish/themes/theme.theme".text = ''
    fish_color_normal ${colors.text}
    fish_color_command ${colors.blue}
    fish_color_param ${colors.pink}
    fish_color_keyword ${colors.flamingo}
    fish_color_quote ${colors.blue}
    fish_color_redirection ${colors.mauve}
    fish_color_end ${colors.peach}
    fish_color_comment ${colors.overlay0}
    fish_color_error ${colors.red}
    fish_color_gray ${colors.overlay0}
    fish_color_selection --background=${colors.surface0}
    fish_color_search_match --background=${colors.surface0}
    fish_color_option ${colors.green}
    fish_color_operator ${colors.pink}
    fish_color_escape ${colors.peach}
    fish_color_autosuggestion ${colors.overlay0} -i
    fish_color_cancel ${colors.red}
    fish_color_cwd ${colors.yellow}
    fish_color_user ${colors.teal}
    fish_color_host ${colors.lavender}
    fish_color_host_remote ${colors.green}
    fish_color_status ${colors.maroon}
    fish_pager_color_progress ${colors.overlay0}
    fish_pager_color_prefix ${colors.mauve}
    fish_pager_color_completion ${colors.text}
    fish_pager_color_description ${colors.overlay0}
  '';
}
