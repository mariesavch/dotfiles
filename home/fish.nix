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
  programs.htop = {
    enable = true;
    package = pkgs.htop-vim;
    settings = {
      fields = [ 0 48 46 47 1 ];
      screen_tabs = 0;
      hide_function_bar = 2;
      header_layout = "two_50_50";
      column_meters_0 = "LeftCPUs Memory Tasks";
      column_meter_modes_0 = "1 1 2";
      column_meters_1 = "RightCPUs Swap LoadAverage";
      column_meter_modes_1 = "1 1 2";
    };
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      cp = "cp -r";
      rm = "rm -r";
      du = "du -h";
      df = "df -h";
      iw = "iwctl station wlan0";
      nr = "sudo nixos-rebuild switch --flake ~/.dotfiles#kitaro";
      ll = "${lib.getExe pkgs.eza} --icons -l -s type -a --git";
      ls = "${lib.getExe pkgs.eza} --icons -s type -a --git";
      bt = "${lib.getExe pkgs.bluetui}";
      c = "clear";
      g = "git";
      top = "htop";
      tree =
        "${lib.getExe pkgs.eza} --icons -s type -a --git -T -I '.git|target'";
      find = "${lib.getExe pkgs.fd} -H --color never";
      grep = "${lib.getExe pkgs.ripgrep}";
      copy = "wl-copy";
      ":q" = "exit";
      mkdir = "mkdir -p";
    };
    shellInit = ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec sway

      set fish_greeting
      fish_config theme choose theme

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
