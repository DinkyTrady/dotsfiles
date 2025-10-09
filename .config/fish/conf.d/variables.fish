# Set editor
set -x EDITOR nvn

# Dev path
set -Ux devpath "$HOME/DevPkg"

if test ! -d $devpath
    mkdir $devpath
end

## BunJS
set -Ux BUN_INSTALL "$devpath/.bun"
