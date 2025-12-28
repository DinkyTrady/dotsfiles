# Set editor
set -x EDITOR nvim

# Dev path
set -Ux devpath "$HOME/DevPkg"

if test ! -d $devpath
    mkdir $devpath
end

## BunJS
set -Ux BUN_INSTALL "$devpath/.bun"
