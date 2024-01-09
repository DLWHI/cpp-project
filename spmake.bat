@echo off

set ARGC=0
for %%x in (%*) do set /A ARGC += 1

if %ARGC% neq 1 (
    echo "spmake.bat: no action specified"
    exit /B 1
)

for /f "delims=" %%L in (project.cfg) do set %%L

if "%1" equ "init" (
    cmake -B %BUILD_PREFIX% -S . ^
          -DCMAKE_MODULE_PATH=%CMAKE_MODULES_DIR% ^
          -DCMAKE_CONFIGURATION_TYPES=%CMAKE_CONFIGURATIONS% ^
          -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
          -DCMAKE_CXX_FLAGS_DEBUG="%CXXFLAGS_DEBUG% -std=c++%STD%" ^
          -DCMAKE_CXX_FLAGS_RELEASE="%CXXFLAGS_RELEASE% -std=c++%STD%" ^
          -DCMAKE_CXX_FLAGS_ASAN="%CXXFLAGS_ASAN% -std=c++%STD%";
    exit /B 0
)

if "%1" equ "build" (
    cmake --build %BUILD_PREFIX% --config %BUILD_TYPE% --target %TARGET_NAME%;
    exit /B 0
)

if "%1" equ "test" (
    cmake --build %BUILD_PREFIX% --config %BUILD_TYPE% --target unit_tests;
    exit /B 0
)

if "%1" equ "clean" (
    rmdir /S /Q %BUILD_PREFIX%
    exit /B 0
)
