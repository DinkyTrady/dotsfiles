set cargo_env "$devpath/.cargo/env.fish"

if ! source "$cargo_env"
    echo "failed to source $cargo_env"
    exit 1
end

# Rust
set -Ux RUSTUP_HOME "$devpath/.rustup"
set -Ux CARGO_HOME "$devpath/.cargo"
