#include <caffe/caffe.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <string>

#include "headlayer.h"

using namespace std;

int main(int argc, char *argv[])
{
    caffe::Caffe::set_mode(caffe::Caffe::CPU);
    shared_ptr<caffe::Net<float> > pnet;
    string modelTxt = "H:/project/qt/mtcnn_cpp/mtcnn/model/det1.prototxt";
    string modelBin = "H:/project/qt/mtcnn_cpp/mtcnn/model/det1.caffemodel";
    pnet.reset(new caffe::Net<float>(modelTxt, caffe::TEST));
    pnet->CopyTrainedLayersFrom(modelBin);

    shared_ptr<caffe::Net<float> > rnet;
    modelTxt = "H:/project/qt/mtcnn_cpp/mtcnn/model/det2.prototxt";
    modelBin = "H:/project/qt/mtcnn_cpp/mtcnn/model/det2.caffemodel";
    rnet.reset(new caffe::Net<float>(modelTxt, caffe::TEST));
    rnet->CopyTrainedLayersFrom(modelBin);

    shared_ptr<caffe::Net<float> > onet;
    modelTxt = "H:/project/qt/mtcnn_cpp/mtcnn/model/det3.prototxt";
    modelBin = "H:/project/qt/mtcnn_cpp/mtcnn/model/det3.caffemodel";
    onet.reset(new caffe::Net<float>(modelTxt, caffe::TEST));
    onet->CopyTrainedLayersFrom(modelBin);

    cout << "Model loading done." << endl;
    return 0;
}
