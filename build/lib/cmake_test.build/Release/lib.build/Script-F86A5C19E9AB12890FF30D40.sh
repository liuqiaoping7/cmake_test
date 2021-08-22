#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/Debug/liblib.dylib /Users/qiaopingliu/work/cmake_test/build/lib/Debug/liblib.dylib /Users/qiaopingliu/work/cmake_test/build/lib/Debug/liblib.dylib
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/Release/liblib.dylib /Users/qiaopingliu/work/cmake_test/build/lib/Release/liblib.dylib /Users/qiaopingliu/work/cmake_test/build/lib/Release/liblib.dylib
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/MinSizeRel/liblib.dylib /Users/qiaopingliu/work/cmake_test/build/lib/MinSizeRel/liblib.dylib /Users/qiaopingliu/work/cmake_test/build/lib/MinSizeRel/liblib.dylib
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/RelWithDebInfo/liblib.dylib /Users/qiaopingliu/work/cmake_test/build/lib/RelWithDebInfo/liblib.dylib /Users/qiaopingliu/work/cmake_test/build/lib/RelWithDebInfo/liblib.dylib
fi

