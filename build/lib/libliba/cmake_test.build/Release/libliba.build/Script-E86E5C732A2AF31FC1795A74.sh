#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib/libliba
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/libliba/Debug/liblibliba.dylib /Users/qiaopingliu/work/cmake_test/build/lib/libliba/Debug/liblibliba.dylib /Users/qiaopingliu/work/cmake_test/build/lib/libliba/Debug/liblibliba.dylib
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib/libliba
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/libliba/Release/liblibliba.dylib /Users/qiaopingliu/work/cmake_test/build/lib/libliba/Release/liblibliba.dylib /Users/qiaopingliu/work/cmake_test/build/lib/libliba/Release/liblibliba.dylib
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib/libliba
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/libliba/MinSizeRel/liblibliba.dylib /Users/qiaopingliu/work/cmake_test/build/lib/libliba/MinSizeRel/liblibliba.dylib /Users/qiaopingliu/work/cmake_test/build/lib/libliba/MinSizeRel/liblibliba.dylib
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/qiaopingliu/work/cmake_test/build/lib/libliba
  /Applications/CMake.app/Contents/bin/cmake -E cmake_symlink_library /Users/qiaopingliu/work/cmake_test/build/lib/libliba/RelWithDebInfo/liblibliba.dylib /Users/qiaopingliu/work/cmake_test/build/lib/libliba/RelWithDebInfo/liblibliba.dylib /Users/qiaopingliu/work/cmake_test/build/lib/libliba/RelWithDebInfo/liblibliba.dylib
fi

