clear all; close all; clc;  tic
% addpath('../data');  
% addpath('../util'); 
currentFolder = pwd;
addpath(genpath(currentFolder))
%load PT;
load db1001.mat db10
load db_label1001.mat db_label10
  data1= db10{1};
% data2=data1(:,142:951);
% Xdata=double(reshape(data1,256,256,size(data1,2)))/255;
 Xdata=data1';
% Xdata = reshape(data1,256,256,size(data1,2));%训练样本为256*26的矩阵，总共有2413个样本
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 label_all=db_label10{1}';
 aa=0;
 n=size(Xdata,3);
 root='./image/';
result2=[];
 H=[];
 sum_acc=0;

   
% train_x1 = Xdata';
test_x1 = Xdata';
% train_y =label_all;
test_y =label_all;


%  train_x = reshape(train_x1,256,256,size(train_x1,2));%训练样本为256*26的矩阵，总共有2413个样本
 
test_x = reshape(test_x1,256,256,size(test_x1,2));%训练样本为256*26的矩阵，总共有2413个样本
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  trainLabels7 =vec2ind( train_y');
 testLabels7 =vec2ind( test_y');
% logname = ['./mine/train/1/'];
%   if ~exist(logname,'dir')
%         mkdir(logname);
%   end
  
%  for i=1:size(train_x,3)
%      dir_train=trainLabels7(i);
%      logname = ['./mine/train/',num2str(dir_train),'/'];
%     if ~exist(logname,'dir')
%         mkdir(logname);
%     end
%   image_name=[logname,num2str(dir_train),'_',num2str(i),'.jpg'];
% 
%   imwrite(train_x(:,:,i),image_name) ;  
%   i
%  end
 for i=1:size(test_x,3)
       dir_test=testLabels7(i);
     logname = ['./mine/train/',num2str(dir_test),'/'];
    if ~exist(logname,'dir')
        mkdir(logname);
    end
     
  image_name=[logname,num2str(dir_test),'_',num2str(i),'.jpg'];

  imwrite(test_x(:,:,i),image_name) ;  
  i
 end
 toc


 