#!/bin/sh
if [ $# -ne 1 ]; then
    echo "spmake: no action specified";
    exit 1;
fi

. ./project.cfg;

if [ $1 = "init" ]; then
    cmake -B ${BUILD_PREFIX} -S . \
          -DCMAKE_MODULE_PATH=${CMAKE_MODULES_DIR} \
          -DCMAKE_CONFIGURATION_TYPES=${CMAKE_CONFIGURATION} \
          -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
          -DCMAKE_CXX_FLAGS_DEBUG="${CXXFLAGS_DEBUG} -std=c++${STD}" \
          -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS_RELEASE} -std=c++${STD}" \
          -DCMAKE_CXX_FLAGS_ASAN="${CXXFLAGS_ASAN} -std=c++${STD}";
elif [ $1 = "build" ]; then
    cmake --build ${BUILD_PREFIX} --config ${BUILD_TYPE} --target ${TARGET_NAME};
elif [ $1 = "test" ]; then
    cmake --build ${BUILD_PREFIX} --config ${BUILD_TYPE} --target unit_tests;
elif [ $1 = "clean" ]; then
    rm -rf ${BUILD_PREFIX}
fi;
