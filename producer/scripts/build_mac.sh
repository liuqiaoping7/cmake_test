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

rm -rf $TOP_DIR/cmake_test_sdk/mac
rm -rf $TOP_DIR/build

if [ ! -d "$TOP_DIR/build" ]; then
  mkdir -p $TOP_DIR/build
fi

cmake -G Xcode -DCMAKE_OSX_ARCHITECTURES=x86_64 -DCMAKE_INSTALL_PREFIX=$TOP_DIR/cmake_test_sdk/mac -DLIB_TYPE=${LIB_TYPE} -DLIBLIB_TYPE=${LIBLIB_TYPE} -B$TOP_DIR/build -H$TOP_DIR
cd $TOP_DIR/build
xcodebuild -project $TOP_DIR/build/cmake_lib_out.xcodeproj -configuration Release -target install -sdk macosx

# caution space needed
# if [${LIB_TYPE} == STATIC -a ${LIBLIB_TYPE} == STATIC]; 
if [ ${LIB_TYPE} == STATIC ] && [ ${LIBLIB_TYPE} == STATIC ]; then
  cd $TOP_DIR/cmake_test_sdk/mac/lib && mkdir merge && cd merge
  if [ $? != 0 ]; then
    exit 1
  fi
  ar x ../liblib.a && ar x ../liblibliba.a && ar x ../libliblibb.a && ar rc ../liblib.a *.o
  if [ $? != 0 ]; then
    exit 1
  fi
  cd ..
  rm -rf merge liblibliba.a libliblibb.a
  # ar rc libmerge.a liblib.a liblibliba.a libliblibb.a
fi