cmake_minimum_required(VERSION 3.0...3.5)
<<<<<<< HEAD
set(CMAKE_MODULE_PATH 
    ${CMAKE_SOURCE_DIR}/cmake
)
include(LoadOptions)
=======
project(cpp-project LANGUAGES C CXX)
>>>>>>> fa9d57213adedca5e91664e5daac80c822f24e36

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

<<<<<<< HEAD
=======
set(CMAKE_MODULE_PATH 
    ${CMAKE_SOURCE_DIR}/cmake
)

>>>>>>> fa9d57213adedca5e91664e5daac80c822f24e36
set(INSTALL_GTEST OFF)

include(EnableGoogleTest)
include(CTest)
include(SetGlobalDefines)
include(SetPlatformFlags)

<<<<<<< HEAD
install(FILES ${HEADERS} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/${PROJECT})
=======
install(FILES ${HEADERS} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/)
>>>>>>> fa9d57213adedca5e91664e5daac80c822f24e36

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
