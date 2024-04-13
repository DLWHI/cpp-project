# cpp-project

Template C++ project for fast build and deployment

## Overview

This template project is designed for quickly dispatching cpp projects adaptable
to different working environoments. It configures CMake options as well as
compiler defines and flags depending on platform. It is not designed to completely
rid of editing CMakeLists.txt but to minimize and organize it.

## Project configuration

Project related configuration options are contained in ```project.cfg``` file.
These are platform independent options such as project name, build type and etc.

## Platform/Compiler specific options

CMake automatically loads all the variables stored in ```opt_win.cfg```/```opt_unix.cfg```
to CMake cache so it would use them to configure project build. Currently
major platforms as Windows, Linux and Apple-Darwin are supported, but one can
create own opt file and edit ```cmake/SetPlatformFlags.cmake``` file to upload
options from that file.

## Proj utility

This utility is designed to quickly init/build/test/etc. project from terminal.
It is supported on any platform supporting POSIX shell as well as on Windows.
It loads variables from project.cfg to determine build folder and target to execute.
List of options:
- ```init``` - runs CMake to initialize project
- ```build``` - builds specific CMake target
- ```test``` - runs ctest on project
- ```install``` - install target via CMake
- ```memcheck``` - runs ctest with memory checking
- ```clean``` - deletes build folder

Following options in ```project.cfg``` are interpreted as folows:
- ```BUILD_PREFIX``` - generated build path (Default: build-%PLATFORM_NAME%) 
- ```INSTALL_PREFIX``` - install path (No default value)  
- ```TARGET_NAME``` - target name to build (Default: cpp-project)  
- ```BUILD_TYPE``` - build type or configuration, depends on detected generator (Default: Debug)
- ```CMAKE_CONFIGURATION_TYPES``` - semicolon separated cmake configurations/build
types for current project (Default: Debug;Release;Asan)

### Default Configuration/Build Types

- ```Debug``` - debug build
- ```Release``` - release build  
- ```Asan``` - build with address sanitizer metadata, may not work with some features
