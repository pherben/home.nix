{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting

      if type -q starship
        starship init fish | source
        set -gx STARSHIP_CACHE $XDG_CACHE_HOME/starship
        set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
      end

      set fish_pager_color_prefix cyan
      set fish_color_autosuggestion brblack
      set GOPATH $XDG_DATA_HOME/go
      set -x XDG_STATE_HOME "$HOME/.local/state"

      alias l='eza -lh --icons=auto'
      alias ls='eza --icons=auto'
      alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
      alias ld='eza -lhD --icons=auto'
      alias lt='eza --tree --icons=auto'
      alias la='eza -la --icons=auto'
      alias lsd='eza -ld --icons=auto */'
      alias nd="nix develop --command fish"
      alias lg lazygit
      alias pnpm bun
      alias yarn bun
      alias vim hx
      alias vi hx

      abbr .. 'cd ..'
      abbr ... 'cd ../..'
      abbr .3 'cd ../../..'
      abbr .4 'cd ../../../..'
      abbr .5 'cd ../../../../..'

      abbr g git
      abbr ga 'git add'
      abbr gb 'git branch'
      abbr gc 'git commit'
      abbr gca 'git commit --amend'
      abbr gco 'git checkout'
      abbr gd 'git diff'
      abbr gl 'git pull'
      abbr gp 'git push'
      abbr gst 'git status'
      abbr grv 'git remote -v'
      abbr glg 'git log --oneline --graph --decorate --all'
      abbr gci 'git commit -a -m "Initial commit"'

      abbr mkdir 'mkdir -p'
      abbr df 'df -h'
      abbr du 'du -h --max-depth=1'
      abbr free 'free -h'
      abbr please sudo
      abbr c code
      abbr klte 'bun create next-app@latest --example https://github.com/keircn/klte'

      if not contains -- "$HOME/.local/bin" $PATH
          set -gx PATH "$HOME/.local/bin" $PATH
      end

      if not contains -- "$GOPATH/bin" $PATH
          set -gx PATH "$GOPATH/bin" $PATH
      end
    '';
    loginShellInit = ''
      for line in (cat $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh | grep '^export ')
        set var (string split "=" (string replace "export " "" $line))
        set -gx $var[1] (string trim --chars='"' $var[2])
      end
    '';
  };
}
