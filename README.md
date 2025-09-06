# terminal dotfiles

This aims to be a easy to deploy configuration for a smooth terminal setup.

## installation

### clone repo to `~/.dotfiles`

``` bash
git clone --recurse-submodules https://github.com/wohltat/dotfiles.git ~/dotfiles
cd ~/.dotfiles
./install.sh  # or manually execute each stow step
```

You may need to manually install some packages noted in `install.sh` which can vary for your linux distribution.

## docker image

In `docker_image/` there is the config for a docker container with everything installed.

``` bash
./build.sh
./run.sh
```
