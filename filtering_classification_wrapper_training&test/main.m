clear;
clc;
rng=[0 1 71 1];%ѵ�� rng=[r1 c1 r2 c2]�����ȡ����������б�ǩ��csv�ļ�������ʼĩ��
rng1=[72 1 79 1];%����

%��1�ε���
train_label=csvread('./training-1/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-1/REFERENCE.csv',72,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%�����������ݵ���ȷ�����ǩ
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
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=73:80
    ss=feature_extraction(strcat('./training-1/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%�������������
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label1 = predict(Factor, test_data);
%��Ԫ��з�������ָ��
accuracy1 = length(find(predict_label1 == test_label))/length(test_label)*100;  %������ȷ��,ʶ��������������������
sensitivity1 = length(find(predict_label1(1:4) == test_label(1:4)))/length(test_label(1:4));  %�������ж�,ʶ����������������
specificity1 = length(find(predict_label1(5:8) == test_label(5:8)))/length(test_label(5:8));   %���������,ʶ��������������

%SVM֧��������������
%Factor = fitcsvm(train_data,train_label); 
%predict_label = predict(Factor, test_data); 
%�߼��ع������
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
%������������
%Factor = fitctree(train_data,train_label);
%predict_label = predict(Factor, test_data);
%���ɭ�ַ�����
%nTree = 500;
%Factor = TreeBagger(nTree,train_data,train_label,'Method', 'classification');
%predict_1 = predict(Factor, test_data);
%predict_label = cellfun(@str2num,predict_1);
%K���ڷ�����
%Factor = ClassificationKNN.fit(train_data,train_label,'NumNeighbors',4);
%predict_label = predict(Factor, test_data);
%���ر�Ҷ˹������
%Factor = fitcnb(train_data,train_label);
%predict_label = predict(Factor, test_data);
%�������������
%Factor = ClassificationDiscriminant.fit(train_data,train_label);
%predict_label = predict(Factor, test_data);
%Boosting������
%Factor = fitensemble(train_data, train_label, 'AdaBoostM1', 100, 'tree', 'type', 'classification');
%predict_label = predict(Factor, test_data);
%Random Subspace������
%Factor = fitensemble(train_data, train_label, 'Subspace', 50, 'KNN');
%predict_label = predict(Factor, test_data);

%��2�ε���
train_label=csvread('./training-2/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-2/REFERENCE.csv',72,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%�����������ݵ���ȷ�����ǩ
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
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=73:80
    ss=feature_extraction(strcat('./training-2/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%�������������
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label2 = predict(Factor, test_data); 
%��Ԫ��з�������ָ��
accuracy2 = length(find(predict_label2 == test_label))/length(test_label)*100;  %������ȷ��,ʶ��������������������
sensitivity2 = length(find(predict_label2(1:4) == test_label(1:4)))/length(test_label(1:4));  %�������ж�,ʶ����������������
specificity2 = length(find(predict_label2(5:8) == test_label(5:8)))/length(test_label(5:8));   %���������,ʶ��������������

%��3�ε���
train_label=csvread('./training-3/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-3/REFERENCE.csv',72,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%�����������ݵ���ȷ�����ǩ
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
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=73:80
    ss=feature_extraction(strcat('./training-3/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%�������������
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label3 = predict(Factor, test_data);  
%��Ԫ��з�������ָ��
accuracy3 = length(find(predict_label3 == test_label))/length(test_label)*100;  %������ȷ��,ʶ��������������������
sensitivity3 = length(find(predict_label3(1:4) == test_label(1:4)))/length(test_label(1:4));  %�������ж�,ʶ����������������
specificity3 = length(find(predict_label3(5:8) == test_label(5:8)))/length(test_label(5:8));   %���������,ʶ��������������

%��4�ε���
train_label=csvread('./training-4/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-4/REFERENCE.csv',72,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%�����������ݵ���ȷ�����ǩ
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
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=73:80
    ss=feature_extraction(strcat('./training-4/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%�������������
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label4 = predict(Factor, test_data);  
%��Ԫ��з�������ָ��
accuracy4 = length(find(predict_label4 == test_label))/length(test_label)*100;  %������ȷ��,ʶ��������������������
sensitivity4 = length(find(predict_label4(1:4) == test_label(1:4)))/length(test_label(1:4));  %�������ж�,ʶ����������������
specificity4 = length(find(predict_label4(5:8) == test_label(5:8)))/length(test_label(5:8));   %���������,ʶ��������������

%��5�ε���
train_label=csvread('./training-5/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-5/REFERENCE.csv',72,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%�����������ݵ���ȷ�����ǩ
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
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=73:80
    ss=feature_extraction(strcat('./training-5/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%�������������
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label5 = predict(Factor, test_data);  
%��Ԫ��з�������ָ��
accuracy5 = length(find(predict_label5 == test_label))/length(test_label)*100;  %������ȷ��,ʶ��������������������
sensitivity5 = length(find(predict_label5(1:4) == test_label(1:4)))/length(test_label(1:4));  %�������ж�,ʶ����������������
specificity5 = length(find(predict_label5(5:8) == test_label(5:8)))/length(test_label(5:8));   %���������,ʶ��������������

%��6�ε���
train_label=csvread('./training-6/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-6/REFERENCE.csv',72,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%�����������ݵ���ȷ�����ǩ
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
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=73:80
    ss=feature_extraction(strcat('./training-6/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%�������������
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label6 = predict(Factor, test_data); 
%��Ԫ��з�������ָ��
accuracy6 = length(find(predict_label6 == test_label))/length(test_label)*100;  %������ȷ��,ʶ��������������������
sensitivity6 = length(find(predict_label6(1:4) == test_label(1:4)))/length(test_label(1:4));  %�������ж�,ʶ����������������
specificity6 = length(find(predict_label6(5:8) == test_label(5:8)))/length(test_label(5:8));   %���������,ʶ��������������

%��7�ε���
train_label=csvread('./training-7/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-7/REFERENCE.csv',72,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%�����������ݵ���ȷ�����ǩ
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
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=73:80
    ss=feature_extraction(strcat('./training-7/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%�������������
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label7 = predict(Factor, test_data); 
%��Ԫ��з�������ָ��
accuracy7 = length(find(predict_label7 == test_label))/length(test_label)*100;  %������ȷ��,ʶ��������������������
sensitivity7 = length(find(predict_label7(1:4) == test_label(1:4)))/length(test_label(1:4));  %�������ж�,ʶ����������������
specificity7 = length(find(predict_label7(5:8) == test_label(5:8)))/length(test_label(5:8));   %���������,ʶ��������������

%��8�ε���
train_label=csvread('./training-8/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-8/REFERENCE.csv',72,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%�����������ݵ���ȷ�����ǩ
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
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=73:80
    ss=feature_extraction(strcat('./training-8/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%�������������
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label8 = predict(Factor, test_data);  
%��Ԫ��з�������ָ��
accuracy8 = length(find(predict_label8 == test_label))/length(test_label)*100;  %������ȷ��,ʶ��������������������
sensitivity8 = length(find(predict_label8(1:4) == test_label(1:4)))/length(test_label(1:4));  %�������ж�,ʶ����������������
specificity8 = length(find(predict_label8(5:8) == test_label(5:8)))/length(test_label(5:8));   %���������,ʶ��������������

%��9�ε���
train_label=csvread('./training-9/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-9/REFERENCE.csv',72,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%�����������ݵ���ȷ�����ǩ
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
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=73:80
    ss=feature_extraction(strcat('./training-9/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%�������������
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label9 = predict(Factor, test_data); 
%��Ԫ��з�������ָ��
accuracy9 = length(find(predict_label9 == test_label))/length(test_label)*100;  %������ȷ��,ʶ��������������������
sensitivity9 = length(find(predict_label9(1:4) == test_label(1:4)))/length(test_label(1:4));  %�������ж�,ʶ����������������
specificity9 = length(find(predict_label9(5:8) == test_label(5:8)))/length(test_label(5:8));   %���������,ʶ��������������

%��10�ε���
train_label=csvread('./training-10/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-10/REFERENCE.csv',72,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
%figure();
%subplot(211);
%bar(test_label);%�����������ݵ���ȷ�����ǩ
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
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=73:80
    ss=feature_extraction(strcat('./training-10/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
%�������������
Factor = ClassificationDiscriminant.fit(train_data,train_label);
predict_label10 = predict(Factor, test_data); 
%��Ԫ��з�������ָ��
accuracy10 = length(find(predict_label10 == test_label))/length(test_label)*100;  %������ȷ��,ʶ��������������������
sensitivity10 = length(find(predict_label10(1:4) == test_label(1:4)))/length(test_label(1:4));  %�������ж�,ʶ����������������
specificity10 = length(find(predict_label10(5:8) == test_label(5:8)))/length(test_label(5:8));   %���������,ʶ��������������

%10�۽�����֤���������ж�������ȷ�ʡ������Ⱥ�����ȼ���
accuracy_1_to_10 = [accuracy1 accuracy2 accuracy3 accuracy4 accuracy5 accuracy6 accuracy7 accuracy8 accuracy9 accuracy10];
sensitivity_1_to_10 = [sensitivity1 sensitivity2 sensitivity3 sensitivity4 sensitivity5 sensitivity6 sensitivity7 sensitivity8 sensitivity9 sensitivity10];
specificity_1_to_10 = [specificity1 specificity2 specificity3 specificity4 specificity5 specificity6 specificity7 specificity8 specificity9 specificity10];

accuracy_total = mean(accuracy_1_to_10)  %���������ȷ��
sensitivity_total = mean(sensitivity_1_to_10)  %����������ж�
specificity_total = mean(specificity_1_to_10)  %������ྫȷ��
