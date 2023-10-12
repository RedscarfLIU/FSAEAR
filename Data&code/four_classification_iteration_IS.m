 %��ȡ���ݼ�����������ǩ
 %����1��ƽ�������֡��������������ݼ���ǩ
 data11 = xlsread('11.xlsx','B1:T1139');%ƽ��
 data12 = xlsread('12.xlsx','B1:T1228');%����
 data13 = xlsread('13.xlsx','B1:T1031');%����
 data14 = xlsread('14.xlsx','B1:T1012');%����
 data1 = [data11;data12;data13;data14]; %S1���ݻ���
 
 %����2��ƽ�������֡��������������ݼ���ǩ
 data21 = xlsread('21.xlsx','B1:T1196');%ƽ��
 data22 = xlsread('22.xlsx','B1:T689');%����
 data23 = xlsread('23.xlsx','B1:T944');%����
 data24 = xlsread('24.xlsx','B1:T861');%����
 data2 = [data21;data22;data23;data24]; %S2���ݻ���
 
 %����3��ƽ�������֡��������������ݼ���ǩ
 data31 = xlsread('31.xlsx','B1:T2925');%ƽ��
 data32 = xlsread('32.xlsx','B1:T1167');%����
 data33 = xlsread('33.xlsx','B1:T1135');%����
 data34 = xlsread('34.xlsx','B1:T1040');%����
 data3 = [data31;data32;data33;data34]; %S3���ݻ���
 
 %����4��ƽ�������֡��������������ݼ���ǩ
 data51 = xlsread('51.xlsx','B1:T1451');%ƽ��
 data52 = xlsread('52.xlsx','B1:T1214');%����
 data53 = xlsread('53.xlsx','B1:T3446');%����
 data54 = xlsread('54.xlsx','B1:T1436');%���� 
 data4 = [data51;data52;data53;data54]; %S5���ݻ���
 
 
 %����5��ƽ�������֡��������������ݼ���ǩ
 data41 = xlsread('41.xlsx','B1:T1979');%ƽ��
 data42 = xlsread('42.xlsx','B1:T1479');%����
 data43 = xlsread('43.xlsx','B1:T1426');%����
 data44 = xlsread('44.xlsx','B1:T1316');%���� 
 data5 = [data41;data42;data43;data44]; %S5���ݻ���
 
 %����ѵ���������ݼ��������ͱ�ǩ����������֡��
 data_TRAIN = data1(1:2:end,:);
 
 
 %���������������ݼ��������ͱ�ǩ������ż��֡��
 data_TEST = data1(2:2:end,:);
 

 %��֡������������һά���飩�ĳ��ȣ���Ԫ�ظ�����
 length_sample = size(data_TRAIN,2)-1;
 
 %��ȡԭʼѵ��������ѵ����ǩ
 train_data_raw = data_TRAIN(1:end, 1:length_sample);       %ѵ������,length_sample��������Ԫ�صĸ���
 train_label = data_TRAIN(1:end, length_sample+1);      %ѵ����ǩ
 number_train_label = length(train_label);              %ѵ����ǩ������
 
 %��ȡԭʼ���������Ͳ��Ա�ǩ
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
 
 %ԭʼ���������Ĺ���
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
 
 %���ô�ͳ����ѧϰ��������֧�������������ɭ�֡���������K���ڡ����ر�Ҷ˹�������б������AdaBoost��Random subspace�����з���

 %֧������������˹�ˣ�
 %���ø�˹�˺�����֧������������
 %kernel = 'gaussian';
 %sigma = 10;
 %C = 1000;
 %��ѵ�������ݷֱ�֧���������Ľ���ѵ��
 %model1 = fitcsvm(train_data,train_label1,'KernelFunction',kernel,'KernelScale', sigma,'BoxConstraint',C);
 %model2 = fitcsvm(train_data,train_label2,'KernelFunction',kernel,'KernelScale', sigma,'BoxConstraint',C);
 %model3 = fitcsvm(train_data,train_label3,'KernelFunction',kernel,'KernelScale', sigma,'BoxConstraint',C);
 %model4 = fitcsvm(train_data,train_label4,'KernelFunction',kernel,'KernelScale', sigma,'BoxConstraint',C);
 
 %֧��������(���Ժ�)
 model1 = fitcsvm(train_data,train_label1);
 model2 = fitcsvm(train_data,train_label2);
 model3 = fitcsvm(train_data,train_label3);
 model4 = fitcsvm(train_data,train_label4);
 
 %���ɭ��
 %nTree = 500;
 %model1 = TreeBagger(nTree,train_data,train_label1,'Method', 'classification');
 %model2 = TreeBagger(nTree,train_data,train_label2,'Method', 'classification');
 %model3 = TreeBagger(nTree,train_data,train_label3,'Method', 'classification');
 %model4 = TreeBagger(nTree,train_data,train_label4,'Method', 'classification');
 
 %������
 %model1 = fitctree(train_data,train_label1);
 %model2 = fitctree(train_data,train_label2);
 %model3 = fitctree(train_data,train_label3);
 %model4 = fitctree(train_data,train_label4);
 
 %K����
 %model1 = ClassificationKNN.fit(train_data,train_label1,'NumNeighbors',4);
 %model2 = ClassificationKNN.fit(train_data,train_label2,'NumNeighbors',4);
 %model3 = ClassificationKNN.fit(train_data,train_label3,'NumNeighbors',4);
 %model4 = ClassificationKNN.fit(train_data,train_label4,'NumNeighbors',4);
 
 %���ر�Ҷ˹����̫�У�
 %model1 = fitcnb(train_data,train_label1);
 %model2 = fitcnb(train_data,train_label2);
 %model3 = fitcnb(train_data,train_label3);
 %model4 = fitcnb(train_data,train_label4);
 
 %�����б������һ��㣩
 %model1 = ClassificationDiscriminant.fit(train_data,train_label1);
 %model2 = ClassificationDiscriminant.fit(train_data,train_label2);
 %model3 = ClassificationDiscriminant.fit(train_data,train_label3);
 %model4 = ClassificationDiscriminant.fit(train_data,train_label4);
 
 %AdaBoost��һ��㣩
 %model1 = fitensemble(train_data,train_label1, 'AdaBoostM1', 100, 'tree', 'type', 'classification');
 %model2 = fitensemble(train_data,train_label2, 'AdaBoostM1', 100, 'tree', 'type', 'classification');
 %model3 = fitensemble(train_data,train_label3, 'AdaBoostM1', 100, 'tree', 'type', 'classification');
 %model4 = fitensemble(train_data,train_label4, 'AdaBoostM1', 100, 'tree', 'type', 'classification');
 
 %Random Subspace����̫�У�
 %model1 = fitensemble(train_data,train_label1, 'Subspace', 50, 'KNN');
 %model2 = fitensemble(train_data,train_label2, 'Subspace', 50, 'KNN');
 %model3 = fitensemble(train_data,train_label3, 'Subspace', 50, 'KNN');
 %model4 = fitensemble(train_data,train_label4, 'Subspace', 50, 'KNN');

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
 
 t_a = sum(diag(A)) / sum(sum(A)); %����ʶ��׼ȷ��
 fprintf('����ʶ��׼ȷ��Ϊ %f\n',t_a);
