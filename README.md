# Dotsfiles

<!--toc:start-->

- [Dotsfiles](#dotsfiles)
  - [My Personal nixos configuration](#my-personal-nixos-configuration)
    - [How to use it](#how-to-use-it)
    <!--toc:end-->

## My Personal nixos configuration

> [!WARNING]
> make sure [hardware-configuration.nix](./hosts/shizuka/hardware-configuration.nix) are always same the current computer

### How to use it

make sure to clone it in home directory
and u have stow

```bash
git clone -b nixos --depth=1 https://github.com/DinkyTrady/dots ./newdots

#cd newdots && stow .

# rebuild for nixos
sudo nixos-rebuild switch --flake .#shizuka --show-trace -L -v

# rebuild for nix-on-droid
nix-on-droid -F . switch --show-trace -L -v
```
