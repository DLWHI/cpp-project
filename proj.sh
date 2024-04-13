#!/bin/sh
BUILD_PREFIX="build-$(uname)";
if [ $# -ne 1 ]; then
    echo "proj: no action specified";
    exit 1;
fi;

. ./project.cfg;

if [ $1 = "init" ]; then
    cmake -B ${BUILD_PREFIX} -S .
elif [ $1 = "build" ]; then
    cmake --build ${BUILD_PREFIX} --config ${CMAKE_BUILD_TYPE} --target ${TARGET_NAME};
elif [ $1 = "test" ]; then
    cmake --build ${BUILD_PREFIX} --config ${CMAKE_BUILD_TYPE} --target unit_tests;
    cd ${BUILD_PREFIX} && ctest
elif [ $1 = "install" ]; then
    cmake --install ${BUILD_PREFIX} --config ${CMAKE_BUILD_TYPE} --target ${TARGET_NAME};
elif [ $1 = "memcheck" ]; then
    cmake --build ${BUILD_PREFIX} --config ${CMAKE_BUILD_TYPE} --target unit_tests;
    cd ${BUILD_PREFIX} && ctest -T memcheck
elif [ $1 = "clean" ]; then
    rm -rf ${BUILD_PREFIX}
fi;
