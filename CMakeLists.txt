cmake_minimum_required(VERSION 2.4...4.3)
set(CMAKE_MODULE_PATH 
    ${CMAKE_SOURCE_DIR}/cmake
)
include(LoadOptions)

set_project_options()
project(${PROJECT} LANGUAGES C CXX)
set_compiler_options()

set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(HEADERS
)

set(SOURCES
)

set(TEST_SOURCES
    tests/phony_test.cc
)

set(INSTALL_GTEST OFF)

include(EnableGoogleTest)
include(CTest)
include(SetGlobalDefines)
include(SetPlatformFlags)

install(FILES ${HEADERS} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/${PROJECT})

add_executable(
    cpp-project
    src/main.cc
    ${SOURCES}
)
target_include_directories(cpp-project PRIVATE include)
target_link_libraries(
    cpp-project
)


if (GTest_FOUND)
  add_executable(
      unit_tests
      tests/main.cc
      ${TEST_SOURCES}
  )
  target_include_directories(unit_tests PRIVATE include)
  target_link_libraries(
      unit_tests
      GTest::gtest_main
  )
  gtest_discover_tests(unit_tests)
endif()
