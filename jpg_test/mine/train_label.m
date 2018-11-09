%读取图片，制作train训练集
fprintf(2,'Reading test data.... \n');
rt_data_dir = './train';    %测试集的根目录
data_dir='train'; %标签txt中不需要根目录前面的./，所以新建一个变量存储
subfolders = dir(rt_data_dir) %根目录结构
totalclass=0;%用于存储有类别数
fp=fopen('train_label.txt','wt');  
for ii = 1:length(subfolders),
    subname = subfolders(ii).name;%获取根目录下的所有文件夹名称
    %有两个隐藏文件夹，用于./和../跳转，读取数据集不需要它俩
    if ~strcmp(subname, '.') && ~strcmp(subname, '..'),
        totalclass=totalclass+1;%每一个文件夹都是一个类别
        label_name{totalclass} = subname; %读取此文件夹的名称，也可以自己建立一个标签集，依次取
        data = dir(fullfile(rt_data_dir, subname, '*.jpg'));  %取出所有后缀为png的数据
        c_num=length(data);%当前类别有多少个数据
        for jj=1:c_num
          name=fullfile(data_dir, subname, data(jj).name);
          fprintf(fp,'%s %s\n',name,num2str(totalclass-1));%从0开始编号
        end
        fprintf(1,'正在处理类别：%s\n',label_name{totalclass});
    end
end

