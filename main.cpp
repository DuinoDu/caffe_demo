#include <caffe/caffe.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <string>

#ifdef _WIN32_
#include "headlayer.h"
#endif

using namespace std;

int main(int argc, char *argv[])
{
    caffe::Caffe::set_mode(caffe::Caffe::CPU);
    shared_ptr<caffe::Net<float> > pnet;
    string modelTxt = "/home/duino/tmp/caffe/caffe_demo/model/det1.prototxt";
    string modelBin = "/home/duino/tmp/caffe/caffe_demo/model/det1.caffemodel";
    pnet.reset(new caffe::Net<float>(modelTxt, caffe::TEST));
    pnet->CopyTrainedLayersFrom(modelBin);

    cout << "Model loading done." << endl;
    return 0;
}
