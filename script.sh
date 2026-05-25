if grep -qv fish /proc/$PPID/comm && [[ $SHLVL == [12] ]]; then
        # set $SHELL for better integration with programs like nix shell, tmux, etc.
        SHELL=${pkgs.fish}/bin/fish exec fish
    fi
