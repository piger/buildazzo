#!/bin/bash
# This script will be executed inside Docker to build all the Debian packages.

set -e

cd /build || { echo "You're not inside Docker, aren't you?"; exit 1; }

for d in $(find . -type d -mindepth 1 -maxdepth 1); do
    (
        cd $d;
        fpm-cook clean;
        fpm-cook;
        mv pkg/*.deb ../;
        #rm -rf {cache,pkg,tmp-*}
     )
done
