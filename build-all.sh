#!/bin/bash

set -e

cd /build

for d in $(find . -type d -mindepth 1 -maxdepth 1); do
    (
        cd $d;
        fpm-cook clean;
        fpm-cook;
        mv pkg/*.deb ../;
        #rm -rf {cache,pkg,tmp-*}
     )
done
