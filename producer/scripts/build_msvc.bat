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
rmdir /q /s %TOP_DIR%cmake_test_sdk\windows\
rmdir /q /s %TOP_DIR%build\
if not exist %TOP_DIR%build md %TOP_DIR%build

@REM set VS2019COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build
if defined VS2019COMNTOOLS (
    call "%VS2019COMNTOOLS%\\vcvarsall.bat" x86
    cmake -G "Visual Studio 16 2019" -A WIN32 -DCMAKE_INSTALL_PREFIX=%TOP_DIR%cmake_test_sdk/windows -DLIB_TYPE=%LIB_TYPE% -DLIBLIB_TYPE=%LIBLIB_TYPE% -B%TOP_DIR%build\ -H%TOP_DIR%
    cmake --build %TOP_DIR%build --config Release --target install -- /p:NoWarn="4273%3B4133" /m:4 /p:DebugType=pdbonly /p:Optimize=true /p:WarningLevel=3 /flp2:errorsonly;logfile=%TOP_DIR%build\msbuild.err
    @REM MSBuild "%TOP_DIR%build\cmake_lib_out.sln" /p:NoWarn="4273;4133" /m:4 /p:Platform=Win32 /p:Configuration=Release /p:DebugType=pdbonly /p:Optimize=true /p:WarningLevel=3 /flp2:errorsonly;logfile=%TOP_DIR%build\msbuild.err
    @REM devenv.com "%TOP_DIR%build\cmake_lib_out.sln" /Project "INSTALL" /Build "Release|WIN32"
) else if defined VS2015_HOME (
	call "%VS2015_HOME%\VC\bin\vcvars32.bat
    cmake -G "Visual Studio 14 2015" -A WIN32 -DCMAKE_INSTALL_PREFIX=%TOP_DIR%cmake_test_sdk/windows -DLIB_TYPE=%LIB_TYPE% -DLIBLIB_TYPE=%LIBLIB_TYPE% -B%TOP_DIR%build\ -H%TOP_DIR%
    cmake --build %TOP_DIR%build --config Release --target install -- /p:NoWarn="4273%3B4133" /m:4 /p:DebugType=pdbonly /p:Optimize=true /p:WarningLevel=3 /flp2:errorsonly;logfile=%TOP_DIR%build\msbuild.err
    @REM MSBuild "%TOP_DIR%build\cmake_lib_out.sln" /p:NoWarn="4273;4133" /m:4 /p:Platform=Win32 /p:Configuration=Release /p:DebugType=pdbonly /p:Optimize=true /p:WarningLevel=3 /flp2:errorsonly;logfile=%TOP_DIR%build\msbuild.err
    @REM devenv.com "%TOP_DIR%build\cmake_lib_out.sln" /Project "INSTALL" /Build "Release|WIN32"
) else (
	echo "visual studio 2015 2019 not found"
	EXIT /B 1
)

if %LIB_TYPE% == STATIC if %LIBLIB_TYPE% == STATIC (
cd %TOP_DIR%cmake_test_sdk\windows\lib
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
lib.exe /OUT:lib.lib lib.lib libliba.lib liblibb.lib
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
del /f /q libliba.lib liblibb.lib
)

goto :eof

