TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp

win32{
# caffe bug. Refer to http://blog.csdn.net/fangjin_kl/article/details/50936952
HEADERS += headlayer.h
# opencv
PATH_OPENCV_INCLUDE   = "H:\3rdparty\OpenCV\opencv310\build\include"
PATH_OPENCV_LIBRARIES = "H:\3rdparty\OpenCV\opencv310\build\x64\vc12\lib"
VERSION_OPENCV        = 310
INCLUDEPATH += $${PATH_OPENCV_INCLUDE}
CONFIG(debug, debug|release){
LIBS += -L$${PATH_OPENCV_LIBRARIES} -lopencv_core$${VERSION_OPENCV}d
LIBS += -L$${PATH_OPENCV_LIBRARIES} -lopencv_highgui$${VERSION_OPENCV}d
LIBS += -L$${PATH_OPENCV_LIBRARIES} -lopencv_imgcodecs$${VERSION_OPENCV}d
LIBS += -L$${PATH_OPENCV_LIBRARIES} -lopencv_imgproc$${VERSION_OPENCV}d
}
CONFIG(release, debug|release){
LIBS += -L$${PATH_OPENCV_LIBRARIES} -lopencv_core$${VERSION_OPENCV}
LIBS += -L$${PATH_OPENCV_LIBRARIES} -lopencv_highgui$${VERSION_OPENCV}
LIBS += -L$${PATH_OPENCV_LIBRARIES} -lopencv_imgcodecs$${VERSION_OPENCV}
LIBS += -L$${PATH_OPENCV_LIBRARIES} -lopencv_imgproc$${VERSION_OPENCV}
}
#glog
INCLUDEPATH += H:\3rdparty\glog\include
LIBS += -LH:\3rdparty\glog\lib\x64\v120\Debug\dynamic -llibglog
#boost
INCLUDEPATH += H:\3rdparty\boost\boost_1_59_0
CONFIG(debug, debug|release): BOOST_VERSION = "-vc120-mt-gd-1_59"
CONFIG(release, debug|release): BOOST_VERSION = "-vc120-mt-1_59"
LIBS += -LH:\3rdparty\boost\boost_1_59_0\lib64-msvc-12.0 \
    -llibboost_system$${BOOST_VERSION} \
    -llibboost_date_time$${BOOST_VERSION} \
    -llibboost_filesystem$${BOOST_VERSION} \
    -llibboost_thread$${BOOST_VERSION} \
    -llibboost_regex$${BOOST_VERSION}
#gflags
INCLUDEPATH += H:\3rdparty\gflags\include
CONFIG(debug, debug|release): LIBS += -LH:\3rdparty\gflags\x64\v120\dynamic\Lib -lgflagsd
CONFIG(release, debug|release): LIBS += -LH:\3rdparty\gflags\x64\v120\dynamic\Lib -lgflags
#protobuf
INCLUDEPATH += H:\3rdparty\protobuf\include
CONFIG(debug, debug|release): LIBS += -LH:\3rdparty\protobuf\lib\x64\v120\Debug -llibprotobuf
CONFIG(release, debug|release): LIBS += -LH:\3rdparty\protobuf\lib\x64\v120\Release -llibprotobuf
# hdf5
INCLUDEPATH += H:\3rdparty\hdf5\include
LIBS += -LH:\3rdparty\hdf5\lib\x64 -lhdf5 -lhdf5_hl -lhdf5_tools -lhdf5_cpp
# levelDb
INCLUDEPATH += H:\3rdparty\LevelDB\include
CONFIG(debug, debug|release): LIBS += -LH:\3rdparty\LevelDB\lib\x64\v120\Debug -lLevelDb
CONFIG(release, debug|release): LIBS += -LH:\3rdparty\LevelDB\lib\x64\v120\Release -lLevelDb
# lmdb
INCLUDEPATH += H:\3rdparty\lmdb\include
CONFIG(debug, debug|release): LIBS += -LH:\3rdparty\lmdb\lib\x64 -llmdbD
CONFIG(release, debug|release): LIBS += -LH:\3rdparty\lmdb\lib\x64 -llmdb
#openblas
INCLUDEPATH += H:\3rdparty\openblas\include
LIBS += -LH:\3rdparty\openblas\lib\x64 -llibopenblas
# caffe
INCLUDEPATH += H:\3rdparty\caffe\include
CONFIG(debug, debug|release): LIBS += -LH:\3rdparty\caffe\lib\x64 -llibcaffed
CONFIG(release, debug|release): LIBS += -LH:\3rdparty\caffe\lib\x64 -llibcaffe
}
