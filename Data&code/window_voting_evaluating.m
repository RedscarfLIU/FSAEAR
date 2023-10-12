data = xlsread('KNN_classification.xlsx', 'Sheet1'); %ԭʼ��������
test_label = data (:,1);       %��ȡ���Ա�ǩ����
test_label = test_label';      %������(���Ա�ǩ)ת��Ϊ��
final_label = data (:,2);      %��ȡԤ���ǩ����
final_label = final_label';    %�����ݣ�Ԥ���ǩ��ת��Ϊ��

window_size = 2;  %���û������ڵĴ�С

%���Ա�ǩ���ݵĻ�����ͶƱ
 windowed_test_label = zeros(length(test_label)-window_size+1, window_size);  %����������ȡ�����Ĵ洢�ռ�
 for i = 1:length(test_label)-window_size+1
     windowed_test_label(i,:) = test_label(i:i+window_size-1); %�����ڴ�Сȡ�����ڵ�����Ԫ����Ϊ����
 end
 windowed_test_label_voting = zeros(length(test_label)-window_size+1,1); %����������������ͶƱ����Ĵ洢�ռ�
 for i = 1:length(test_label)-window_size+1
     windowed_test_label_voting(i,:) = mode(windowed_test_label(i,:)); %������Ʊ�����ػ��������е�����������������Ƶ����ߵ���ж������
 end

%Ԥ���ǩ���ݵĻ�����ͶƱ
 windowed_final_label = zeros(length(final_label)-window_size+1, window_size);  %����������ȡ�����Ĵ洢�ռ�
 for i = 1:length(final_label)-window_size+1
     windowed_final_label(i,:) = final_label(i:i+window_size-1); %�����ڴ�Сȡ�����ڵ�����Ԫ����Ϊ����
 end
 windowed_final_label_voting = zeros(length(final_label)-window_size+1,1); %����������������ͶƱ����Ĵ洢�ռ�
 for i = 1:length(final_label)-window_size+1
     windowed_final_label_voting(i,:) = mode(windowed_final_label(i,:)); %������Ʊ�����ػ��������е�����������������Ƶ����ߵ���ж������
 end

%�ķ�����������
 A = confusionmat(windowed_test_label_voting,windowed_final_label_voting,'Order',[1;2;3;4]); 
 [m,~] = size(A);
 for i = 1:m
     c_p = A(i,i) / sum(A(:,i));
     c_r = A(i,i) / sum(A(i,:));   %һ����ٻ���r�ڶ���������У��䵱�����ʶ��׼ȷ�ʣ�Recognition Accuracy��
     c_F = 2*c_p*c_r / (c_p + c_r);
     fprintf('��%d��Ĳ�׼��Ϊ%f,��ȫ��(ʶ��׼ȷ��)Ϊ%f,F���Ϊ%f\n\n',i,c_p,c_r,c_F);
 end

 t_a = sum(diag(A)) / sum(sum(A)); %����ʶ��׼ȷ��
 fprintf('KNN���� %d ʶ��׼ȷ��Ϊ %f\n',window_size,t_a);
