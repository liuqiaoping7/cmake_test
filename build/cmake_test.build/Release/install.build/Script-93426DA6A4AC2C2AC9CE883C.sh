#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/qiaopingliu/work/cmake_test/build
  /Applications/CMake.app/Contents/bin/cmake -DBUILD_TYPE=$CONFIGURATION$EFFECTIVE_PLATFORM_NAME -P cmake_install.cmake
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/qiaopingliu/work/cmake_test/build
  /Applications/CMake.app/Contents/bin/cmake -DBUILD_TYPE=$CONFIGURATION$EFFECTIVE_PLATFORM_NAME -P cmake_install.cmake
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/qiaopingliu/work/cmake_test/build
  /Applications/CMake.app/Contents/bin/cmake -DBUILD_TYPE=$CONFIGURATION$EFFECTIVE_PLATFORM_NAME -P cmake_install.cmake
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/qiaopingliu/work/cmake_test/build
  /Applications/CMake.app/Contents/bin/cmake -DBUILD_TYPE=$CONFIGURATION$EFFECTIVE_PLATFORM_NAME -P cmake_install.cmake
fi

