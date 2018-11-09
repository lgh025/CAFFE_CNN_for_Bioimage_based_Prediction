To prove the efficacy of our method described in the paper "Guang-Hui Liu*, Bei-Wei Zhang, Gang Qian, Bin Wang, Member, IEEE, and Bo Mao. Bioimage-based Prediction of Protein Subcellular Location in Human Tissue with Ensemble Features and Deep Networks", we need to compare the result with an end-to-end CNN method. So, we designed this end-to-end CNN code in CAFFE to verify our proposed metod.

--Dependence
Before running this code, you need install Matlab and CAFFE in win7. In our experiment, Matlab R2015a and R2015b are tested. This code is tested in WINDOWS 7 64 Bit. It should be able to run in other Linux or Windows systems.

--How to run
   step1. In Matlab, run jpg_10_fold_cross_validation.m in fold /CAFFE_CNN_for_Bioimage_based_Prediction/. If the code runs successfully, We can get the train and  test JPG files in seven  diafficult classes after performing ten-fold cross validation on the cross validation data set. Then, run train_label.m and test_label.m in fold /CAFFE_CNN_for_Bioimage_based_Prediction/jpg_test/mine/. The label files can be obtain.
   step2. In CAFFE, run convert_jpgtest_train.bat,convert_jpgtest_test.bat,and convert_jpgtest_test.bat in fold /CAFFE_CNN_for_Bioimage_based_Prediction/convert_image_to_ldb/. We can convert .jpg format to .ldb format.
   step3. In CAFFE, run start_train_jpgtest.bat in fold /CAFFE_CNN_for_Bioimage_based_Prediction/. if the code runs successfully, the prediction results will be obtained.

For your convenience, the independent validation dataset used in our paper are located in fold D:/CAFFE_CNN_for_Bioimage_based_Prediction/jpg_test/data/independent test sets/.

Email:lgh025@163.com.
