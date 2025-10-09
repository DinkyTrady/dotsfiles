function mvi --wraps='NVIM_APPNAME=nvim-minim nvim' --description 'aliases of neovim with configuration from nvim-minim'
    NVIM_APPNAME=nvim-minim nvim $argv
end

function hx --wraps='helix' --description 'aliases to helix'
    helix
end

function nvn --wraps='NVIM_APPNAME=nvim-test nvim' --description 'aliases of neovim with configuration of neovim nightly'
    NVIM_APPNAME=nvim-test nvim $argv
end
