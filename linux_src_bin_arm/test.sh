#!/usr/bin/env sh

docker run -it -v /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static -v "$(pwd):/testing" phenomial-test-arm