if command -q mise
    set -gx MISE_SHELL fish
    set -gx __MISE_ORIG_PATH $PATH
    mise activate fish | source
end
