# cpp-project

Template C++ project for fast build and deployment

## Overview

This template project is designed for quickly dispatching cpp projects adaptable
to different working environoments. It compilers, compiler options and defines depending on platform. It avoids constant editing of CMakeLists.txt file in search of some option 
or flag that doesn't work on some compiler or platform.

## Project configuration

Project related configuration options are contained in ```project.cfg``` file.
These are compiler independent options such as project name, build type, c/cpp standart,
compilers, cmake generators and etc. 

Compiler related configuration options are contained in ```opt_<compiler>.cfg``` files.
These are compiler specific options such as defines, flags, linkers, linker flags and etc.

All options are being preloaded before first ```project(...)``` invocation occurs, 
so in order to change configuration you can just edit corresponding ```.cfg``` file
and reinit+rebuild project with new options 
