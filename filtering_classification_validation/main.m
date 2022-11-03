clear;
clc;
rng=[0 1 79 1];%训练 rng=[r1 c1 r2 c2]定义读取储存样本情感标签的csv文件的行列始末段
rng1=[80 1 119 1];%测试
train_label=csvread('./training-2/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-2/REFERENCE.csv',80,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
figure();
subplot(211);
bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
%对原始数据进行特征提取，构建n维的训练数据矩阵
for i=1:9
    ss=feature_extraction(strcat('./training-2/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:80
    ss=feature_extraction(strcat('./training-2/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=81:99
    ss=feature_extraction(strcat('./training-2/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
for i=100:120
    ss=feature_extraction(strcat('./training-2/a0',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end

%SVM支持向量机分类器(线性核)(Top37特征子集)
Factor = fitcsvm(train_data,train_label); 
predict_label = predict(Factor, test_data); 

%逻辑回归分类器(Top9特征子集)
%Factor = mnrfit(train_data, train_label);
%Scores = mnrval(Factor, test_data);
%S1=Scores(:,1);
%S2=Scores(:,2);
%predict_label=[];
%for i=1:length(S1)
%    if S1(i)<S2(i)
%       predict_label=[predict_label;2];
%    else
%       predict_label=[predict_label;1];
%    end
%end

%鉴别分析分类器(Top9特征子集)
%Factor = ClassificationDiscriminant.fit(train_data,train_label);
%predict_label = predict(Factor, test_data);

%二元情感分类评价指标
%分类正确率,识别正负情绪的整体能力
accuracy = length(find(predict_label == test_label))/length(test_label)*100
%分类敏感度,识别正面情绪的能力
sensitivity = (length(find(predict_label(1:4) == test_label(1:4)))+length(find(predict_label(9:12) == test_label(9:12)))+length(find(predict_label(17:20) == test_label(17:20)))+length(find(predict_label(25:28) == test_label(25:28)))+length(find(predict_label(33:36) == test_label(33:36))))/(length(test_label(1:4))+length(test_label(9:12))+length(test_label(17:20))+length(test_label(25:28))+length(test_label(33:36)))
%分类特异度,识别负面情绪的能力
specificity = (length(find(predict_label(5:8) == test_label(5:8)))+length(find(predict_label(13:16) == test_label(13:16)))+length(find(predict_label(21:24) == test_label(21:24)))+length(find(predict_label(29:32) == test_label(29:32)))+length(find(predict_label(37:40) == test_label(37:40))))/(length(test_label(5:8))+length(test_label(13:16))+length(test_label(21:24))+length(test_label(29:32))+length(test_label(37:40)))
subplot(212);
bar(predict_label);%绘制预测矩阵与正确答案进行比较