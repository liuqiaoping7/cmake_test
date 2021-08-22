# STATIC_OR_SHARED="SHARED"
STATIC_OR_SHARED="STATIC"

TOP_DIR=$(cd $(dirname $0);pwd)/../
echo $TOP_DIR

rm -rf $TOP_DIR/cmake_test_sdk/mac
rm -rf $TOP_DIR/build

if [ ! -d "$TOP_DIR/build" ]; then
  mkdir -p $TOP_DIR/build
fi

cmake -G Xcode -DCMAKE_OSX_ARCHITECTURES=x86_64 -DCMAKE_INSTALL_PREFIX=$TOP_DIR/cmake_test_sdk/mac -DLIBRARY_TYPE=${STATIC_OR_SHARED} -B$TOP_DIR/build -H.
cd $TOP_DIR/build
xcodebuild -project $TOP_DIR/build/cmake_test.xcodeproj -configuration Release -target install -sdk macosx