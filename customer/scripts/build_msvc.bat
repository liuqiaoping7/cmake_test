@echo off

set argcount=0
for %%i in (%*) do set /a argcount+=1
if %argcount% NEQ 2 (
    echo "argcount = %argcount%"
    echo "USAGE: %0 STATIC SHARED"
    exit /b 1
)
if not %1 == STATIC if not %1 == SHARED (
    echo "USAGE: args must be STATIC SHARED"
    exit /b 1
)
if not %2 == STATIC if not %2 == SHARED (
    echo "USAGE: args must be STATIC SHARED"
    exit /b 1
)
set LIB_TYPE=%1
set LIBLIB_TYPE=%2

@REM if not defined LIB_TYPE (
@REM     set LIB_TYPE=STATIC
@REM ) else (
@REM     echo "LIB_TYPE=%LIB_TYPE%"    
@REM )
@REM if not defined LIBLIB_TYPE (
@REM     set LIBLIB_TYPE=STATIC
@REM ) else (
@REM     echo "LIBLIB_TYPE=%LIBLIB_TYPE%"    
@REM )

set TOP_DIR=%~dp0..\
echo %TOP_DIR%

set VS2019COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build
set VS140COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools
call "%VS2019COMNTOOLS%\\vcvarsall.bat" x86

rmdir /q /s %TOP_DIR%cmake_test_sdk\windows\
rmdir /q /s %TOP_DIR%build\
if not exist %TOP_DIR%build md %TOP_DIR%build

cmake -G "Visual Studio 16 2019" -A WIN32 -DCMAKE_INSTALL_PREFIX=%TOP_DIR%cmake_test_sdk/windows -DLIB_TYPE=%LIB_TYPE% -DLIBLIB_TYPE=%LIBLIB_TYPE% -B%TOP_DIR%build\ -H%TOP_DIR%
cd %TOP_DIR%build
cmake --build . --config Release
cmake --install . --config Release

goto :eof

