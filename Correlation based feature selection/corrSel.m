function index = corrSel( data, label )
%CORRSEL     Correlation-based feature selection
%
%                data .................input data matrix (each row is an
%                observetion)(data���ݾ���ÿһ����һ���۲죬����һ���ź�������ϵ������)
%                label.................ground-truth
%
%USAGE
%                index=corrSel(feature,class)
%	         selected_features=feature(:,index)
%
%EXPLANATION
%		High correlation among features and low correlation between
%		labels negatively affect classifier performance. In other
%		words, features that have low linear relations with other
%		features and high linear relations with labels yield to better
%		performance in terms of accuracy������֮��ĸ�������Լ��������ǩ
%       ֮��ĵ�����ԶԷ��������ܲ�������Ӱ�졣����֮���������������е�����
%       ��ϵ�����ǩ��ҪԤ����ࣩ���и����Թ�ϵ�������ڷ��ྫ�ȷ�����и���
%       �����ܣ�

% ��ͬ����(����feature={'A','B','C','D','E'})��ֵ���ǩ(ҪԤ�����)ֵ֮���Ƥ��ѷ�����ȼ���õ�����C(����[0.8,0.4,0.5,0.3,0.2])
C=zeros(1, size(data,2));  %zeros(m,n)����һ��m*n�������,m��n��,size(data,2)���ؾ���data������
for i=1:size(data,2)
    switch isnan(abs(corr(data(:,i), label)))  %isnan�ж�data��i����label��֮��Ƥ��ѷ�����(corr)�ľ���ֵ(abs)�Ƿ�NaN(not a number),�Ƿ���1,�񷵻�0
        case 1
            C(i)=0;
        otherwise 
            C(i)=abs(corr(data(:,i), label));
    end
end
sortedC=sort(C); %sort(C)��C��Ԫ�ذ�����������, eg: C=[0.8,0.4,0.5,0.3,0.2],��sort(C)=[0.2,0.3,0.4,0.5,0.8]

% �Ӵ�С����ȷ��C(����[0.8,0.4,0.5,0.3,0.2])�в�ͬƤ��ѷ���������ڵ�����λ�ã��õ����������Ӵ�С�Ĺ���������λ�õ�����index(����[1,3,2,4,5])
index=zeros(1, size(data,2));  %zeros(m,n)����һ��m*n�������,m��n��,size(data,2)���ؾ���data������
for j=0:size(data,2)-1
    p=find(C==sortedC(end-j));  %end��ʾ��������һ��Ԫ��,end-j����ǰ��jλ��Ԫ��; find����ȷ������C����sortedC(end-j)��ȵ������ڵ�λ��
    index(j+1)=p(1);
end
end
% index(����[1,3,2,4,5])�������ѡ������,����selected_features=feature(:,index)={'A'}{'C'}{'B'}{'D'}{'E'}( 1��5 cell ����)