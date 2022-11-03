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

%�����ź��˲�����
%��׼�ȥ����Ⱥֵ(������ȥ����Ⱥֵ���˲���
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

%��λ���˲�,�ƶ���λ�������ڳ���Ϊ3
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

%һ��18ͨ�������źŵ�1ͨ����������ȡ
%��ȡʱ��������12����ӵ�����������
SK1 = skewness(z1);                %ƫ��

%һ��18ͨ�������źŵ�3ͨ����������ȡ
%��ȡʱ��������12����ӵ�����������
MA3 = max(z3); 			        %���ֵ
MI3 = min(z3); 			        %��Сֵ	
PK3 = MA3-MI3;			                %��-��ֵ
AV3 = mean(abs(z3));		        %����ֵ��ƽ��ֵ(����ƽ��ֵ)�����㵫�ǲ���ӵ�������������Ϊ�ڱ�Ӧ�ó�����ƽ��ֵһ����
ST3 = std(z3);			            %��׼��
RM3 = rms(z3);			            %������
S3 = RM3./AV3;			                %��������
C3 = PK3./RM3;                         %��ֵ����
I3 = PK3./AV3;                         %��������
L3 = PK3./mean(sqrt(abs(z3))).^2;	%ԣ������
%����genFeature�������������������ֵ
featureNamesCell = {'svdpE'}; %Ҫ����������ȡ���������ƣ����Ը���ʵ����Ҫ����ɾ�������µ�����ע��ƴд��ȷ
% ����ֵ�ֽ�Ĵ��ڳ��ȣ���������������أ����д������ɾ��
option.svdpEn = 60; 
% ����genFeature���������������ȡ�����������ֵ�ᱣ����fea������
fea3 = genFeatureEn(z3,featureNamesCell,option); 
%��ȡ������������7����ӵ�����������
SVDPE3=fea3(1,1);    %��������


%һ��18ͨ�������źŵ�5ͨ����������ȡ
%��ȡʱ��������12����ӵ�����������
MA5 = max(z5); 			        %���ֵ
MI5 = min(z5); 			        %��Сֵ	
PK5 = MA5-MI5;			                %��-��ֵ
AV5 = mean(abs(z5));		        %����ֵ��ƽ��ֵ(����ƽ��ֵ)�����㵫�ǲ���ӵ�������������Ϊ�ڱ�Ӧ�ó�����ƽ��ֵһ����
ST5 = std(z5);			            %��׼��
RM5 = rms(z5);			            %������
S5 = RM5./AV5;			                %��������
C5 = PK5./RM5;                         %��ֵ����
I5 = PK5./AV5;                         %��������
L5 = PK5./mean(sqrt(abs(z5))).^2;	%ԣ������
%����genFeature�������������������ֵ
featureNamesCell = {'svdpE','ApEn'}; %Ҫ����������ȡ���������ƣ����Ը���ʵ����Ҫ����ɾ�������µ�����ע��ƴд��ȷ
% ����ֵ�ֽ�Ĵ��ڳ��ȣ���������������أ����д������ɾ��
option.svdpEn = 60; 
% ���ý����ز�����ApdimΪ�����ص�ģʽά�ȣ�AprΪ�����ص���ֵ���������ȡ��������������ɾ����������
option.Apdim  = 2;
option.Apr   = 0.15;
% ����genFeature���������������ȡ�����������ֵ�ᱣ����fea������
fea5 = genFeatureEn(z5,featureNamesCell,option); 
%��ȡ������������7����ӵ�����������
SVDPE5=fea5(1,1);    %��������
APE5=fea5(1,2);      %������

%һ��18ͨ�������źŵ�6ͨ����������ȡ
%��ȡʱ��������12����ӵ�����������
MA6 = max(z6); 			        %���ֵ
MI6 = min(z6); 			        %��Сֵ	
PK6 = MA6-MI6;			                %��-��ֵ
AV6 = mean(abs(z6));		        %����ֵ��ƽ��ֵ(����ƽ��ֵ)�����㵫�ǲ���ӵ�������������Ϊ�ڱ�Ӧ�ó�����ƽ��ֵһ����
ST6 = std(z6);			            %��׼��
RM6 = rms(z6);			            %������
S6 = RM6./AV6;			                %��������
C6 = PK6./RM6;                         %��ֵ����
I6 = PK6./AV6;                         %��������
L6 = PK6./mean(sqrt(abs(z6))).^2;	  %ԣ������
%����genFeature�������������������ֵ
featureNamesCell = {'svdpE'}; %Ҫ����������ȡ���������ƣ����Ը���ʵ����Ҫ����ɾ�������µ�����ע��ƴд��ȷ
% ����ֵ�ֽ�Ĵ��ڳ��ȣ���������������أ����д������ɾ��
option.svdpEn = 60; 
% ����genFeature���������������ȡ�����������ֵ�ᱣ����fea������
fea6 = genFeatureEn(z6,featureNamesCell,option); 
%��ȡ������������7����ӵ�����������
SVDPE6=fea6(1,1);    %��������

%һ��18ͨ�������źŵ�14ͨ����������ȡ
%��ȡʱ��������12����ӵ�����������
ST14 = std(z14);			            %��׼��

%һ��18ͨ�������źŵ�15ͨ����������ȡ
%��ȡʱ��������12����ӵ�����������
SK15 = skewness(z15);                %ƫ��
%����genFeature�������������������ֵ
featureNamesCell = {'SpEn'}; %Ҫ����������ȡ���������ƣ����Ը���ʵ����Ҫ����ɾ�������µ�����ע��ƴд��ȷ
% ���������ز�����SpdimΪ�����ص�ģʽά�ȣ�SprΪ�����ص���ֵ���������ȡ��������������ɾ����������
option.Spdim  = 2;
option.Spr   = 0.15;
% ����genFeature���������������ȡ�����������ֵ�ᱣ����fea������
fea15 = genFeatureEn(z15,featureNamesCell,option); 
%��ȡ������������7����ӵ�����������
SE15=fea15(1,1);       %������

%һ��18ͨ�������źŵ�16ͨ����������ȡ
%��ȡʱ��������12����ӵ�����������
MA16 = max(z16); 			        %���ֵ
MI16 = min(z16); 			        %��Сֵ	
ME16 = mean(z16); 			        %ƽ��ֵ
RM16 = rms(z16);			            %������
%����genFeature�������������������ֵ
featureNamesCell = {'ApEn'}; %Ҫ����������ȡ���������ƣ����Ը���ʵ����Ҫ����ɾ�������µ�����ע��ƴд��ȷ
% ���ý����ز�����ApdimΪ�����ص�ģʽά�ȣ�AprΪ�����ص���ֵ���������ȡ��������������ɾ����������
option.Apdim  = 2;
option.Apr   = 0.15;
% ����genFeature���������������ȡ�����������ֵ�ᱣ����fea������
fea16 = genFeatureEn(z16,featureNamesCell,option); 
%��ȡ������������7����ӵ�����������
APE16=fea16(1,1);      %������

%һ��18ͨ�������źŵ�17ͨ����������ȡ
%��ȡʱ��������12����ӵ�����������
ST17 = std(z17);			            %��׼��
KU17 = kurtosis(z17);		        %�Ͷ�

%һ��18ͨ�������źŵ�18ͨ����������ȡ
%��ȡʱ��������12����ӵ�����������
MA18 = max(z18); 			        %���ֵ
ME18 = mean(z18); 			        %ƽ��ֵ
KU18 = kurtosis(z18);		        %�Ͷ�
RM18 = rms(z18);			            %������

%����18���ź�ͨ��������(TOP37)
fv1=[SK1];
fv3=[PK3,ST3,S3,C3,I3,L3,SVDPE3]; 
fv5=[PK5,ST5,S5,C5,I5,L5,SVDPE5,APE5];
fv6=[PK6,ST6,S6,C6,I6,L6,SVDPE6];
fv14=[ST14];
fv15=[SK15,SE15];
fv16=[MA16,MI16,ME16,RM16,APE16];
fv17=[ST17,KU17]; 
fv18=[MA18,ME18,KU18,RM18];

%һ��18ͨ�������źŵ�����������
ss=[fv1,fv3,fv5,fv6,fv14,fv15,fv16,fv17,fv18]; 

%����18���ź�ͨ��������(TOP9)
%fv1=[SK1];
%fv3=[SVDPE3]; 
%fv5=[APE5];
%fv6=[PK6];
%fv16=[MA16,MI16,ME16,RM16];
%fv18=[KU18];

%һ��18ͨ�������źŵ�����������
%ss=[fv1,fv3,fv5,fv6,fv16,fv18]; 

 end
 
