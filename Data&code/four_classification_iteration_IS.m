 %读取数据集中样本及标签
 %被试1的平静、快乐、生气及伤心数据及标签
 data11 = xlsread('11.xlsx','B1:T1139');%平静
 data12 = xlsread('12.xlsx','B1:T1228');%快乐
 data13 = xlsread('13.xlsx','B1:T1031');%生气
 data14 = xlsread('14.xlsx','B1:T1012');%伤心
 data1 = [data11;data12;data13;data14]; %S1数据汇总
 
 %被试2的平静、快乐、生气及伤心数据及标签
 data21 = xlsread('21.xlsx','B1:T1196');%平静
 data22 = xlsread('22.xlsx','B1:T689');%快乐
 data23 = xlsread('23.xlsx','B1:T944');%生气
 data24 = xlsread('24.xlsx','B1:T861');%伤心
 data2 = [data21;data22;data23;data24]; %S2数据汇总
 
 %被试3的平静、快乐、生气及伤心数据及标签
 data31 = xlsread('31.xlsx','B1:T2925');%平静
 data32 = xlsread('32.xlsx','B1:T1167');%快乐
 data33 = xlsread('33.xlsx','B1:T1135');%生气
 data34 = xlsread('34.xlsx','B1:T1040');%伤心
 data3 = [data31;data32;data33;data34]; %S3数据汇总
 
 %被试4的平静、快乐、生气及伤心数据及标签
 data51 = xlsread('51.xlsx','B1:T1451');%平静
 data52 = xlsread('52.xlsx','B1:T1214');%快乐
 data53 = xlsread('53.xlsx','B1:T3446');%生气
 data54 = xlsread('54.xlsx','B1:T1436');%伤心 
 data4 = [data51;data52;data53;data54]; %S5数据汇总
 
 
 %被试5的平静、快乐、生气及伤心数据及标签
 data41 = xlsread('41.xlsx','B1:T1979');%平静
 data42 = xlsread('42.xlsx','B1:T1479');%快乐
 data43 = xlsread('43.xlsx','B1:T1426');%生气
 data44 = xlsread('44.xlsx','B1:T1316');%伤心 
 data5 = [data41;data42;data43;data44]; %S5数据汇总
 
 %构建训练所用数据集（样本和标签）（第奇数帧）
 data_TRAIN = data1(1:2:end,:);
 
 
 %构建测试所用数据集（样本和标签）（第偶数帧）
 data_TEST = data1(2:2:end,:);
 

 %单帧样本（即单个一维数组）的长度（即元素个数）
 length_sample = size(data_TRAIN,2)-1;
 
 %读取原始训练样本和训练标签
 train_data_raw = data_TRAIN(1:end, 1:length_sample);       %训练样本,length_sample是数组中元素的个数
 train_label = data_TRAIN(1:end, length_sample+1);      %训练标签
 number_train_label = length(train_label);              %训练标签的数量
 
 %读取原始测试样本和测试标签
 test_data_raw = data_TEST(1:end, 1:length_sample);       %测试样本,length_sample是数组中元素的个数
 test_label = data_TEST(1:end, length_sample+1);      %测试标签
 number_test_label = length(test_label);               %测试标签的数量
 
 %原始训练样本的过滤
 x1 = train_data_raw (:,1);
 x2 = train_data_raw (:,2);
 x3 = train_data_raw (:,3);
 x4 = train_data_raw (:,4);
 x5 = train_data_raw (:,5);
 x6 = train_data_raw (:,6);
 x7 = train_data_raw (:,7);
 x8 = train_data_raw (:,8);
 x9 = train_data_raw (:,9);
 x10 = train_data_raw (:,10);
 x11 = train_data_raw (:,11);
 x12 = train_data_raw (:,12);
 x13 = train_data_raw (:,13);
 x14 = train_data_raw (:,14);
 x15 = train_data_raw (:,15);
 x16 = train_data_raw (:,16);
 x17 = train_data_raw (:,17);
 x18 = train_data_raw (:,18);
 
 y1 = filloutliers(x1,'linear','movmean',20); %标准差法去离群值
 y2 = filloutliers(x2,'linear','movmean',20);
 y3 = filloutliers(x3,'linear','movmean',20);
 y4 = filloutliers(x4,'linear','movmean',20);
 y5 = filloutliers(x5,'linear','movmean',20);
 y6 = filloutliers(x6,'linear','movmean',20);
 y7 = filloutliers(x7,'linear','movmean',20);
 y8 = filloutliers(x8,'linear','movmean',20);
 y9 = filloutliers(x9,'linear','movmean',20);
 y10 = filloutliers(x10,'linear','movmean',20);
 y11 = filloutliers(x11,'linear','movmean',20);
 y12 = filloutliers(x12,'linear','movmean',20);
 y13 = filloutliers(x13,'linear','movmean',20);
 y14 = filloutliers(x14,'linear','movmean',20);
 y15 = filloutliers(x15,'linear','movmean',20);
 y16 = filloutliers(x16,'linear','movmean',20);
 y17 = filloutliers(x17,'linear','movmean',20);
 y18 = filloutliers(x18,'linear','movmean',20);
 
 z1 = movmedian(y1,3); %中位数滤波,移动中位数，窗口长度为3
 z2 = movmedian(y2,3);
 z3 = movmedian(y3,3);
 z4 = movmedian(y4,3);
 z5 = movmedian(y5,3);
 z6 = movmedian(y6,3);
 z7 = movmedian(y7,3);
 z8 = movmedian(y8,3);
 z9 = movmedian(y9,3);
 z10 = movmedian(y10,3);
 z11 = movmedian(y11,3);
 z12 = movmedian(y12,3);
 z13 = movmedian(y13,3);
 z14 = movmedian(y14,3);
 z15 = movmedian(y15,3);
 z16 = movmedian(y16,3);
 z17 = movmedian(y17,3);
 z18 = movmedian(y18,3);
 
 train_data = [z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16,z17,z18]; %生成过滤后训练样本
 
 %原始测试样本的过滤
 x1 = test_data_raw (:,1);
 x2 = test_data_raw (:,2);
 x3 = test_data_raw (:,3);
 x4 = test_data_raw (:,4);
 x5 = test_data_raw (:,5);
 x6 = test_data_raw (:,6);
 x7 = test_data_raw (:,7);
 x8 = test_data_raw (:,8);
 x9 = test_data_raw (:,9);
 x10 = test_data_raw (:,10);
 x11 = test_data_raw (:,11);
 x12 = test_data_raw (:,12);
 x13 = test_data_raw (:,13);
 x14 = test_data_raw (:,14);
 x15 = test_data_raw (:,15);
 x16 = test_data_raw (:,16);
 x17 = test_data_raw (:,17);
 x18 = test_data_raw (:,18);
 
 y1 = filloutliers(x1,'linear','movmean',20); %标准差法去离群值
 y2 = filloutliers(x2,'linear','movmean',20);
 y3 = filloutliers(x3,'linear','movmean',20);
 y4 = filloutliers(x4,'linear','movmean',20);
 y5 = filloutliers(x5,'linear','movmean',20);
 y6 = filloutliers(x6,'linear','movmean',20);
 y7 = filloutliers(x7,'linear','movmean',20);
 y8 = filloutliers(x8,'linear','movmean',20);
 y9 = filloutliers(x9,'linear','movmean',20);
 y10 = filloutliers(x10,'linear','movmean',20);
 y11 = filloutliers(x11,'linear','movmean',20);
 y12 = filloutliers(x12,'linear','movmean',20);
 y13 = filloutliers(x13,'linear','movmean',20);
 y14 = filloutliers(x14,'linear','movmean',20);
 y15 = filloutliers(x15,'linear','movmean',20);
 y16 = filloutliers(x16,'linear','movmean',20);
 y17 = filloutliers(x17,'linear','movmean',20);
 y18 = filloutliers(x18,'linear','movmean',20);
 
 z1 = movmedian(y1,3); %中位数滤波,移动中位数，窗口长度为3
 z2 = movmedian(y2,3);
 z3 = movmedian(y3,3);
 z4 = movmedian(y4,3);
 z5 = movmedian(y5,3);
 z6 = movmedian(y6,3);
 z7 = movmedian(y7,3);
 z8 = movmedian(y8,3);
 z9 = movmedian(y9,3);
 z10 = movmedian(y10,3);
 z11 = movmedian(y11,3);
 z12 = movmedian(y12,3);
 z13 = movmedian(y13,3);
 z14 = movmedian(y14,3);
 z15 = movmedian(y15,3);
 z16 = movmedian(y16,3);
 z17 = movmedian(y17,3);
 z18 = movmedian(y18,3);
 
 test_data = [z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16,z17,z18]; %生成过滤后测试样本
 

 %针对要训练的4个二分类器,定义4个训练标签集
 train_label1 = zeros(number_train_label,1);
 train_label2 = zeros(number_train_label,1);
 train_label3 = zeros(number_train_label,1);
 train_label4 = zeros(number_train_label,1);
 %训练集标签（0或1）填入二分类器
 [m,~] = size(train_data);
 for i = 1:m
     if train_label(i,1) == 1
        train_label1(i) = 1;
     end
     if train_label(i,1) == 2
        train_label2(i) = 1;
     end     
     if train_label(i,1) == 3
        train_label3(i) = 1;
     end      
     if train_label(i,1) == 4
        train_label4(i) = 1;
     end     
 end
 
 %采用传统机器学习分类器（支持向量机、随机森林、决策树、K近邻、朴素贝叶斯、线性判别分析、AdaBoost和Random subspace）进行分类

 %支持向量机（高斯核）
 %设置高斯核函数的支持向量机参数
 %kernel = 'gaussian';
 %sigma = 10;
 %C = 1000;
 %对训练集数据分别支持向量机的进行训练
 %model1 = fitcsvm(train_data,train_label1,'KernelFunction',kernel,'KernelScale', sigma,'BoxConstraint',C);
 %model2 = fitcsvm(train_data,train_label2,'KernelFunction',kernel,'KernelScale', sigma,'BoxConstraint',C);
 %model3 = fitcsvm(train_data,train_label3,'KernelFunction',kernel,'KernelScale', sigma,'BoxConstraint',C);
 %model4 = fitcsvm(train_data,train_label4,'KernelFunction',kernel,'KernelScale', sigma,'BoxConstraint',C);
 
 %支持向量机(线性核)
 model1 = fitcsvm(train_data,train_label1);
 model2 = fitcsvm(train_data,train_label2);
 model3 = fitcsvm(train_data,train_label3);
 model4 = fitcsvm(train_data,train_label4);
 
 %随机森林
 %nTree = 500;
 %model1 = TreeBagger(nTree,train_data,train_label1,'Method', 'classification');
 %model2 = TreeBagger(nTree,train_data,train_label2,'Method', 'classification');
 %model3 = TreeBagger(nTree,train_data,train_label3,'Method', 'classification');
 %model4 = TreeBagger(nTree,train_data,train_label4,'Method', 'classification');
 
 %决策树
 %model1 = fitctree(train_data,train_label1);
 %model2 = fitctree(train_data,train_label2);
 %model3 = fitctree(train_data,train_label3);
 %model4 = fitctree(train_data,train_label4);
 
 %K近邻
 %model1 = ClassificationKNN.fit(train_data,train_label1,'NumNeighbors',4);
 %model2 = ClassificationKNN.fit(train_data,train_label2,'NumNeighbors',4);
 %model3 = ClassificationKNN.fit(train_data,train_label3,'NumNeighbors',4);
 %model4 = ClassificationKNN.fit(train_data,train_label4,'NumNeighbors',4);
 
 %朴素贝叶斯（不太行）
 %model1 = fitcnb(train_data,train_label1);
 %model2 = fitcnb(train_data,train_label2);
 %model3 = fitcnb(train_data,train_label3);
 %model4 = fitcnb(train_data,train_label4);
 
 %线性判别分析（一般般）
 %model1 = ClassificationDiscriminant.fit(train_data,train_label1);
 %model2 = ClassificationDiscriminant.fit(train_data,train_label2);
 %model3 = ClassificationDiscriminant.fit(train_data,train_label3);
 %model4 = ClassificationDiscriminant.fit(train_data,train_label4);
 
 %AdaBoost（一般般）
 %model1 = fitensemble(train_data,train_label1, 'AdaBoostM1', 100, 'tree', 'type', 'classification');
 %model2 = fitensemble(train_data,train_label2, 'AdaBoostM1', 100, 'tree', 'type', 'classification');
 %model3 = fitensemble(train_data,train_label3, 'AdaBoostM1', 100, 'tree', 'type', 'classification');
 %model4 = fitensemble(train_data,train_label4, 'AdaBoostM1', 100, 'tree', 'type', 'classification');
 
 %Random Subspace（不太行）
 %model1 = fitensemble(train_data,train_label1, 'Subspace', 50, 'KNN');
 %model2 = fitensemble(train_data,train_label2, 'Subspace', 50, 'KNN');
 %model3 = fitensemble(train_data,train_label3, 'Subspace', 50, 'KNN');
 %model4 = fitensemble(train_data,train_label4, 'Subspace', 50, 'KNN');

 %将测试集在4个分类器中分别训练返回其在各个分类器的值
 [label1,final_score1] = predict(model1,test_data);
 [label2,final_score2] = predict(model2,test_data);
 [label3,final_score3] = predict(model3,test_data);
 [label4,final_score4] = predict(model4,test_data);
 %将测试后的数据融合
 final_score = [final_score1(:,2),final_score2(:,2),final_score3(:,2),final_score4(:,2)];
 final_label = zeros(number_test_label,1);
 %返回融合后的标签与位置的最大值和位置，生成最终的标签，完成测试集预测
 [m,~] = size(final_label);
 for i = 1:m
     [~,n] = max(final_score(i,:));
     final_label(i,:) = n;
 end
 
 %分类结果评估
 A = confusionmat(test_label,final_label,'Order',[1;2;3;4]); 
 [m,~] = size(A);
 for i = 1:m
     c_p = A(i,i) / sum(A(:,i));
     c_r = A(i,i) / sum(A(i,:));   %一类的召回率r在多分类任务中，充当该类的识别准确率（Recognition Accuracy）
     c_F = 2*c_p*c_r / (c_p + c_r);
     fprintf('第%d类的查准率为%f,查全率为%f,F测度为%f\n\n',i,c_p,c_r,c_F);
 end
 
 t_a = sum(diag(A)) / sum(sum(A)); %整体识别准确率
 fprintf('整体识别准确率为 %f\n',t_a);
