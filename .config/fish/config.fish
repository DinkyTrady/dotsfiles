source /usr/share/cachyos-fish-config/cachyos-config.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
    # starship init fish | source
    zoxide init fish | source
end

fish_add_path $BUN_INSTALL/bin
