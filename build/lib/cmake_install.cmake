# Install script for directory: /Users/qiaopingliu/work/cmake_test/lib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/qiaopingliu/work/cmake_test/cmake_test_sdk/mac")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

set(CMAKE_BINARY_DIR "/Users/qiaopingliu/work/cmake_test/build")

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/qiaopingliu/work/cmake_test/build/lib/Debug/liblib.dylib")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/qiaopingliu/work/cmake_test/build/lib/libliba/Debug"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/qiaopingliu/work/cmake_test/build/lib/liblibb/Debug"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -add_rpath "/Users/qiaopingliu/work/cmake_test/cmake_test_sdk/mac/lib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/qiaopingliu/work/cmake_test/build/lib/Release/liblib.dylib")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/qiaopingliu/work/cmake_test/build/lib/libliba/Release"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/qiaopingliu/work/cmake_test/build/lib/liblibb/Release"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -add_rpath "/Users/qiaopingliu/work/cmake_test/cmake_test_sdk/mac/lib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/qiaopingliu/work/cmake_test/build/lib/MinSizeRel/liblib.dylib")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/qiaopingliu/work/cmake_test/build/lib/libliba/MinSizeRel"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/qiaopingliu/work/cmake_test/build/lib/liblibb/MinSizeRel"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -add_rpath "/Users/qiaopingliu/work/cmake_test/cmake_test_sdk/mac/lib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/qiaopingliu/work/cmake_test/build/lib/RelWithDebInfo/liblib.dylib")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/qiaopingliu/work/cmake_test/build/lib/libliba/RelWithDebInfo"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/qiaopingliu/work/cmake_test/build/lib/liblibb/RelWithDebInfo"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      execute_process(COMMAND /usr/bin/install_name_tool
        -add_rpath "/Users/qiaopingliu/work/cmake_test/cmake_test_sdk/mac/lib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/liblib.dylib")
      endif()
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/qiaopingliu/work/cmake_test/build/lib/libliba/cmake_install.cmake")
  include("/Users/qiaopingliu/work/cmake_test/build/lib/liblibb/cmake_install.cmake")

endif()

