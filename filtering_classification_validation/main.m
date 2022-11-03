clear;
clc;
rng=[0 1 79 1];%ѵ�� rng=[r1 c1 r2 c2]�����ȡ����������б�ǩ��csv�ļ�������ʼĩ��
rng1=[80 1 119 1];%����
train_label=csvread('./training-2/REFERENCE.csv',0,1,rng);%��ȡѵ����ǩ
for i=1:length(train_label)
    if train_label(i)<0
       train_label(i)=-1;
    end
end
test_label=csvread('./training-2/REFERENCE.csv',80,1,rng1);%��ȡ���Ա�ǩ
for i=1:length(test_label)
    if test_label(i)<0
       test_label(i)=-1;
    end
end
figure();
subplot(211);
bar(test_label);%�����������ݵ���ȷ�����ǩ
train_data=[];
test_data=[];
%��ԭʼ���ݽ���������ȡ������nά��ѵ�����ݾ���
for i=1:9
    ss=feature_extraction(strcat('./training-2/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:80
    ss=feature_extraction(strcat('./training-2/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%��ԭʼ���ݽ���������ȡ������nά�Ĳ������ݾ���
for i=81:99
    ss=feature_extraction(strcat('./training-2/a00',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end
for i=100:120
    ss=feature_extraction(strcat('./training-2/a0',num2str(i),'.xlsx'));
    test_data=[test_data;ss];
end

%SVM֧��������������(���Ժ�)(Top37�����Ӽ�)
Factor = fitcsvm(train_data,train_label); 
predict_label = predict(Factor, test_data); 

%�߼��ع������(Top9�����Ӽ�)
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

%�������������(Top9�����Ӽ�)
%Factor = ClassificationDiscriminant.fit(train_data,train_label);
%predict_label = predict(Factor, test_data);

%��Ԫ��з�������ָ��
%������ȷ��,ʶ��������������������
accuracy = length(find(predict_label == test_label))/length(test_label)*100
%�������ж�,ʶ����������������
sensitivity = (length(find(predict_label(1:4) == test_label(1:4)))+length(find(predict_label(9:12) == test_label(9:12)))+length(find(predict_label(17:20) == test_label(17:20)))+length(find(predict_label(25:28) == test_label(25:28)))+length(find(predict_label(33:36) == test_label(33:36))))/(length(test_label(1:4))+length(test_label(9:12))+length(test_label(17:20))+length(test_label(25:28))+length(test_label(33:36)))
%���������,ʶ��������������
specificity = (length(find(predict_label(5:8) == test_label(5:8)))+length(find(predict_label(13:16) == test_label(13:16)))+length(find(predict_label(21:24) == test_label(21:24)))+length(find(predict_label(29:32) == test_label(29:32)))+length(find(predict_label(37:40) == test_label(37:40))))/(length(test_label(5:8))+length(test_label(13:16))+length(test_label(21:24))+length(test_label(29:32))+length(test_label(37:40)))
subplot(212);
bar(predict_label);%����Ԥ���������ȷ�𰸽��бȽ�