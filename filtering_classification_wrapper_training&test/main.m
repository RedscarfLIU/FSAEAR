clear;
clc;
rng=[0 1 71 1];%训练 rng=[r1 c1 r2 c2]定义读取储存样本情感标签的csv文件的行列始末段
rng1=[72 1 79 1];%测试

%第1次迭代
train_label=csvread('./training-1/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-1/REFERENCE.csv',72,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-1/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:72
    ss=feature_extraction(strcat('./training-1/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=73:80
    ss=feature_extraction(strcat('./training-1/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%鉴别分析分类器
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label1 = predict(Factor, test_data);
%二元情感分类评价指标
accuracy1 = length(find(predict_label1 == test_label))/length(test_label)*100;  %分类正确率,识别正负情绪的整体能力
sensitivity1 = length(find(predict_label1(1:4) == test_label(1:4)))/length(test_label(1:4));  %分类敏感度,识别正面情绪的能力
specificity1 = length(find(predict_label1(5:8) == test_label(5:8)))/length(test_label(5:8));   %分类特异度,识别负面情绪的能力

%SVM支持向量机分类器
%Factor = fitcsvm(train_data,train_label); 
%predict_label = predict(Factor, test_data); 
%逻辑回归分类器
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
%决策树分类器
%Factor = fitctree(train_data,train_label);
%predict_label = predict(Factor, test_data);
%随机森林分类器
%nTree = 500;
%Factor = TreeBagger(nTree,train_data,train_label,'Method', 'classification');
%predict_1 = predict(Factor, test_data);
%predict_label = cellfun(@str2num,predict_1);
%K近邻分类器
%Factor = ClassificationKNN.fit(train_data,train_label,'NumNeighbors',4);
%predict_label = predict(Factor, test_data);
%朴素贝叶斯分类器
%Factor = fitcnb(train_data,train_label);
%predict_label = predict(Factor, test_data);
%鉴别分析分类器
%Factor = ClassificationDiscriminant.fit(train_data,train_label);
%predict_label = predict(Factor, test_data);
%Boosting分类器
%Factor = fitensemble(train_data, train_label, 'AdaBoostM1', 100, 'tree', 'type', 'classification');
%predict_label = predict(Factor, test_data);
%Random Subspace分类器
%Factor = fitensemble(train_data, train_label, 'Subspace', 50, 'KNN');
%predict_label = predict(Factor, test_data);

%第2次迭代
train_label=csvread('./training-2/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-2/REFERENCE.csv',72,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-2/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:72
    ss=feature_extraction(strcat('./training-2/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=73:80
    ss=feature_extraction(strcat('./training-2/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%鉴别分析分类器
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label2 = predict(Factor, test_data); 
%二元情感分类评价指标
accuracy2 = length(find(predict_label2 == test_label))/length(test_label)*100;  %分类正确率,识别正负情绪的整体能力
sensitivity2 = length(find(predict_label2(1:4) == test_label(1:4)))/length(test_label(1:4));  %分类敏感度,识别正面情绪的能力
specificity2 = length(find(predict_label2(5:8) == test_label(5:8)))/length(test_label(5:8));   %分类特异度,识别负面情绪的能力

%第3次迭代
train_label=csvread('./training-3/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-3/REFERENCE.csv',72,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-3/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:72
    ss=feature_extraction(strcat('./training-3/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=73:80
    ss=feature_extraction(strcat('./training-3/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%鉴别分析分类器
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label3 = predict(Factor, test_data);  
%二元情感分类评价指标
accuracy3 = length(find(predict_label3 == test_label))/length(test_label)*100;  %分类正确率,识别正负情绪的整体能力
sensitivity3 = length(find(predict_label3(1:4) == test_label(1:4)))/length(test_label(1:4));  %分类敏感度,识别正面情绪的能力
specificity3 = length(find(predict_label3(5:8) == test_label(5:8)))/length(test_label(5:8));   %分类特异度,识别负面情绪的能力

%第4次迭代
train_label=csvread('./training-4/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-4/REFERENCE.csv',72,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-4/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:72
    ss=feature_extraction(strcat('./training-4/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=73:80
    ss=feature_extraction(strcat('./training-4/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%鉴别分析分类器
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label4 = predict(Factor, test_data);  
%二元情感分类评价指标
accuracy4 = length(find(predict_label4 == test_label))/length(test_label)*100;  %分类正确率,识别正负情绪的整体能力
sensitivity4 = length(find(predict_label4(1:4) == test_label(1:4)))/length(test_label(1:4));  %分类敏感度,识别正面情绪的能力
specificity4 = length(find(predict_label4(5:8) == test_label(5:8)))/length(test_label(5:8));   %分类特异度,识别负面情绪的能力

%第5次迭代
train_label=csvread('./training-5/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-5/REFERENCE.csv',72,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-5/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:72
    ss=feature_extraction(strcat('./training-5/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=73:80
    ss=feature_extraction(strcat('./training-5/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%鉴别分析分类器
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label5 = predict(Factor, test_data);  
%二元情感分类评价指标
accuracy5 = length(find(predict_label5 == test_label))/length(test_label)*100;  %分类正确率,识别正负情绪的整体能力
sensitivity5 = length(find(predict_label5(1:4) == test_label(1:4)))/length(test_label(1:4));  %分类敏感度,识别正面情绪的能力
specificity5 = length(find(predict_label5(5:8) == test_label(5:8)))/length(test_label(5:8));   %分类特异度,识别负面情绪的能力

%第6次迭代
train_label=csvread('./training-6/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-6/REFERENCE.csv',72,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-6/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:72
    ss=feature_extraction(strcat('./training-6/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=73:80
    ss=feature_extraction(strcat('./training-6/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%鉴别分析分类器
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label6 = predict(Factor, test_data); 
%二元情感分类评价指标
accuracy6 = length(find(predict_label6 == test_label))/length(test_label)*100;  %分类正确率,识别正负情绪的整体能力
sensitivity6 = length(find(predict_label6(1:4) == test_label(1:4)))/length(test_label(1:4));  %分类敏感度,识别正面情绪的能力
specificity6 = length(find(predict_label6(5:8) == test_label(5:8)))/length(test_label(5:8));   %分类特异度,识别负面情绪的能力

%第7次迭代
train_label=csvread('./training-7/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-7/REFERENCE.csv',72,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-7/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:72
    ss=feature_extraction(strcat('./training-7/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=73:80
    ss=feature_extraction(strcat('./training-7/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%鉴别分析分类器
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label7 = predict(Factor, test_data); 
%二元情感分类评价指标
accuracy7 = length(find(predict_label7 == test_label))/length(test_label)*100;  %分类正确率,识别正负情绪的整体能力
sensitivity7 = length(find(predict_label7(1:4) == test_label(1:4)))/length(test_label(1:4));  %分类敏感度,识别正面情绪的能力
specificity7 = length(find(predict_label7(5:8) == test_label(5:8)))/length(test_label(5:8));   %分类特异度,识别负面情绪的能力

%第8次迭代
train_label=csvread('./training-8/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-8/REFERENCE.csv',72,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-8/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:72
    ss=feature_extraction(strcat('./training-8/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=73:80
    ss=feature_extraction(strcat('./training-8/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%鉴别分析分类器
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label8 = predict(Factor, test_data);  
%二元情感分类评价指标
accuracy8 = length(find(predict_label8 == test_label))/length(test_label)*100;  %分类正确率,识别正负情绪的整体能力
sensitivity8 = length(find(predict_label8(1:4) == test_label(1:4)))/length(test_label(1:4));  %分类敏感度,识别正面情绪的能力
specificity8 = length(find(predict_label8(5:8) == test_label(5:8)))/length(test_label(5:8));   %分类特异度,识别负面情绪的能力

%第9次迭代
train_label=csvread('./training-9/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-9/REFERENCE.csv',72,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-9/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:72
    ss=feature_extraction(strcat('./training-9/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=73:80
    ss=feature_extraction(strcat('./training-9/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%鉴别分析分类器
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label9 = predict(Factor, test_data); 
%二元情感分类评价指标
accuracy9 = length(find(predict_label9 == test_label))/length(test_label)*100;  %分类正确率,识别正负情绪的整体能力
sensitivity9 = length(find(predict_label9(1:4) == test_label(1:4)))/length(test_label(1:4));  %分类敏感度,识别正面情绪的能力
specificity9 = length(find(predict_label9(5:8) == test_label(5:8)))/length(test_label(5:8));   %分类特异度,识别负面情绪的能力

%第10次迭代
train_label=csvread('./training-10/REFERENCE.csv',0,1,rng);%读取训练标签
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-10/REFERENCE.csv',72,1,rng1);%读取测试标签
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%画出测试数据的正确分类标签
train_data=[];
test_data=[];
for i=1:9
    ss=feature_extraction(strcat('./training-10/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:72
    ss=feature_extraction(strcat('./training-10/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%对原始数据进行特征提取，构建n维的测试数据矩阵
for i=73:80
    ss=feature_extraction(strcat('./training-10/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%鉴别分析分类器
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label10 = predict(Factor, test_data); 
%二元情感分类评价指标
accuracy10 = length(find(predict_label10 == test_label))/length(test_label)*100;  %分类正确率,识别正负情绪的整体能力
sensitivity10 = length(find(predict_label10(1:4) == test_label(1:4)))/length(test_label(1:4));  %分类敏感度,识别正面情绪的能力
specificity10 = length(find(predict_label10(5:8) == test_label(5:8)))/length(test_label(5:8));   %分类特异度,识别负面情绪的能力

%10折交叉验证后的总体情感二分类正确率、灵敏度和特异度计算
accuracy_1_to_10 = [accuracy1 accuracy2 accuracy3 accuracy4 accuracy5 accuracy6 accuracy7 accuracy8 accuracy9 accuracy10];
sensitivity_1_to_10 = [sensitivity1 sensitivity2 sensitivity3 sensitivity4 sensitivity5 sensitivity6 sensitivity7 sensitivity8 sensitivity9 sensitivity10];
specificity_1_to_10 = [specificity1 specificity2 specificity3 specificity4 specificity5 specificity6 specificity7 specificity8 specificity9 specificity10];

accuracy_total = mean(accuracy_1_to_10)  %总体分类正确率
sensitivity_total = mean(sensitivity_1_to_10)  %总体分类敏感度
specificity_total = mean(specificity_1_to_10)  %总体分类精确度
