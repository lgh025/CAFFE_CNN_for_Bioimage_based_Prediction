clc;
clear all;

%��ȡͼƬ������test���Լ�
fprintf(2,'Reading test data.... \n');
rt_data_dir = './val';    %���Լ��ĸ�Ŀ¼
data_dir='val'; %��ǩtxt�в���Ҫ��Ŀ¼ǰ���./�������½�һ�������洢
subfolders = dir(rt_data_dir) %��Ŀ¼�ṹ
totalclass=0;%���ڴ洢�������
fp=fopen('test_label.txt','wt');  
for ii = 1:length(subfolders),
    subname = subfolders(ii).name;%��ȡ��Ŀ¼�µ������ļ�������
    %�����������ļ��У�����./��../��ת����ȡ���ݼ�����Ҫ����
    if ~strcmp(subname, '.') && ~strcmp(subname, '..'),
        totalclass=totalclass+1;%ÿһ���ļ��ж���һ�����
        label_name{totalclass} = subname; %��ȡ���ļ��е����ƣ�Ҳ�����Լ�����һ����ǩ��������ȡ
        data = dir(fullfile(rt_data_dir, subname, '*.jpg'));  %ȡ�����к�׺Ϊpng������
        c_num=length(data);%��ǰ����ж��ٸ�����
        for jj=1:c_num
          name=fullfile(data_dir, subname, data(jj).name);
          fprintf(fp,'%s %s\n',name,num2str(str2num(subname)-1));%��0��ʼ���
        end
        fprintf(1,'���ڴ������%s\n',label_name{totalclass});
    end
end

