#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/qiaopingliu/work/cmake_test/build
  make -f /Users/qiaopingliu/work/cmake_test/build/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/qiaopingliu/work/cmake_test/build
  make -f /Users/qiaopingliu/work/cmake_test/build/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/qiaopingliu/work/cmake_test/build
  make -f /Users/qiaopingliu/work/cmake_test/build/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/qiaopingliu/work/cmake_test/build
  make -f /Users/qiaopingliu/work/cmake_test/build/CMakeScripts/ReRunCMake.make
fi

