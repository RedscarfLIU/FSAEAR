 %读取数据集中样本及标签
 %被试1的平静、快乐、生气及伤心数据及标签
 data11 = xlsread('11.xlsx','B1:T1139');%平静
 %提取data11的差异帧样本及标签
 data11_DF = zeros(size(data11,1)-1,size(data11,2));
 for i = 1:size(data11,1)-1
     data11_DF(i,1:size(data11,2)-1) = data11(i+1,1:size(data11,2)-1)-data11(i,1:size(data11,2)-1);
     data11_DF(i,size(data11,2)) = data11(i+1,size(data11,2));
 end
 data12 = xlsread('12.xlsx','B1:T1228');%快乐
 %提取data12的差异帧样本及标签
 data12_DF = zeros(size(data12,1)-1,size(data12,2));
 for i = 1:size(data12,1)-1
     data12_DF(i,1:size(data12,2)-1) = data12(i+1,1:size(data12,2)-1)-data12(i,1:size(data12,2)-1);
     data12_DF(i,size(data12,2)) = data12(i+1,size(data12,2));
 end
 data13 = xlsread('13.xlsx','B1:T1031');%生气
 %提取data13的差异帧样本及标签
 data13_DF = zeros(size(data13,1)-1,size(data13,2));
 for i = 1:size(data13,1)-1
     data13_DF(i,1:size(data13,2)-1) = data13(i+1,1:size(data13,2)-1)-data13(i,1:size(data13,2)-1);
     data13_DF(i,size(data13,2)) = data13(i+1,size(data13,2));
 end
 data14 = xlsread('14.xlsx','B1:T1012');%伤心
%提取data14的差异帧样本及标签
 data14_DF = zeros(size(data14,1)-1,size(data14,2));
 for i = 1:size(data14,1)-1
     data14_DF(i,1:size(data14,2)-1) = data14(i+1,1:size(data14,2)-1)-data14(i,1:size(data14,2)-1);
     data14_DF(i,size(data14,2)) = data14(i+1,size(data14,2));
 end
 data1 = [data11_DF;data12_DF;data13_DF;data14_DF]; %S1差异帧数据汇总
 
 %被试2的平静、快乐、生气及伤心数据及标签
 data21 = xlsread('21.xlsx','B1:T1196');%平静
 %提取data21的差异帧样本及标签
 data21_DF = zeros(size(data21,1)-1,size(data21,2));
 for i = 1:size(data21,1)-1
     data21_DF(i,1:size(data21,2)-1) = data21(i+1,1:size(data21,2)-1)-data21(i,1:size(data21,2)-1);
     data21_DF(i,size(data21,2)) = data21(i+1,size(data21,2));
 end
 data22 = xlsread('22.xlsx','B1:T689');%快乐
 %提取data22的差异帧样本及标签
 data22_DF = zeros(size(data22,1)-1,size(data22,2));
 for i = 1:size(data22,1)-1
     data22_DF(i,1:size(data22,2)-1) = data22(i+1,1:size(data22,2)-1)-data22(i,1:size(data22,2)-1);
     data22_DF(i,size(data22,2)) = data22(i+1,size(data22,2));
 end
 data23 = xlsread('23.xlsx','B1:T944');%生气
 %提取data23的差异帧样本及标签
 data23_DF = zeros(size(data23,1)-1,size(data23,2));
 for i = 1:size(data23,1)-1
     data23_DF(i,1:size(data23,2)-1) = data23(i+1,1:size(data23,2)-1)-data23(i,1:size(data23,2)-1);
     data23_DF(i,size(data23,2)) = data23(i+1,size(data23,2));
 end
 data24 = xlsread('24.xlsx','B1:T861');%伤心
 %提取data24的差异帧样本及标签
 data24_DF = zeros(size(data24,1)-1,size(data24,2));
 for i = 1:size(data24,1)-1
     data24_DF(i,1:size(data24,2)-1) = data24(i+1,1:size(data24,2)-1)-data24(i,1:size(data24,2)-1);
     data24_DF(i,size(data24,2)) = data24(i+1,size(data24,2));
 end
 data2 = [data21_DF;data22_DF;data23_DF;data24_DF]; %S2差异帧数据汇总
 
 %被试3的平静、快乐、生气及伤心数据及标签
 data31 = xlsread('31.xlsx','B1:T2925');%平静
 %提取data31的差异帧样本及标签
 data31_DF = zeros(size(data31,1)-1,size(data31,2));
 for i = 1:size(data31,1)-1
     data31_DF(i,1:size(data31,2)-1) = data31(i+1,1:size(data31,2)-1)-data31(i,1:size(data31,2)-1);
     data31_DF(i,size(data31,2)) = data31(i+1,size(data31,2));
 end
 data32 = xlsread('32.xlsx','B1:T1167');%快乐
 %提取data32的差异帧样本及标签
 data32_DF = zeros(size(data32,1)-1,size(data32,2));
 for i = 1:size(data32,1)-1
     data32_DF(i,1:size(data32,2)-1) = data32(i+1,1:size(data32,2)-1)-data32(i,1:size(data32,2)-1);
     data32_DF(i,size(data32,2)) = data32(i+1,size(data32,2));
 end
 data33 = xlsread('33.xlsx','B1:T1135');%生气
 %提取data33的差异帧样本及标签
 data33_DF = zeros(size(data33,1)-1,size(data33,2));
 for i = 1:size(data33,1)-1
     data33_DF(i,1:size(data33,2)-1) = data33(i+1,1:size(data33,2)-1)-data33(i,1:size(data33,2)-1);
     data33_DF(i,size(data33,2)) = data33(i+1,size(data33,2));
 end
 data34 = xlsread('34.xlsx','B1:T1040');%伤心
 %提取data34的差异帧样本及标签
 data34_DF = zeros(size(data34,1)-1,size(data34,2));
 for i = 1:size(data34,1)-1
     data34_DF(i,1:size(data34,2)-1) = data34(i+1,1:size(data34,2)-1)-data34(i,1:size(data34,2)-1);
     data34_DF(i,size(data34,2)) = data34(i+1,size(data34,2));
 end
 data3 = [data31_DF;data32_DF;data33_DF;data34_DF]; %S3差异帧数据汇总
 
 %被试4的平静、快乐、生气及伤心数据及标签
 data51 = xlsread('51.xlsx','B1:T1451');%平静
 %提取data51的差异帧样本及标签
 data51_DF = zeros(size(data51,1)-1,size(data51,2));
 for i = 1:size(data51,1)-1
     data51_DF(i,1:size(data51,2)-1) = data51(i+1,1:size(data51,2)-1)-data51(i,1:size(data51,2)-1);
     data51_DF(i,size(data51,2)) = data51(i+1,size(data51,2));
 end
 data52 = xlsread('52.xlsx','B1:T1214');%快乐
 %提取data52的差异帧样本及标签
 data52_DF = zeros(size(data52,1)-1,size(data52,2));
 for i = 1:size(data52,1)-1
     data52_DF(i,1:size(data52,2)-1) = data52(i+1,1:size(data52,2)-1)-data52(i,1:size(data52,2)-1);
     data52_DF(i,size(data52,2)) = data52(i+1,size(data52,2));
 end
 data53 = xlsread('53.xlsx','B1:T3446');%生气
 %提取data53的差异帧样本及标签
 data53_DF = zeros(size(data53,1)-1,size(data53,2));
 for i = 1:size(data53,1)-1
     data53_DF(i,1:size(data53,2)-1) = data53(i+1,1:size(data53,2)-1)-data53(i,1:size(data53,2)-1);
     data53_DF(i,size(data53,2)) = data53(i+1,size(data53,2));
 end
 data54 = xlsread('54.xlsx','B1:T1436');%伤心
 %提取data54的差异帧样本及标签
 data54_DF = zeros(size(data54,1)-1,size(data54,2));
 for i = 1:size(data54,1)-1
     data54_DF(i,1:size(data54,2)-1) = data54(i+1,1:size(data54,2)-1)-data54(i,1:size(data54,2)-1);
     data54_DF(i,size(data54,2)) = data54(i+1,size(data54,2));
 end
 data4 = [data51_DF;data52_DF;data53_DF;data54_DF]; %S4差异帧数据汇总
 
 %被试5的平静、快乐、生气及伤心数据及标签
 data41 = xlsread('41.xlsx','B1:T1979');%平静
 %提取data41的差异帧样本及标签
 data41_DF = zeros(size(data41,1)-1,size(data41,2));
 for i = 1:size(data41,1)-1
     data41_DF(i,1:size(data41,2)-1) = data41(i+1,1:size(data41,2)-1)-data41(i,1:size(data41,2)-1);
     data41_DF(i,size(data41,2)) = data41(i+1,size(data41,2));
 end
 data42 = xlsread('42.xlsx','B1:T1479');%快乐
 %提取data42的差异帧样本及标签
 data42_DF = zeros(size(data42,1)-1,size(data42,2));
 for i = 1:size(data42,1)-1
     data42_DF(i,1:size(data42,2)-1) = data42(i+1,1:size(data42,2)-1)-data42(i,1:size(data42,2)-1);
     data42_DF(i,size(data42,2)) = data42(i+1,size(data42,2));
 end
 data43 = xlsread('43.xlsx','B1:T1426');%生气
 %提取data43的差异帧样本及标签
 data43_DF = zeros(size(data43,1)-1,size(data43,2));
 for i = 1:size(data43,1)-1
     data43_DF(i,1:size(data43,2)-1) = data43(i+1,1:size(data43,2)-1)-data43(i,1:size(data43,2)-1);
     data43_DF(i,size(data43,2)) = data43(i+1,size(data43,2));
 end
 data44 = xlsread('44.xlsx','B1:T1316');%伤心 
 %提取data44的差异帧样本及标签
 data44_DF = zeros(size(data44,1)-1,size(data44,2));
 for i = 1:size(data44,1)-1
     data44_DF(i,1:size(data44,2)-1) = data44(i+1,1:size(data44,2)-1)-data44(i,1:size(data44,2)-1);
     data44_DF(i,size(data44,2)) = data44(i+1,size(data44,2));
 end
 data5 = [data41_DF;data42_DF;data43_DF;data44_DF]; %S5差异帧数据汇总

 %构建训练所用数据集（样本和标签）
 data_TRAIN = [data2;data3;data4;data5];
 
 %构建验证所用数据集（样本和标签）
 data_TEST = data1;

 %单帧样本（即单个一维数组）的长度（即元素个数）
 length_sample = size(data_TRAIN,2)-1;
 
 %读取原始训练样本和训练标签
 train_data_raw = data_TRAIN(1:end, 1:length_sample);       %训练样本,length_sample是数组中元素的个数
 train_label = data_TRAIN(1:end, length_sample+1);      %训练标签
 number_train_label = length(train_label);              %训练标签的数量
 
 %读取原始验证样本和测试标签
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
 
 %原始验证样本的过滤
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
 
 %随机森林
 nTree = 500;
 model1 = TreeBagger(nTree,train_data,train_label1,'Method', 'classification');
 model2 = TreeBagger(nTree,train_data,train_label2,'Method', 'classification');
 model3 = TreeBagger(nTree,train_data,train_label3,'Method', 'classification');
 model4 = TreeBagger(nTree,train_data,train_label4,'Method', 'classification');

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
 
  %将验证的test_label和final_label写入excel表
 xlswrite('RF_DF_classification_validation.xlsx', test_label, 'Sheet1', 'A1');
 xlswrite('RF_DF_classification_validation.xlsx', final_label, 'Sheet1', 'B1');
 
