function index = corrSel( data, label )
%CORRSEL     Correlation-based feature selection
%
%                data .................input data matrix (each row is an
%                observetion)(data数据矩阵每一行是一个观察，比如一个信号样本的系列特征)
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
%		performance in terms of accuracy（特征之间的高相关性以及特征与标签
%       之间的低相关性对分类器性能产生负面影响。换言之，与其他特征具有低线性
%       关系且与标签（要预测的类）具有高线性关系的特征在分类精度方面具有更好
%       的性能）

% 不同特征(比如feature={'A','B','C','D','E'})的值与标签(要预测的类)值之间的皮尔逊关联度计算得到数组C(比如[0.8,0.4,0.5,0.3,0.2])
C=zeros(1, size(data,2));  %zeros(m,n)生成一个m*n的零矩阵,m行n列,size(data,2)返回矩阵data的列数
for i=1:size(data,2)
    switch isnan(abs(corr(data(:,i), label)))  %isnan判断data第i列与label列之间皮尔逊相关性(corr)的绝对值(abs)是否NaN(not a number),是返回1,否返回0
        case 1
            C(i)=0;
        otherwise 
            C(i)=abs(corr(data(:,i), label));
    end
end
sortedC=sort(C); %sort(C)对C中元素按照升序排列, eg: C=[0.8,0.4,0.5,0.3,0.2],则sort(C)=[0.2,0.3,0.4,0.5,0.8]

% 从大到小依次确定C(比如[0.8,0.4,0.5,0.3,0.2])中不同皮尔逊关联度所在的数组位置，得到依次描述从大到小的关联度所在位置的数组index(比如[1,3,2,4,5])
index=zeros(1, size(data,2));  %zeros(m,n)生成一个m*n的零矩阵,m行n列,size(data,2)返回矩阵data的列数
for j=0:size(data,2)-1
    p=find(C==sortedC(end-j));  %end表示数组的最后一个元素,end-j是往前推j位的元素; find用于确定数组C中与sortedC(end-j)相等的数所在的位置
    index(j+1)=p(1);
end
end
% index(比如[1,3,2,4,5])最后用于选择特征,比如selected_features=feature(:,index)={'A'}{'C'}{'B'}{'D'}{'E'}( 1×5 cell 数组)