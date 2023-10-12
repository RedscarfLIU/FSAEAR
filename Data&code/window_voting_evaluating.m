data = xlsread('KNN_classification.xlsx', 'Sheet1'); %原始数据载入
test_label = data (:,1);       %读取测试标签数据
test_label = test_label';      %列数据(测试标签)转置为行
final_label = data (:,2);      %读取预测标签数据
final_label = final_label';    %列数据（预测标签）转置为行

window_size = 2;  %设置滑动窗口的大小

%测试标签数据的滑窗和投票
 windowed_test_label = zeros(length(test_label)-window_size+1, window_size);  %建立滑窗所取样本的存储空间
 for i = 1:length(test_label)-window_size+1
     windowed_test_label(i,:) = test_label(i:i+window_size-1); %按窗口大小取出相邻的若干元素作为样本
 end
 windowed_test_label_voting = zeros(length(test_label)-window_size+1,1); %建立滑窗样本多数投票结果的存储空间
 for i = 1:length(test_label)-window_size+1
     windowed_test_label_voting(i,:) = mode(windowed_test_label(i,:)); %多数多票，返回滑窗样本中的样本众数，即出现频率最高的情感动作类别
 end

%预测标签数据的滑窗和投票
 windowed_final_label = zeros(length(final_label)-window_size+1, window_size);  %建立滑窗所取样本的存储空间
 for i = 1:length(final_label)-window_size+1
     windowed_final_label(i,:) = final_label(i:i+window_size-1); %按窗口大小取出相邻的若干元素作为样本
 end
 windowed_final_label_voting = zeros(length(final_label)-window_size+1,1); %建立滑窗样本多数投票结果的存储空间
 for i = 1:length(final_label)-window_size+1
     windowed_final_label_voting(i,:) = mode(windowed_final_label(i,:)); %多数多票，返回滑窗样本中的样本众数，即出现频率最高的情感动作类别
 end

%四分类性能评估
 A = confusionmat(windowed_test_label_voting,windowed_final_label_voting,'Order',[1;2;3;4]); 
 [m,~] = size(A);
 for i = 1:m
     c_p = A(i,i) / sum(A(:,i));
     c_r = A(i,i) / sum(A(i,:));   %一类的召回率r在多分类任务中，充当该类的识别准确率（Recognition Accuracy）
     c_F = 2*c_p*c_r / (c_p + c_r);
     fprintf('第%d类的查准率为%f,查全率(识别准确率)为%f,F测度为%f\n\n',i,c_p,c_r,c_F);
 end

 t_a = sum(diag(A)) / sum(sum(A)); %整体识别准确率
 fprintf('KNN窗口 %d 识别准确率为 %f\n',window_size,t_a);
