clear all; close all; clc;  
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
for j=1:1
number=randperm(size(label_all,1));
number10{j,1}=number;
for i=1:10
if i~=10
    
train_x1 = [Xdata(number(1:241*(i-1)),:); Xdata(number(241*i+1:end),:)]';
test_x1 = Xdata(number(241*(i-1)+1:241*i),:)';
train_y =[label_all(number(1:241*(i-1)),:)  ; label_all(number(241*i+1:end),:)];
test_y =label_all(number(241*(i-1)+1:241*i),:);
 end
if i==10
    
train_x1 = Xdata(number(1:241*(i-1)),:)';
test_x1 = Xdata(number(241*(i-1)+1:end),:)';
train_y =label_all(number(1:241*(i-1)),:);
test_y =label_all(number(241*(i-1)+1:end),:);
end
 train_x = reshape(train_x1,256,256,size(train_x1,2));%训练样本为256*26的矩阵，总共有2413个样本
 
test_x = reshape(test_x1,256,256,size(test_x1,2));%训练样本为256*26的矩阵，总共有2413个样本
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 trainLabels7 =vec2ind( train_y');
 testLabels7 =vec2ind( test_y');
% logname = ['./mine/train/1/'];
%   if ~exist(logname,'dir')
%         mkdir(logname);
%   end
  
 for i=1:size(train_x,3)
     dir_train=trainLabels7(i);
     logname = ['./mine/train/',num2str(dir_train),'/'];
    if ~exist(logname,'dir')
        mkdir(logname);
    end
  image_name=[logname,num2str(dir_train),'_',num2str(i),'.jpg'];
%   data2=Xdata(:,:,i);
%    figure
  imwrite(train_x(:,:,i),image_name) ;  
%  saveas(image_name,'image_11.jpg') ; 
%   subplot(321),imwrite(I,'Vase50.jpg','quality',50);
%   imshow(image_name)
  i
 end
 for i=1:size(test_x,3)
       dir_test=testLabels7(i);
     logname = ['./mine/val/',num2str(dir_test),'/'];
    if ~exist(logname,'dir')
        mkdir(logname);
    end
     
  image_name=[logname,num2str(dir_test),'_',num2str(i),'.jpg'];
%   data2=Xdata(:,:,i);
%    figure
  imwrite(test_x(:,:,i),image_name) ;  
%  saveas(image_name,'image_11.jpg') ; 
%   subplot(321),imwrite(I,'Vase50.jpg','quality',50);
%   imshow(image_name)
  i
 end
 toc
end
end





 