@echo on

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

set TOP_DIR=%~dp0..\
echo %TOP_DIR%
rmdir /q /s %TOP_DIR%cmake_test_sdk\windows\
rmdir /q /s %TOP_DIR%build\
if not exist %TOP_DIR%build md %TOP_DIR%build

set Configuration=RelWithDebInfo
set DebugSymbols=true
@REM set Configuration=Debug
@REM set DebugSymbols=true

@REM @REM bat init bash make work but can not specify msvc version, maybe visual studio just fixed version
@REM call "%VS2019_COMMUNITY%\VC\Auxiliary\Build\vcvarsall.bat" x86 -vcvars_ver=14.28.29910
@REM IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
@REM bash.exe producer\scripts\bash_msvc.sh

@REM call "%VS2019_COMMUNITY%\VC\Auxiliary\Build\vcvarsall.bat" x86 -vcvars_ver=14.28.29910
@REM IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
@REM cl.exe -Bv

@REM do not work
@REM cmake -G "Visual Studio 16 2019" -A WIN32 -DCMAKE_C_COMPILER="C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.28.29910/bin/Hostx64/x86/cl.exe" -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.28.29910/bin/Hostx64/x86/cl.exe" -DCMAKE_INSTALL_PREFIX=%TOP_DIR%cmake_test_sdk/windows -DLIB_TYPE=%LIB_TYPE% -DLIBLIB_TYPE=%LIBLIB_TYPE% -B%TOP_DIR%build\ -H%TOP_DIR%
@REM work well, cmake is flexable, if you just specify v142, will use v142 newest minor version
cmake -G "Visual Studio 16 2019" -T "v142,version=14.28.29910" -A WIN32 -DCMAKE_INSTALL_PREFIX=%TOP_DIR%cmake_test_sdk/windows -DLIB_TYPE=%LIB_TYPE% -DLIBLIB_TYPE=%LIBLIB_TYPE% -B%TOP_DIR%build\ -H%TOP_DIR%

cmake --build %TOP_DIR%build --config %Configuration% --target install -- /p:DebugSymbols=%DebugSymbols% /p:DebugType=pdbonly /p:Optimize=true
@REM use cmake not within Visual Studio, the following method do not work
@REM MSBuild.exe "%TOP_DIR%build\INSTALL.vcxproj" /p:Platform=Win32 /p:Configuration=%Configuration% /p:DebugSymbols=%DebugSymbols% /p:DebugType=pdbonly /p:Optimize=true
@REM devenv.com "%TOP_DIR%build\cmake_lib_out.sln" /Project "INSTALL" /Build "%Configuration%|WIN32"
@REM MSBuild.exe "%TOP_DIR%build\cmake_lib_out.sln" /p:Platform=Win32 /p:Configuration=%Configuration% /p:DebugSymbols=%DebugSymbols% /p:DebugType=pdbonly /p:Optimize=true    @REM not install

if %LIB_TYPE% == STATIC if %LIBLIB_TYPE% == STATIC (
cd %TOP_DIR%cmake_test_sdk\windows\lib
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
lib.exe /OUT:lib.lib lib.lib libliba.lib liblibb.lib
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
del /f /q libliba.lib liblibb.lib
)

goto :eof

