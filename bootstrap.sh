#!/usr/bin/env bash

set -eu
set -o pipefail

function dep() {
    ./.mason/mason install $1 $2
    ./.mason/mason link $1 $2
}

function all_deps() {
    dep lua 5.3.0 &
    dep luabind e414c57bcb687bb3091b7c55bbff6947f052e46b &
    dep boost 1.61.0 &
    dep boost_libatomic 1.61.0 &
    dep boost_libchrono 1.61.0 &
    dep boost_libsystem 1.61.0 &
    dep boost_libthread 1.61.0 &
    dep boost_libfilesystem 1.61.0 &
    dep boost_libprogram_options 1.61.0 &
    dep boost_libregex 1.61.0 &
    dep boost_libiostreams 1.61.0 &
    dep boost_libtest 1.61.0 &
    dep boost_libdate_time 1.61.0 &
    dep expat 2.1.1 &
    dep stxxl 1.4.1 &
    dep bzip2 1.0.6 &
    dep zlib system &
    dep tbb 43_20150316 &
    wait
}

function main() {
    # setup mason and deps
    ./scripts/setup_mason.sh
    all_deps
}

main

set +eu
set +o pipefail
