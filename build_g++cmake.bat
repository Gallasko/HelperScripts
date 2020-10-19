@echo off
cls

if not exist build (
    md build
)
cd build 

if "%1" == "release" goto release
rem if we are not in release mode -> we are in debug mode

:: [Debug] create folder and set the debug flag for cmake
:debug
echo "Build in debug"
if not exist debug (
    md debug
)
cd debug
set flag = "-DCMAKE_BUILD_TYPE=Debug"

:: [Debug] finished
goto build

:: [Release] create folder and set the release flag for cmake
:release
echo "Build in release"
if not exist release (
    md release
)
cd release
set flag = "-DCMAKE_BUILD_TYPE=Release"

:build
cmake %flag% -G "MinGW Makefiles" ../..
mingw32-make
start app