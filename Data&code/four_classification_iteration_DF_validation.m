 %��ȡ���ݼ�����������ǩ
 %����1��ƽ�������֡��������������ݼ���ǩ
 data11 = xlsread('11.xlsx','B1:T1139');%ƽ��
 %��ȡdata11�Ĳ���֡��������ǩ
 data11_DF = zeros(size(data11,1)-1,size(data11,2));
 for i = 1:size(data11,1)-1
     data11_DF(i,1:size(data11,2)-1) = data11(i+1,1:size(data11,2)-1)-data11(i,1:size(data11,2)-1);
     data11_DF(i,size(data11,2)) = data11(i+1,size(data11,2));
 end
 data12 = xlsread('12.xlsx','B1:T1228');%����
 %��ȡdata12�Ĳ���֡��������ǩ
 data12_DF = zeros(size(data12,1)-1,size(data12,2));
 for i = 1:size(data12,1)-1
     data12_DF(i,1:size(data12,2)-1) = data12(i+1,1:size(data12,2)-1)-data12(i,1:size(data12,2)-1);
     data12_DF(i,size(data12,2)) = data12(i+1,size(data12,2));
 end
 data13 = xlsread('13.xlsx','B1:T1031');%����
 %��ȡdata13�Ĳ���֡��������ǩ
 data13_DF = zeros(size(data13,1)-1,size(data13,2));
 for i = 1:size(data13,1)-1
     data13_DF(i,1:size(data13,2)-1) = data13(i+1,1:size(data13,2)-1)-data13(i,1:size(data13,2)-1);
     data13_DF(i,size(data13,2)) = data13(i+1,size(data13,2));
 end
 data14 = xlsread('14.xlsx','B1:T1012');%����
%��ȡdata14�Ĳ���֡��������ǩ
 data14_DF = zeros(size(data14,1)-1,size(data14,2));
 for i = 1:size(data14,1)-1
     data14_DF(i,1:size(data14,2)-1) = data14(i+1,1:size(data14,2)-1)-data14(i,1:size(data14,2)-1);
     data14_DF(i,size(data14,2)) = data14(i+1,size(data14,2));
 end
 data1 = [data11_DF;data12_DF;data13_DF;data14_DF]; %S1����֡���ݻ���
 
 %����2��ƽ�������֡��������������ݼ���ǩ
 data21 = xlsread('21.xlsx','B1:T1196');%ƽ��
 %��ȡdata21�Ĳ���֡��������ǩ
 data21_DF = zeros(size(data21,1)-1,size(data21,2));
 for i = 1:size(data21,1)-1
     data21_DF(i,1:size(data21,2)-1) = data21(i+1,1:size(data21,2)-1)-data21(i,1:size(data21,2)-1);
     data21_DF(i,size(data21,2)) = data21(i+1,size(data21,2));
 end
 data22 = xlsread('22.xlsx','B1:T689');%����
 %��ȡdata22�Ĳ���֡��������ǩ
 data22_DF = zeros(size(data22,1)-1,size(data22,2));
 for i = 1:size(data22,1)-1
     data22_DF(i,1:size(data22,2)-1) = data22(i+1,1:size(data22,2)-1)-data22(i,1:size(data22,2)-1);
     data22_DF(i,size(data22,2)) = data22(i+1,size(data22,2));
 end
 data23 = xlsread('23.xlsx','B1:T944');%����
 %��ȡdata23�Ĳ���֡��������ǩ
 data23_DF = zeros(size(data23,1)-1,size(data23,2));
 for i = 1:size(data23,1)-1
     data23_DF(i,1:size(data23,2)-1) = data23(i+1,1:size(data23,2)-1)-data23(i,1:size(data23,2)-1);
     data23_DF(i,size(data23,2)) = data23(i+1,size(data23,2));
 end
 data24 = xlsread('24.xlsx','B1:T861');%����
 %��ȡdata24�Ĳ���֡��������ǩ
 data24_DF = zeros(size(data24,1)-1,size(data24,2));
 for i = 1:size(data24,1)-1
     data24_DF(i,1:size(data24,2)-1) = data24(i+1,1:size(data24,2)-1)-data24(i,1:size(data24,2)-1);
     data24_DF(i,size(data24,2)) = data24(i+1,size(data24,2));
 end
 data2 = [data21_DF;data22_DF;data23_DF;data24_DF]; %S2����֡���ݻ���
 
 %����3��ƽ�������֡��������������ݼ���ǩ
 data31 = xlsread('31.xlsx','B1:T2925');%ƽ��
 %��ȡdata31�Ĳ���֡��������ǩ
 data31_DF = zeros(size(data31,1)-1,size(data31,2));
 for i = 1:size(data31,1)-1
     data31_DF(i,1:size(data31,2)-1) = data31(i+1,1:size(data31,2)-1)-data31(i,1:size(data31,2)-1);
     data31_DF(i,size(data31,2)) = data31(i+1,size(data31,2));
 end
 data32 = xlsread('32.xlsx','B1:T1167');%����
 %��ȡdata32�Ĳ���֡��������ǩ
 data32_DF = zeros(size(data32,1)-1,size(data32,2));
 for i = 1:size(data32,1)-1
     data32_DF(i,1:size(data32,2)-1) = data32(i+1,1:size(data32,2)-1)-data32(i,1:size(data32,2)-1);
     data32_DF(i,size(data32,2)) = data32(i+1,size(data32,2));
 end
 data33 = xlsread('33.xlsx','B1:T1135');%����
 %��ȡdata33�Ĳ���֡��������ǩ
 data33_DF = zeros(size(data33,1)-1,size(data33,2));
 for i = 1:size(data33,1)-1
     data33_DF(i,1:size(data33,2)-1) = data33(i+1,1:size(data33,2)-1)-data33(i,1:size(data33,2)-1);
     data33_DF(i,size(data33,2)) = data33(i+1,size(data33,2));
 end
 data34 = xlsread('34.xlsx','B1:T1040');%����
 %��ȡdata34�Ĳ���֡��������ǩ
 data34_DF = zeros(size(data34,1)-1,size(data34,2));
 for i = 1:size(data34,1)-1
     data34_DF(i,1:size(data34,2)-1) = data34(i+1,1:size(data34,2)-1)-data34(i,1:size(data34,2)-1);
     data34_DF(i,size(data34,2)) = data34(i+1,size(data34,2));
 end
 data3 = [data31_DF;data32_DF;data33_DF;data34_DF]; %S3����֡���ݻ���
 
 %����4��ƽ�������֡��������������ݼ���ǩ
 data51 = xlsread('51.xlsx','B1:T1451');%ƽ��
 %��ȡdata51�Ĳ���֡��������ǩ
 data51_DF = zeros(size(data51,1)-1,size(data51,2));
 for i = 1:size(data51,1)-1
     data51_DF(i,1:size(data51,2)-1) = data51(i+1,1:size(data51,2)-1)-data51(i,1:size(data51,2)-1);
     data51_DF(i,size(data51,2)) = data51(i+1,size(data51,2));
 end
 data52 = xlsread('52.xlsx','B1:T1214');%����
 %��ȡdata52�Ĳ���֡��������ǩ
 data52_DF = zeros(size(data52,1)-1,size(data52,2));
 for i = 1:size(data52,1)-1
     data52_DF(i,1:size(data52,2)-1) = data52(i+1,1:size(data52,2)-1)-data52(i,1:size(data52,2)-1);
     data52_DF(i,size(data52,2)) = data52(i+1,size(data52,2));
 end
 data53 = xlsread('53.xlsx','B1:T3446');%����
 %��ȡdata53�Ĳ���֡��������ǩ
 data53_DF = zeros(size(data53,1)-1,size(data53,2));
 for i = 1:size(data53,1)-1
     data53_DF(i,1:size(data53,2)-1) = data53(i+1,1:size(data53,2)-1)-data53(i,1:size(data53,2)-1);
     data53_DF(i,size(data53,2)) = data53(i+1,size(data53,2));
 end
 data54 = xlsread('54.xlsx','B1:T1436');%����
 %��ȡdata54�Ĳ���֡��������ǩ
 data54_DF = zeros(size(data54,1)-1,size(data54,2));
 for i = 1:size(data54,1)-1
     data54_DF(i,1:size(data54,2)-1) = data54(i+1,1:size(data54,2)-1)-data54(i,1:size(data54,2)-1);
     data54_DF(i,size(data54,2)) = data54(i+1,size(data54,2));
 end
 data4 = [data51_DF;data52_DF;data53_DF;data54_DF]; %S4����֡���ݻ���
 
 %����5��ƽ�������֡��������������ݼ���ǩ
 data41 = xlsread('41.xlsx','B1:T1979');%ƽ��
 %��ȡdata41�Ĳ���֡��������ǩ
 data41_DF = zeros(size(data41,1)-1,size(data41,2));
 for i = 1:size(data41,1)-1
     data41_DF(i,1:size(data41,2)-1) = data41(i+1,1:size(data41,2)-1)-data41(i,1:size(data41,2)-1);
     data41_DF(i,size(data41,2)) = data41(i+1,size(data41,2));
 end
 data42 = xlsread('42.xlsx','B1:T1479');%����
 %��ȡdata42�Ĳ���֡��������ǩ
 data42_DF = zeros(size(data42,1)-1,size(data42,2));
 for i = 1:size(data42,1)-1
     data42_DF(i,1:size(data42,2)-1) = data42(i+1,1:size(data42,2)-1)-data42(i,1:size(data42,2)-1);
     data42_DF(i,size(data42,2)) = data42(i+1,size(data42,2));
 end
 data43 = xlsread('43.xlsx','B1:T1426');%����
 %��ȡdata43�Ĳ���֡��������ǩ
 data43_DF = zeros(size(data43,1)-1,size(data43,2));
 for i = 1:size(data43,1)-1
     data43_DF(i,1:size(data43,2)-1) = data43(i+1,1:size(data43,2)-1)-data43(i,1:size(data43,2)-1);
     data43_DF(i,size(data43,2)) = data43(i+1,size(data43,2));
 end
 data44 = xlsread('44.xlsx','B1:T1316');%���� 
 %��ȡdata44�Ĳ���֡��������ǩ
 data44_DF = zeros(size(data44,1)-1,size(data44,2));
 for i = 1:size(data44,1)-1
     data44_DF(i,1:size(data44,2)-1) = data44(i+1,1:size(data44,2)-1)-data44(i,1:size(data44,2)-1);
     data44_DF(i,size(data44,2)) = data44(i+1,size(data44,2));
 end
 data5 = [data41_DF;data42_DF;data43_DF;data44_DF]; %S5����֡���ݻ���

 %����ѵ���������ݼ��������ͱ�ǩ��
 data_TRAIN = [data2;data3;data4;data5];
 
 %������֤�������ݼ��������ͱ�ǩ��
 data_TEST = data1;

 %��֡������������һά���飩�ĳ��ȣ���Ԫ�ظ�����
 length_sample = size(data_TRAIN,2)-1;
 
 %��ȡԭʼѵ��������ѵ����ǩ
 train_data_raw = data_TRAIN(1:end, 1:length_sample);       %ѵ������,length_sample��������Ԫ�صĸ���
 train_label = data_TRAIN(1:end, length_sample+1);      %ѵ����ǩ
 number_train_label = length(train_label);              %ѵ����ǩ������
 
 %��ȡԭʼ��֤�����Ͳ��Ա�ǩ
 test_data_raw = data_TEST(1:end, 1:length_sample);       %��������,length_sample��������Ԫ�صĸ���
 test_label = data_TEST(1:end, length_sample+1);      %���Ա�ǩ
 number_test_label = length(test_label);               %���Ա�ǩ������
 
 %ԭʼѵ�������Ĺ���
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
 
 y1 = filloutliers(x1,'linear','movmean',20); %��׼�ȥ��Ⱥֵ
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
 
 z1 = movmedian(y1,3); %��λ���˲�,�ƶ���λ�������ڳ���Ϊ3
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
 
 train_data = [z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16,z17,z18]; %���ɹ��˺�ѵ������
 
 %ԭʼ��֤�����Ĺ���
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
 
 y1 = filloutliers(x1,'linear','movmean',20); %��׼�ȥ��Ⱥֵ
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
 
 z1 = movmedian(y1,3); %��λ���˲�,�ƶ���λ�������ڳ���Ϊ3
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
 
 test_data = [z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16,z17,z18]; %���ɹ��˺��������
 

 %���Ҫѵ����4����������,����4��ѵ����ǩ��
 train_label1 = zeros(number_train_label,1);
 train_label2 = zeros(number_train_label,1);
 train_label3 = zeros(number_train_label,1);
 train_label4 = zeros(number_train_label,1);
 %ѵ������ǩ��0��1�������������
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
 
 %���ɭ��
 nTree = 500;
 model1 = TreeBagger(nTree,train_data,train_label1,'Method', 'classification');
 model2 = TreeBagger(nTree,train_data,train_label2,'Method', 'classification');
 model3 = TreeBagger(nTree,train_data,train_label3,'Method', 'classification');
 model4 = TreeBagger(nTree,train_data,train_label4,'Method', 'classification');

 %�����Լ���4���������зֱ�ѵ���������ڸ�����������ֵ
 [label1,final_score1] = predict(model1,test_data);
 [label2,final_score2] = predict(model2,test_data);
 [label3,final_score3] = predict(model3,test_data);
 [label4,final_score4] = predict(model4,test_data);
 %�����Ժ�������ں�
 final_score = [final_score1(:,2),final_score2(:,2),final_score3(:,2),final_score4(:,2)];
 final_label = zeros(number_test_label,1);
 %�����ںϺ�ı�ǩ��λ�õ����ֵ��λ�ã��������յı�ǩ����ɲ��Լ�Ԥ��
 [m,~] = size(final_label);
 for i = 1:m
     [~,n] = max(final_score(i,:));
     final_label(i,:) = n;
 end
 
 %����������
 A = confusionmat(test_label,final_label,'Order',[1;2;3;4]); 
 [m,~] = size(A);
 for i = 1:m
     c_p = A(i,i) / sum(A(:,i));
     c_r = A(i,i) / sum(A(i,:));   %һ����ٻ���r�ڶ���������У��䵱�����ʶ��׼ȷ�ʣ�Recognition Accuracy��
     c_F = 2*c_p*c_r / (c_p + c_r);
     fprintf('��%d��Ĳ�׼��Ϊ%f,��ȫ��Ϊ%f,F���Ϊ%f\n\n',i,c_p,c_r,c_F);
 end
 
  %����֤��test_label��final_labelд��excel��
 xlswrite('RF_DF_classification_validation.xlsx', test_label, 'Sheet1', 'A1');
 xlswrite('RF_DF_classification_validation.xlsx', final_label, 'Sheet1', 'B1');
 
