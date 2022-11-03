function [ ss ] = feature_extraction(route )
% [x,fs]=xlsread('./training-b/a0001.xlsx');

[x,fs]=xlsread(route);
x1=x(:,2);
x2=x(:,3);
x3=x(:,4);
x4=x(:,5);
x5=x(:,6);
x6=x(:,7);
x14=x(:,15);
x15=x(:,16);
x16=x(:,17);
x17=x(:,18);
x18=x(:,19);

%插入信号滤波代码
%标准差法去除离群值(可以先去除离群值再滤波）
y1=filloutliers(x1,'linear','movmean',20);
y2=filloutliers(x2,'linear','movmean',20);
y3=filloutliers(x3,'linear','movmean',20);
y4=filloutliers(x4,'linear','movmean',20);
y5=filloutliers(x5,'linear','movmean',20);
y6=filloutliers(x6,'linear','movmean',20);
y14=filloutliers(x14,'linear','movmean',20);
y15=filloutliers(x15,'linear','movmean',20);
y16=filloutliers(x16,'linear','movmean',20);
y17=filloutliers(x17,'linear','movmean',20);
y18=filloutliers(x18,'linear','movmean',20);

%中位数滤波,移动中位数，窗口长度为3
z1=movmedian(y1,3); 
z2=movmedian(y2,3);
z3=movmedian(y3,3);
z4=movmedian(y4,3);
z5=movmedian(y5,3);
z6=movmedian(y6,3); 
z14=movmedian(y14,3);
z15=movmedian(y15,3);
z16=movmedian(y16,3);
z17=movmedian(y17,3);
z18=movmedian(y18,3); 

%一个18通道样本信号第1通道的特征提取
%提取时域特征（12个添加到特征向量）
SK1 = skewness(z1);                %偏度

%一个18通道样本信号第3通道的特征提取
%提取时域特征（12个添加到特征向量）
MA3 = max(z3); 			        %最大值
MI3 = min(z3); 			        %最小值	
PK3 = MA3-MI3;			                %峰-峰值
AV3 = mean(abs(z3));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST3 = std(z3);			            %标准差
RM3 = rms(z3);			            %均方根
S3 = RM3./AV3;			                %波形因子
C3 = PK3./RM3;                         %峰值因子
I3 = PK3./AV3;                         %脉冲因子
L3 = PK3./mean(sqrt(abs(z3))).^2;	%裕度因子
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'svdpE'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea3 = genFeatureEn(z3,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
SVDPE3=fea3(1,1);    %奇异谱熵


%一个18通道样本信号第5通道的特征提取
%提取时域特征（12个添加到特征向量）
MA5 = max(z5); 			        %最大值
MI5 = min(z5); 			        %最小值	
PK5 = MA5-MI5;			                %峰-峰值
AV5 = mean(abs(z5));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST5 = std(z5);			            %标准差
RM5 = rms(z5);			            %均方根
S5 = RM5./AV5;			                %波形因子
C5 = PK5./RM5;                         %峰值因子
I5 = PK5./AV5;                         %脉冲因子
L5 = PK5./mean(sqrt(abs(z5))).^2;	%裕度因子
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'svdpE','ApEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea5 = genFeatureEn(z5,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
SVDPE5=fea5(1,1);    %奇异谱熵
APE5=fea5(1,2);      %近似熵

%一个18通道样本信号第6通道的特征提取
%提取时域特征（12个添加到特征向量）
MA6 = max(z6); 			        %最大值
MI6 = min(z6); 			        %最小值	
PK6 = MA6-MI6;			                %峰-峰值
AV6 = mean(abs(z6));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST6 = std(z6);			            %标准差
RM6 = rms(z6);			            %均方根
S6 = RM6./AV6;			                %波形因子
C6 = PK6./RM6;                         %峰值因子
I6 = PK6./AV6;                         %脉冲因子
L6 = PK6./mean(sqrt(abs(z6))).^2;	  %裕度因子
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'svdpE'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea6 = genFeatureEn(z6,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
SVDPE6=fea6(1,1);    %奇异谱熵

%一个18通道样本信号第14通道的特征提取
%提取时域特征（12个添加到特征向量）
ST14 = std(z14);			            %标准差

%一个18通道样本信号第15通道的特征提取
%提取时域特征（12个添加到特征向量）
SK15 = skewness(z15);                %偏度
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'SpEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea15 = genFeatureEn(z15,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
SE15=fea15(1,1);       %样本熵

%一个18通道样本信号第16通道的特征提取
%提取时域特征（12个添加到特征向量）
MA16 = max(z16); 			        %最大值
MI16 = min(z16); 			        %最小值	
ME16 = mean(z16); 			        %平均值
RM16 = rms(z16);			            %均方根
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'ApEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea16 = genFeatureEn(z16,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
APE16=fea16(1,1);      %近似熵

%一个18通道样本信号第17通道的特征提取
%提取时域特征（12个添加到特征向量）
ST17 = std(z17);			            %标准差
KU17 = kurtosis(z17);		        %峭度

%一个18通道样本信号第18通道的特征提取
%提取时域特征（12个添加到特征向量）
MA18 = max(z18); 			        %最大值
ME18 = mean(z18); 			        %平均值
KU18 = kurtosis(z18);		        %峭度
RM18 = rms(z18);			            %均方根

%构建18个信号通道的特征(TOP37)
fv1=[SK1];
fv3=[PK3,ST3,S3,C3,I3,L3,SVDPE3]; 
fv5=[PK5,ST5,S5,C5,I5,L5,SVDPE5,APE5];
fv6=[PK6,ST6,S6,C6,I6,L6,SVDPE6];
fv14=[ST14];
fv15=[SK15,SE15];
fv16=[MA16,MI16,ME16,RM16,APE16];
fv17=[ST17,KU17]; 
fv18=[MA18,ME18,KU18,RM18];

%一个18通道样本信号的总特征向量
ss=[fv1,fv3,fv5,fv6,fv14,fv15,fv16,fv17,fv18]; 

%构建18个信号通道的特征(TOP9)
%fv1=[SK1];
%fv3=[SVDPE3]; 
%fv5=[APE5];
%fv6=[PK6];
%fv16=[MA16,MI16,ME16,RM16];
%fv18=[KU18];

%一个18通道样本信号的总特征向量
%ss=[fv1,fv3,fv5,fv6,fv16,fv18]; 

 end
 
