@echo off

set ARGC=0
for %%x in (%*) do set /A ARGC += 1

if %ARGC% lss 1 (
    echo "proj: no action specified"
    exit /B 1
)

set BUILD_PREFIX="build-Win32"

for /f "delims=" %%L in (project.cfg) do set %%L

if "%1" equ "init" (
    cmake -B %BUILD_PREFIX% -S .
    exit /B 0
)

if "%1" equ "build" (
    cmake --build %BUILD_PREFIX% --config %CMAKE_BUILD_TYPE% --target %TARGET_NAME%;
    exit /B 0
)

if "%1" equ "test" (
    cmake --build %BUILD_PREFIX% --config %CMAKE_BUILD_TYPE% --target unit_tests
    pushd %BUILD_PREFIX%
        ctest
    popd
    exit /B 0
)

if "%1" equ "install" (
    cmake --install %BUILD_PREFIX% --config %CMAKE_BUILD_TYPE% --target %TARGET_NAME%
    exit /B 0
)

if "%1" equ "memcheck" (
    cmake --build %BUILD_PREFIX% --config %CMAKE_BUILD_TYPE% --target unit_tests
    pushd %BUILD_PREFIX%
        ctest -T memcheck
    popd
    exit /B 0
)

if "%1" equ "clean" (
    rmdir /S /Q %BUILD_PREFIX%
    exit /B 0
)
