@echo off

@REM set STATIC_OR_SHARED="SHARED"
set STATIC_OR_SHARED="STATIC"

set TOP_DIR=%~dp0..\
echo %TOP_DIR%

set VS2019COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build
set VS140COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools
call "%VS2019COMNTOOLS%\\vcvarsall.bat" x86

rmdir /q /s %TOP_DIR%cmake_test_sdk\windows\
rmdir /q /s %TOP_DIR%build\
if not exist %TOP_DIR%build md %TOP_DIR%build

cmake -G "Visual Studio 16 2019" -A WIN32 -DCMAKE_INSTALL_PREFIX=%TOP_DIR%cmake_test_sdk/windows -DLIBRARY_TYPE=%STATIC_OR_SHARED% -B%TOP_DIR%build\ -H%TOP_DIR%
cd %TOP_DIR%build
cmake --build . --config Release
cmake --install . --config Release

goto :eof

