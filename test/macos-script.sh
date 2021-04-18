#!/bin/sh -x
# -eux

brew install \
    automake \
    bash

python3 -m pip install -r test/requirements.txt

export bashcomp_bash=bash
env

autoreconf -i
./configure
make -j

find --help || :
javaws -help || :
printenv --help || :
getconf -a || :
getconf --help || :

make distcheck \
    PYTESTFLAGS="${PYTESTFLAGS---verbose --numprocesses=auto --dist=loadfile}"
