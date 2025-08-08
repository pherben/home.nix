{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Pherben";
    userEmail = "q4ow@proton.me";

    extraConfig = {
      init.defaultBranch = "main";

      core = {
        editor = "hx";
        autocrlf = "input";
        pager = "delta";
      };

      pull.rebase = true;
      push.autoSetupRemote = true;

      interactive.diffFilter = "delta --color-only";

      delta = {
        navigate = true;
        dark = true;
      };

      merge.conflictstyle = "zdiff3";

      alias = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        st = "status";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
        visual = "log --oneline --decorate --all --graph";
        hist =
          "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
      };

      advice.addEmptyPathspec = false;

      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };

  home.packages = with pkgs; [ git delta ];
}
