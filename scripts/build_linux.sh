# STATIC_OR_SHARED="SHARED"
STATIC_OR_SHARED="STATIC"

TOP_DIR=$(cd $(dirname $0);pwd)/../
echo $TOP_DIR

rm -rf xnnsdk/linux $TOP_DIR/cmake_test_sdk/linux
rm -rf $TOP_DIR/build

if [ ! -d "$TOP_DIR/build" ]; then
  mkdir -p $TOP_DIR/build
fi

cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$TOP_DIR/cmake_test_sdk/linux -DLIBRARY_TYPE=${STATIC_OR_SHARED} -B$TOP_DIR/build -H.
cd $TOP_DIR/build
cmake --build .
cmake --install .
# make
# make install