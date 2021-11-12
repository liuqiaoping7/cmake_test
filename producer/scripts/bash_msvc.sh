# function initMSBuild(){
#     echo ${VS2019_COMMUNITY}
#     cd "${VS2019_COMMUNITY}/VC/Auxiliary/Build"
#     pwd
#     ./vcvarsall.bat x86 -vcvars_ver=14.28    #executed, can not specify msvc version, eventually can not initial environment
#     cd -
#     pwd
# }
# initMSBuild

cl.exe -Bv
echo ${TOP_DIR}cmake_test_sdk/windows
cmake -G "Visual Studio 16 2019" -T "v142,version=14.28.29910" -A WIN32 -DCMAKE_INSTALL_PREFIX=${TOP_DIR}cmake_test_sdk/windows -DLIB_TYPE=${LIB_TYPE} -DLIBLIB_TYPE=${LIBLIB_TYPE} -B${TOP_DIR}build -H${TOP_DIR}
cmake --build ${TOP_DIR}build --config ${Configuration} --target install -property:DebugSymbols=${DebugSymbols} -property:DebugType=pdbonly -property:Optimize=true
# use cmake not within Visual Studio, the following method do not work
# MSBuild.exe "${TOP_DIR}build\INSTALL.vcxproj" -property:Platform=Win32 -property:Configuration=${Configuration} -property:DebugSymbols=${DebugSymbols} -property:DebugType=pdbonly -property:Optimize=true
# MSBuild.exe "${TOP_DIR}build\cmake_lib_out.sln" -property:Platform=Win32 -property:Configuration=${Configuration} -property:DebugSymbols=${DebugSymbols} -property:DebugType=pdbonly -property:Optimize=true    #do not install
# devenv.com "${TOP_DIR}build\cmake_lib_out.sln" /Project "INSTALL" /Build "${Configuration}|WIN32"    #do not work