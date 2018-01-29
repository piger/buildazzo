# Buildazzo

Build Debian packages using [fpm-cookery](https://github.com/bernd/fpm-cookery) and Docker.

## Instructions

Run `./build-image.sh` to build the Docker image; then put in `./build/` all the formulas that you
wish to build and finally run `./build-pkgs.sh`.
The resulting packages will be placed in `./build/`.
