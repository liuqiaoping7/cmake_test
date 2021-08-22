#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib/liblibb
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/Debug/libliblibb.dylib /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/Debug/libliblibb.dylib /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/Debug/libliblibb.dylib
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib/liblibb
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/Release/libliblibb.dylib /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/Release/libliblibb.dylib /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/Release/libliblibb.dylib
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib/liblibb
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/MinSizeRel/libliblibb.dylib /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/MinSizeRel/libliblibb.dylib /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/MinSizeRel/libliblibb.dylib
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib/liblibb
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/RelWithDebInfo/libliblibb.dylib /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/RelWithDebInfo/libliblibb.dylib /Users/qiaopingliu/work/cmake_test/build/lib/liblibb/RelWithDebInfo/libliblibb.dylib
fi

