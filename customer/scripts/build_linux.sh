if [ $# != 2 ] || [ $1 != STATIC -a $1 != SHARED ] || [ $2 != STATIC -a $2 != SHARED ]; then
echo "argcount = $#"
echo "USAGE: $0 STATIC SHARED"
exit 1;
fi
LIB_TYPE=$1
LIBLIB_TYPE=$2

# if [ ! ${LIB_TYPE} ]; then
#   LIB_TYPE=STATIC
# else
#   echo "LIB_TYPE=$LIB_TYPE"
# fi
# if [ ! ${LIBLIB_TYPE} ]; then
#   LIBLIB_TYPE=STATIC
# else
#   echo "LIBLIB_TYPE=$LIBLIB_TYPE"
# fi

TOP_DIR=$(cd $(dirname $0);pwd)/../
echo $TOP_DIR

rm -rf $TOP_DIR/cmake_test_sdk/linux
rm -rf $TOP_DIR/build

if [ ! -d "$TOP_DIR/build" ]; then
  mkdir -p $TOP_DIR/build
fi

cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$TOP_DIR/cmake_test_sdk/linux -DLIB_TYPE=${LIB_TYPE} -DLIBLIB_TYPE=${LIBLIB_TYPE} -B$TOP_DIR/build -H$TOP_DIR
cd $TOP_DIR/build
cmake --build .
cmake --install .
# make
# make install