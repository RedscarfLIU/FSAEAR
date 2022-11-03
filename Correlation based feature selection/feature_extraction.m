function [ ss ] = feature_extraction(route )
% [x,fs]=xlsread('./training-b/a0001.xlsx');

[x,fs]=xlsread(route);
x1=x(:,2);
x2=x(:,3);
x3=x(:,4);
x4=x(:,5);
x5=x(:,6);
x6=x(:,7);
x7=x(:,8);
x8=x(:,9);
x9=x(:,10);
x10=x(:,11);
x11=x(:,12);
x12=x(:,13);
x13=x(:,14);
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
y7=filloutliers(x7,'linear','movmean',20);
y8=filloutliers(x8,'linear','movmean',20);
y9=filloutliers(x9,'linear','movmean',20);
y10=filloutliers(x10,'linear','movmean',20);
y11=filloutliers(x11,'linear','movmean',20);
y12=filloutliers(x12,'linear','movmean',20);
y13=filloutliers(x13,'linear','movmean',20);
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
z7=movmedian(y7,3); 
z8=movmedian(y8,3);
z9=movmedian(y9,3);
z10=movmedian(y10,3);
z11=movmedian(y11,3);
z12=movmedian(y12,3); 
z13=movmedian(y13,3); 
z14=movmedian(y14,3);
z15=movmedian(y15,3);
z16=movmedian(y16,3);
z17=movmedian(y17,3);
z18=movmedian(y18,3); 

fs = 4; %情感数据信号采样频率为4;

%一个18通道样本信号第1通道的特征提取
%提取时域特征（12个添加到特征向量）
MA1 = max(z1); 			        %最大值
MI1 = min(z1); 			        %最小值	
ME1 = mean(z1); 			        %平均值
PK1 = MA1-MI1;			                %峰-峰值
AV1 = mean(abs(z1));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST1 = std(z1);			            %标准差
KU1 = kurtosis(z1);		        %峭度
SK1 = skewness(z1);                %偏度
RM1 = rms(z1);			            %均方根
S1 = RM1./AV1;			                %波形因子
C1 = PK1./RM1;                         %峰值因子
I1 = PK1./AV1;                         %脉冲因子
L1 = PK1./mean(sqrt(abs(z1))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z1,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC1 = sum(p.*f)./sum(p);                %重心频率  
MSF1 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF1 = sqrt(MSF1);                      %均方根频率   
VF1 = sum((f-FC1).^2.*p)./sum(p);        %频率方差   
RVF1 = sqrt(VF1);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea1 = genFeatureEn(z1,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE1=fea1(1,1);     %功率谱熵
SVDPE1=fea1(1,2);    %奇异谱熵
EE1=fea1(1,3);       %能量熵
APE1=fea1(1,4);      %近似熵
SE1=fea1(1,5);       %样本熵
FE1=fea1(1,6);       %模糊熵
PE1=fea1(1,7);       %排列熵

%一个18通道样本信号第2通道的特征提取
%提取时域特征（12个添加到特征向量）
MA2 = max(z2); 			        %最大值
MI2 = min(z2); 			        %最小值	
ME2 = mean(z2); 			        %平均值
PK2 = MA2-MI2;			                %峰-峰值
AV2 = mean(abs(z2));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST2 = std(z2);			            %标准差
KU2 = kurtosis(z2);		        %峭度
SK2 = skewness(z2);                %偏度
RM2 = rms(z2);			            %均方根
S2 = RM2./AV2;			                %波形因子
C2 = PK2./RM2;                         %峰值因子
I2 = PK2./AV2;                         %脉冲因子
L2 = PK2./mean(sqrt(abs(z2))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z2,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC2 = sum(p.*f)./sum(p);                %重心频率  
MSF2 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF2 = sqrt(MSF2);                      %均方根频率   
VF2 = sum((f-FC2).^2.*p)./sum(p);        %频率方差   
RVF2 = sqrt(VF2);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea2 = genFeatureEn(z2,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE2=fea2(1,1);     %功率谱熵
SVDPE2=fea2(1,2);    %奇异谱熵
EE2=fea2(1,3);       %能量熵
APE2=fea2(1,4);      %近似熵
SE2=fea2(1,5);       %样本熵
FE2=fea2(1,6);       %模糊熵
PE2=fea2(1,7);       %排列熵

%一个18通道样本信号第3通道的特征提取
%提取时域特征（12个添加到特征向量）
MA3 = max(z3); 			        %最大值
MI3 = min(z3); 			        %最小值	
ME3 = mean(z3); 			        %平均值
PK3 = MA3-MI3;			                %峰-峰值
AV3 = mean(abs(z3));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST3 = std(z3);			            %标准差
KU3 = kurtosis(z3);		        %峭度
SK3 = skewness(z3);                %偏度
RM3 = rms(z3);			            %均方根
S3 = RM3./AV3;			                %波形因子
C3 = PK3./RM3;                         %峰值因子
I3 = PK3./AV3;                         %脉冲因子
L3 = PK3./mean(sqrt(abs(z3))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z3,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC3 = sum(p.*f)./sum(p);                %重心频率  
MSF3 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF3 = sqrt(MSF3);                      %均方根频率   
VF3 = sum((f-FC3).^2.*p)./sum(p);        %频率方差   
RVF3 = sqrt(VF3);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea3 = genFeatureEn(z3,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE3=fea3(1,1);     %功率谱熵
SVDPE3=fea3(1,2);    %奇异谱熵
EE3=fea3(1,3);       %能量熵
APE3=fea3(1,4);      %近似熵
SE3=fea3(1,5);       %样本熵
FE3=fea3(1,6);       %模糊熵
PE3=fea3(1,7);       %排列熵

%一个18通道样本信号第4通道的特征提取
%提取时域特征（12个添加到特征向量）
MA4 = max(z4); 			        %最大值
MI4 = min(z4); 			        %最小值	
ME4 = mean(z4); 			        %平均值
PK4 = MA4-MI4;			                %峰-峰值
AV4 = mean(abs(z4));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST4 = std(z4);			            %标准差
KU4 = kurtosis(z4);		        %峭度
SK4 = skewness(z4);                %偏度
RM4 = rms(z4);			            %均方根
S4 = RM4./AV4;			                %波形因子
C4 = PK4./RM4;                         %峰值因子
I4 = PK4./AV4;                         %脉冲因子
L4 = PK4./mean(sqrt(abs(z4))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z4,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC4 = sum(p.*f)./sum(p);                %重心频率  
MSF4 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF4 = sqrt(MSF4);                      %均方根频率   
VF4 = sum((f-FC4).^2.*p)./sum(p);        %频率方差   
RVF4 = sqrt(VF4);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea4 = genFeatureEn(z4,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE4=fea4(1,1);     %功率谱熵
SVDPE4=fea4(1,2);    %奇异谱熵
EE4=fea4(1,3);       %能量熵
APE4=fea4(1,4);      %近似熵
SE4=fea4(1,5);       %样本熵
FE4=fea4(1,6);       %模糊熵
PE4=fea4(1,7);       %排列熵

%一个18通道样本信号第5通道的特征提取
%提取时域特征（12个添加到特征向量）
MA5 = max(z5); 			        %最大值
MI5 = min(z5); 			        %最小值	
ME5 = mean(z5); 			        %平均值
PK5 = MA5-MI5;			                %峰-峰值
AV5 = mean(abs(z5));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST5 = std(z5);			            %标准差
KU5 = kurtosis(z5);		        %峭度
SK5 = skewness(z5);                %偏度
RM5 = rms(z5);			            %均方根
S5 = RM5./AV5;			                %波形因子
C5 = PK5./RM5;                         %峰值因子
I5 = PK5./AV5;                         %脉冲因子
L5 = PK5./mean(sqrt(abs(z5))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z5,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC5 = sum(p.*f)./sum(p);                %重心频率  
MSF5 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF5 = sqrt(MSF5);                      %均方根频率   
VF5 = sum((f-FC5).^2.*p)./sum(p);        %频率方差   
RVF5 = sqrt(VF5);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea5 = genFeatureEn(z5,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE5=fea5(1,1);     %功率谱熵
SVDPE5=fea5(1,2);    %奇异谱熵
EE5=fea5(1,3);       %能量熵
APE5=fea5(1,4);      %近似熵
SE5=fea5(1,5);       %样本熵
FE5=fea5(1,6);       %模糊熵
PE5=fea5(1,7);       %排列熵

%一个18通道样本信号第6通道的特征提取
%提取时域特征（12个添加到特征向量）
MA6 = max(z6); 			        %最大值
MI6 = min(z6); 			        %最小值	
ME6 = mean(z6); 			        %平均值
PK6 = MA6-MI6;			                %峰-峰值
AV6 = mean(abs(z6));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST6 = std(z6);			            %标准差
KU6 = kurtosis(z6);		        %峭度
SK6 = skewness(z6);                %偏度
RM6 = rms(z6);			            %均方根
S6 = RM6./AV6;			                %波形因子
C6 = PK6./RM6;                         %峰值因子
I6 = PK6./AV6;                         %脉冲因子
L6 = PK6./mean(sqrt(abs(z6))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z6,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC6 = sum(p.*f)./sum(p);                %重心频率  
MSF6 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF6 = sqrt(MSF6);                      %均方根频率   
VF6 = sum((f-FC6).^2.*p)./sum(p);        %频率方差   
RVF6 = sqrt(VF6);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea6 = genFeatureEn(z6,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE6=fea6(1,1);     %功率谱熵
SVDPE6=fea6(1,2);    %奇异谱熵
EE6=fea6(1,3);       %能量熵
APE6=fea6(1,4);      %近似熵
SE6=fea6(1,5);       %样本熵
FE6=fea6(1,6);       %模糊熵
PE6=fea6(1,7);       %排列熵

%一个18通道样本信号第7通道的特征提取
%提取时域特征（12个添加到特征向量）
MA7 = max(z7); 			        %最大值
MI7 = min(z7); 			        %最小值	
ME7 = mean(z7); 			        %平均值
PK7 = MA7-MI7;			                %峰-峰值
AV7 = mean(abs(z7));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST7 = std(z7);			            %标准差
KU7 = kurtosis(z7);		        %峭度
SK7 = skewness(z7);                %偏度
RM7 = rms(z7);			            %均方根
S7 = RM7./AV7;			                %波形因子
C7 = PK7./RM7;                         %峰值因子
I7 = PK7./AV7;                         %脉冲因子
L7 = PK7./mean(sqrt(abs(z7))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z7,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC7 = sum(p.*f)./sum(p);                %重心频率  
MSF7 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF7 = sqrt(MSF7);                      %均方根频率   
VF7 = sum((f-FC7).^2.*p)./sum(p);        %频率方差   
RVF7 = sqrt(VF7);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea7 = genFeatureEn(z7,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE7=fea7(1,1);     %功率谱熵
SVDPE7=fea7(1,2);    %奇异谱熵
EE7=fea7(1,3);       %能量熵
APE7=fea7(1,4);      %近似熵
SE7=fea7(1,5);       %样本熵
FE7=fea7(1,6);       %模糊熵
PE7=fea7(1,7);       %排列熵

%一个18通道样本信号第8通道的特征提取
%提取时域特征（12个添加到特征向量）
MA8 = max(z8); 			        %最大值
MI8 = min(z8); 			        %最小值	
ME8 = mean(z8); 			        %平均值
PK8 = MA8-MI8;			                %峰-峰值
AV8 = mean(abs(z8));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST8 = std(z8);			            %标准差
KU8 = kurtosis(z8);		        %峭度
SK8 = skewness(z8);                %偏度
RM8 = rms(z8);			            %均方根
S8 = RM8./AV8;			                %波形因子
C8 = PK8./RM8;                         %峰值因子
I8 = PK8./AV8;                         %脉冲因子
L8 = PK8./mean(sqrt(abs(z8))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z8,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC8 = sum(p.*f)./sum(p);                %重心频率  
MSF8 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF8 = sqrt(MSF8);                      %均方根频率   
VF8 = sum((f-FC8).^2.*p)./sum(p);        %频率方差   
RVF8 = sqrt(VF8);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea8 = genFeatureEn(z8,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE8=fea8(1,1);     %功率谱熵
SVDPE8=fea8(1,2);    %奇异谱熵
EE8=fea8(1,3);       %能量熵
APE8=fea8(1,4);      %近似熵
SE8=fea8(1,5);       %样本熵
FE8=fea8(1,6);       %模糊熵
PE8=fea8(1,7);       %排列熵

%一个18通道样本信号第9通道的特征提取
%提取时域特征（12个添加到特征向量）
MA9 = max(z9); 			        %最大值
MI9 = min(z9); 			        %最小值	
ME9 = mean(z9); 			        %平均值
PK9 = MA9-MI9;			                %峰-峰值
AV9 = mean(abs(z9));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST9 = std(z9);			            %标准差
KU9 = kurtosis(z9);		        %峭度
SK9 = skewness(z9);                %偏度
RM9 = rms(z9);			            %均方根
S9 = RM9./AV9;			                %波形因子
C9 = PK9./RM9;                         %峰值因子
I9 = PK9./AV9;                         %脉冲因子
L9 = PK9./mean(sqrt(abs(z9))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z9,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC9 = sum(p.*f)./sum(p);                %重心频率  
MSF9 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF9 = sqrt(MSF9);                      %均方根频率   
VF9 = sum((f-FC9).^2.*p)./sum(p);        %频率方差   
RVF9 = sqrt(VF9);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea9 = genFeatureEn(z9,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE9=fea9(1,1);     %功率谱熵
SVDPE9=fea9(1,2);    %奇异谱熵
EE9=fea9(1,3);       %能量熵
APE9=fea9(1,4);      %近似熵
SE9=fea9(1,5);       %样本熵
FE9=fea9(1,6);       %模糊熵
PE9=fea9(1,7);       %排列熵

%一个18通道样本信号第10通道的特征提取
%提取时域特征（12个添加到特征向量）
MA10 = max(z10); 			        %最大值
MI10 = min(z10); 			        %最小值	
ME10 = mean(z10); 			        %平均值
PK10 = MA10-MI10;			                %峰-峰值
AV10 = mean(abs(z10));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST10 = std(z10);			            %标准差
KU10 = kurtosis(z10);		        %峭度
SK10 = skewness(z10);                %偏度
RM10 = rms(z10);			            %均方根
S10 = RM10./AV10;			                %波形因子
C10 = PK10./RM10;                         %峰值因子
I10 = PK10./AV10;                         %脉冲因子
L10 = PK10./mean(sqrt(abs(z10))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z10,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC10 = sum(p.*f)./sum(p);                %重心频率  
MSF10 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF10 = sqrt(MSF10);                      %均方根频率   
VF10 = sum((f-FC10).^2.*p)./sum(p);        %频率方差   
RVF10 = sqrt(VF10);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea10 = genFeatureEn(z10,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE10=fea10(1,1);     %功率谱熵
SVDPE10=fea10(1,2);    %奇异谱熵
EE10=fea10(1,3);       %能量熵
APE10=fea10(1,4);      %近似熵
SE10=fea10(1,5);       %样本熵
FE10=fea10(1,6);       %模糊熵
PE10=fea10(1,7);       %排列熵

%一个18通道样本信号第11通道的特征提取
%提取时域特征（12个添加到特征向量）
MA11 = max(z11); 			        %最大值
MI11 = min(z11); 			        %最小值	
ME11 = mean(z11); 			        %平均值
PK11 = MA11-MI11;			                %峰-峰值
AV11 = mean(abs(z11));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST11 = std(z11);			            %标准差
KU11 = kurtosis(z11);		        %峭度
SK11 = skewness(z11);                %偏度
RM11 = rms(z11);			            %均方根
S11 = RM11./AV11;			                %波形因子
C11 = PK11./RM11;                         %峰值因子
I11 = PK11./AV11;                         %脉冲因子
L11 = PK11./mean(sqrt(abs(z11))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z11,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC11 = sum(p.*f)./sum(p);                %重心频率  
MSF11 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF11 = sqrt(MSF11);                      %均方根频率   
VF11 = sum((f-FC11).^2.*p)./sum(p);        %频率方差   
RVF11 = sqrt(VF11);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea11 = genFeatureEn(z11,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE11=fea11(1,1);     %功率谱熵
SVDPE11=fea11(1,2);    %奇异谱熵
EE11=fea11(1,3);       %能量熵
APE11=fea11(1,4);      %近似熵
SE11=fea11(1,5);       %样本熵
FE11=fea11(1,6);       %模糊熵
PE11=fea11(1,7);       %排列熵

%一个18通道样本信号第12通道的特征提取
%提取时域特征（12个添加到特征向量）
MA12 = max(z12); 			        %最大值
MI12 = min(z12); 			        %最小值	
ME12 = mean(z12); 			        %平均值
PK12 = MA12-MI12;			                %峰-峰值
AV12 = mean(abs(z12));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST12 = std(z12);			            %标准差
KU12 = kurtosis(z12);		        %峭度
SK12 = skewness(z12);                %偏度
RM12 = rms(z12);			            %均方根
S12 = RM12./AV12;			                %波形因子
C12 = PK12./RM12;                         %峰值因子
I12 = PK12./AV12;                         %脉冲因子
L12 = PK12./mean(sqrt(abs(z12))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z12,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC12 = sum(p.*f)./sum(p);                %重心频率  
MSF12 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF12 = sqrt(MSF12);                      %均方根频率   
VF12 = sum((f-FC12).^2.*p)./sum(p);        %频率方差   
RVF12 = sqrt(VF12);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea12 = genFeatureEn(z12,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE12=fea12(1,1);     %功率谱熵
SVDPE12=fea12(1,2);    %奇异谱熵
EE12=fea12(1,3);       %能量熵
APE12=fea12(1,4);      %近似熵
SE12=fea12(1,5);       %样本熵
FE12=fea12(1,6);       %模糊熵
PE12=fea12(1,7);       %排列熵

%一个18通道样本信号第13通道的特征提取
%提取时域特征（12个添加到特征向量）
MA13 = max(z13); 			        %最大值
MI13 = min(z13); 			        %最小值	
ME13 = mean(z13); 			        %平均值
PK13 = MA13-MI13;			                %峰-峰值
AV13 = mean(abs(z13));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST13 = std(z13);			            %标准差
KU13 = kurtosis(z13);		        %峭度
SK13 = skewness(z13);                %偏度
RM13 = rms(z13);			            %均方根
S13 = RM13./AV13;			                %波形因子
C13 = PK13./RM13;                         %峰值因子
I13 = PK13./AV13;                         %脉冲因子
L13 = PK13./mean(sqrt(abs(z13))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z13,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC13 = sum(p.*f)./sum(p);                %重心频率  
MSF13 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF13 = sqrt(MSF13);                      %均方根频率   
VF13 = sum((f-FC13).^2.*p)./sum(p);        %频率方差   
RVF13 = sqrt(VF13);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea13 = genFeatureEn(z13,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE13=fea13(1,1);     %功率谱熵
SVDPE13=fea13(1,2);    %奇异谱熵
EE13=fea13(1,3);       %能量熵
APE13=fea13(1,4);      %近似熵
SE13=fea13(1,5);       %样本熵
FE13=fea13(1,6);       %模糊熵
PE13=fea13(1,7);       %排列熵

%一个18通道样本信号第14通道的特征提取
%提取时域特征（12个添加到特征向量）
MA14 = max(z14); 			        %最大值
MI14 = min(z14); 			        %最小值	
ME14 = mean(z14); 			        %平均值
PK14 = MA14-MI14;			                %峰-峰值
AV14 = mean(abs(z14));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST14 = std(z14);			            %标准差
KU14 = kurtosis(z14);		        %峭度
SK14 = skewness(z14);                %偏度
RM14 = rms(z14);			            %均方根
S14 = RM14./AV14;			                %波形因子
C14 = PK14./RM14;                         %峰值因子
I14 = PK14./AV14;                         %脉冲因子
L14 = PK14./mean(sqrt(abs(z14))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z14,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC14 = sum(p.*f)./sum(p);                %重心频率  
MSF14 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF14 = sqrt(MSF14);                      %均方根频率   
VF14 = sum((f-FC14).^2.*p)./sum(p);        %频率方差   
RVF14 = sqrt(VF14);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea14 = genFeatureEn(z14,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE14=fea14(1,1);     %功率谱熵
SVDPE14=fea14(1,2);    %奇异谱熵
EE14=fea14(1,3);       %能量熵
APE14=fea14(1,4);      %近似熵
SE14=fea14(1,5);       %样本熵
FE14=fea14(1,6);       %模糊熵
PE14=fea14(1,7);       %排列熵

%一个18通道样本信号第15通道的特征提取
%提取时域特征（12个添加到特征向量）
MA15 = max(z15); 			        %最大值
MI15 = min(z15); 			        %最小值	
ME15 = mean(z15); 			        %平均值
PK15 = MA15-MI15;			                %峰-峰值
AV15 = mean(abs(z15));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST15 = std(z15);			            %标准差
KU15 = kurtosis(z15);		        %峭度
SK15 = skewness(z15);                %偏度
RM15 = rms(z15);			            %均方根
S15 = RM15./AV15;			                %波形因子
C15 = PK15./RM15;                         %峰值因子
I15 = PK15./AV15;                         %脉冲因子
L15 = PK15./mean(sqrt(abs(z15))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z15,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC15 = sum(p.*f)./sum(p);                %重心频率  
MSF15 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF15 = sqrt(MSF15);                      %均方根频率   
VF15 = sum((f-FC15).^2.*p)./sum(p);        %频率方差   
RVF15 = sqrt(VF15);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea15 = genFeatureEn(z15,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE15=fea15(1,1);     %功率谱熵
SVDPE15=fea15(1,2);    %奇异谱熵
EE15=fea15(1,3);       %能量熵
APE15=fea15(1,4);      %近似熵
SE15=fea15(1,5);       %样本熵
FE15=fea15(1,6);       %模糊熵
PE15=fea15(1,7);       %排列熵

%一个18通道样本信号第16通道的特征提取
%提取时域特征（12个添加到特征向量）
MA16 = max(z16); 			        %最大值
MI16 = min(z16); 			        %最小值	
ME16 = mean(z16); 			        %平均值
PK16 = MA16-MI16;			                %峰-峰值
AV16 = mean(abs(z16));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST16 = std(z16);			            %标准差
KU16 = kurtosis(z16);		        %峭度
SK16 = skewness(z16);                %偏度
RM16 = rms(z16);			            %均方根
S16 = RM16./AV16;			                %波形因子
C16 = PK16./RM16;                         %峰值因子
I16 = PK16./AV16;                         %脉冲因子
L16 = PK16./mean(sqrt(abs(z16))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z16,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC16 = sum(p.*f)./sum(p);                %重心频率  
MSF16 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF16 = sqrt(MSF16);                      %均方根频率   
VF16 = sum((f-FC16).^2.*p)./sum(p);        %频率方差   
RVF16 = sqrt(VF16);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea16 = genFeatureEn(z16,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE16=fea16(1,1);     %功率谱熵
SVDPE16=fea16(1,2);    %奇异谱熵
EE16=fea16(1,3);       %能量熵
APE16=fea16(1,4);      %近似熵
SE16=fea16(1,5);       %样本熵
FE16=fea16(1,6);       %模糊熵
PE16=fea16(1,7);       %排列熵

%一个18通道样本信号第17通道的特征提取
%提取时域特征（12个添加到特征向量）
MA17 = max(z17); 			        %最大值
MI17 = min(z17); 			        %最小值	
ME17 = mean(z17); 			        %平均值
PK17 = MA17-MI17;			                %峰-峰值
AV17 = mean(abs(z17));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST17 = std(z17);			            %标准差
KU17 = kurtosis(z17);		        %峭度
SK17 = skewness(z17);                %偏度
RM17 = rms(z17);			            %均方根
S17 = RM17./AV17;			                %波形因子
C17 = PK17./RM17;                         %峰值因子
I17 = PK17./AV17;                         %脉冲因子
L17 = PK17./mean(sqrt(abs(z17))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z17,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC17 = sum(p.*f)./sum(p);                %重心频率  
MSF17 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF17 = sqrt(MSF17);                      %均方根频率   
VF17 = sum((f-FC17).^2.*p)./sum(p);        %频率方差   
RVF17 = sqrt(VF17);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea17 = genFeatureEn(z17,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE17=fea17(1,1);     %功率谱熵
SVDPE17=fea17(1,2);    %奇异谱熵
EE17=fea17(1,3);       %能量熵
APE17=fea17(1,4);      %近似熵
SE17=fea17(1,5);       %样本熵
FE17=fea17(1,6);       %模糊熵
PE17=fea17(1,7);       %排列熵

%一个18通道样本信号第18通道的特征提取
%提取时域特征（12个添加到特征向量）
MA18 = max(z18); 			        %最大值
MI18 = min(z18); 			        %最小值	
ME18 = mean(z18); 			        %平均值
PK18 = MA18-MI18;			                %峰-峰值
AV18 = mean(abs(z18));		        %绝对值的平均值(整流平均值)，计算但是不添加到特征向量，因为在本应用场景和平均值一样大
ST18 = std(z18);			            %标准差
KU18 = kurtosis(z18);		        %峭度
SK18 = skewness(z18);                %偏度
RM18 = rms(z18);			            %均方根
S18 = RM18./AV18;			                %波形因子
C18 = PK18./RM18;                         %峰值因子
I18 = PK18./AV18;                         %脉冲因子
L18 = PK18./mean(sqrt(abs(z18))).^2;	%裕度因子
%周期图法功率谱估计
[p,f] = periodogram(z18,[],[],fs);    %功率谱，p为功率谱幅值，f为频率轴,fs是信号的采样频率
%提取频域特征（5个添加到特征向量）  
FC18 = sum(p.*f)./sum(p);                %重心频率  
MSF18 = sum(f.^2.*p)./sum(p);            %均方频率   
RMSF18 = sqrt(MSF18);                      %均方根频率   
VF18 = sum((f-FC18).^2.*p)./sum(p);        %频率方差   
RVF18 = sqrt(VF18);                        %频率标准差
%调用genFeature函数，求出非线性特征值
featureNamesCell = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn'}; %要进行特征提取的特征名称，可以根据实际需要进行删减，留下的特征注意拼写正确
% 奇异值分解的窗口长度，如果不求奇异谱熵，此行代码可以删除
option.svdpEn = 60; 
% 设置近似熵参数，Apdim为近似熵的模式维度，Apr为近似熵的阈值，如果不提取近似熵特征可以删除以下两行
option.Apdim  = 2;
option.Apr   = 0.15;
% 设置样本熵参数，Spdim为样本熵的模式维度，Spr为样本熵的阈值，如果不提取样本熵特征可以删除以下两行
option.Spdim  = 2;
option.Spr   = 0.15;
% 设置模糊熵参数，Fuzdim为模糊熵模式维度，Fuzr为模糊熵的阈值，Fuzn为模糊熵权重，如果不提取模糊熵特征可以删除以下两行
option.Fuzdim = 2;
option.Fuzr   = 0.15;
option.Fuzn   = 2;
% 设置排列熵参数，Pedim为排列熵模式维度，Pet为排列熵的时间延迟，如果不提取排列熵特征可以删除以下两行
option.Pedim = 6;
option.Pet   = 1;
% 调用genFeature函数，完成特征提取，算出的特征值会保存在fea变量里
fea18 = genFeatureEn(z18,featureNamesCell,option); 
%提取非线性特征（7个添加到特征向量）
PSDE18=fea18(1,1);     %功率谱熵
SVDPE18=fea18(1,2);    %奇异谱熵
EE18=fea18(1,3);       %能量熵
APE18=fea18(1,4);      %近似熵
SE18=fea18(1,5);       %样本熵
FE18=fea18(1,6);       %模糊熵
PE18=fea18(1,7);       %排列熵

%构建18个信号通道的特征向量（每个通道的信号提取12个时域，5个频域以及7个非线性特征，即每个通道信号表征成24维向量）
fv1=[MA1,MI1,ME1,PK1,ST1,KU1,SK1,RM1,S1,C1,I1,L1,FC1,MSF1,RMSF1,VF1,RVF1,PSDE1,SVDPE1,EE1,APE1,SE1,FE1,PE1];
fv2=[MA2,MI2,ME2,PK2,ST2,KU2,SK2,RM2,S2,C2,I2,L2,FC2,MSF2,RMSF2,VF2,RVF2,PSDE2,SVDPE2,EE2,APE2,SE2,FE2,PE2];
fv3=[MA3,MI3,ME3,PK3,ST3,KU3,SK3,RM3,S3,C3,I3,L3,FC3,MSF3,RMSF3,VF3,RVF3,PSDE3,SVDPE3,EE3,APE3,SE3,FE3,PE3];
fv4=[MA4,MI4,ME4,PK4,ST4,KU4,SK4,RM4,S4,C4,I4,L4,FC4,MSF4,RMSF4,VF4,RVF4,PSDE4,SVDPE4,EE4,APE4,SE4,FE4,PE4];
fv5=[MA5,MI5,ME5,PK5,ST5,KU5,SK5,RM5,S5,C5,I5,L5,FC5,MSF5,RMSF5,VF5,RVF5,PSDE5,SVDPE5,EE5,APE5,SE5,FE5,PE5];
fv6=[MA6,MI6,ME6,PK6,ST6,KU6,SK6,RM6,S6,C6,I6,L6,FC6,MSF6,RMSF6,VF6,RVF6,PSDE6,SVDPE6,EE6,APE6,SE6,FE6,PE6];
fv7=[MA7,MI7,ME7,PK7,ST7,KU7,SK7,RM7,S7,C7,I7,L7,FC7,MSF7,RMSF7,VF7,RVF7,PSDE7,SVDPE7,EE7,APE7,SE7,FE7,PE7];
fv8=[MA8,MI8,ME8,PK8,ST8,KU8,SK8,RM8,S8,C8,I8,L8,FC8,MSF8,RMSF8,VF8,RVF8,PSDE8,SVDPE8,EE8,APE8,SE8,FE8,PE8];
fv9=[MA9,MI9,ME9,PK9,ST9,KU9,SK9,RM9,S9,C9,I9,L9,FC9,MSF9,RMSF9,VF9,RVF9,PSDE9,SVDPE9,EE9,APE9,SE9,FE9,PE9];
fv10=[MA10,MI10,ME10,PK10,ST10,KU10,SK10,RM10,S10,C10,I10,L10,FC10,MSF10,RMSF10,VF10,RVF10,PSDE10,SVDPE10,EE10,APE10,SE10,FE10,PE10];
fv11=[MA11,MI11,ME11,PK11,ST11,KU11,SK11,RM11,S11,C11,I11,L11,FC11,MSF11,RMSF11,VF11,RVF11,PSDE11,SVDPE11,EE11,APE11,SE11,FE11,PE11];
fv12=[MA12,MI12,ME12,PK12,ST12,KU12,SK12,RM12,S12,C12,I12,L12,FC12,MSF12,RMSF12,VF12,RVF12,PSDE12,SVDPE12,EE12,APE12,SE12,FE12,PE12];
fv13=[MA13,MI13,ME13,PK13,ST13,KU13,SK13,RM13,S13,C13,I13,L13,FC13,MSF13,RMSF13,VF13,RVF13,PSDE13,SVDPE13,EE13,APE13,SE13,FE13,PE13];
fv14=[MA14,MI14,ME14,PK14,ST14,KU14,SK14,RM14,S14,C14,I14,L14,FC14,MSF14,RMSF14,VF14,RVF14,PSDE14,SVDPE14,EE14,APE14,SE14,FE14,PE14];
fv15=[MA15,MI15,ME15,PK15,ST15,KU15,SK15,RM15,S15,C15,I15,L15,FC15,MSF15,RMSF15,VF15,RVF15,PSDE15,SVDPE15,EE15,APE15,SE15,FE15,PE15];
fv16=[MA16,MI16,ME16,PK16,ST16,KU16,SK16,RM16,S16,C16,I16,L16,FC16,MSF16,RMSF16,VF16,RVF16,PSDE16,SVDPE16,EE16,APE16,SE16,FE16,PE16];
fv17=[MA17,MI17,ME17,PK17,ST17,KU17,SK17,RM17,S17,C17,I17,L17,FC17,MSF17,RMSF17,VF17,RVF17,PSDE17,SVDPE17,EE17,APE17,SE17,FE17,PE17];
fv18=[MA18,MI18,ME18,PK18,ST18,KU18,SK18,RM18,S18,C18,I18,L18,FC18,MSF18,RMSF18,VF18,RVF18,PSDE18,SVDPE18,EE18,APE18,SE18,FE18,PE18];

%一个18通道样本信号的总特征向量
ss=[fv1,fv2,fv3,fv4,fv5,fv6,fv7,fv8,fv9,fv10,fv11,fv12,fv13,fv14,fv15,fv16,fv17,fv18];

 %  figure();
%  bar(ss);
 end
 
