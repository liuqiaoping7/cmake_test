
@echo off

set STATIC_OR_SHARED="SHARED"

set TOP_DIR=%~dp0..\
echo %TOP_DIR%

set VS2019COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build
set VS140COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools
call "%VS2019COMNTOOLS%\\vcvarsall.bat" x86

rmdir /q /s %TOP_DIR%cmake_test_sdk\windows\
rmdir /q /s %TOP_DIR%build\
if not exist %TOP_DIR%build md %TOP_DIR%build
cd %TOP_DIR%build
cmake -DLIBRARY_TYPE=%STATIC_OR_SHARED% -DCMAKE_INSTALL_PREFIX=%TOP_DIR%cmake_test_sdk/windows .. 
cmake --build . --config Release
cmake --install . --config Release

goto :eof

