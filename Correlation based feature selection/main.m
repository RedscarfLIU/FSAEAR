clear;
clc;
rng=[0 1 79 1];%ѵ�� rng=[r1 c1 r2 c2]�����ȡǰ��ѵ����������б�ǩ��csv�ļ�������ʼĩ��
train_label=csvread('./training/REFERENCE.csv',0,1,rng);%��ȡ��б�ǩ,�õ���ǩ����train_label
for i=1:length(train_label)
    if train_label(i)<0
        train_label(i)=-1;
    end
end
figure();
subplot(211);
bar(train_label);%�����������ݵ���ȷ�����ǩ
train_data=[];   %�������ݾ���train_data
%�Ե���ѵ���������ݽ���24*18��������ȡ���ܹ�80����������˹����õ�80��24*18�е���������train_data
for i=1:9
    ss=feature_extraction(strcat('./training/a000',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
for i=10:80
    ss=feature_extraction(strcat('./training/a00',num2str(i),'.xlsx'));
    train_data=[train_data;ss];
end
%�ź�����ѡ��
%������һ���ź�������18ͨ���ϵ������Ӽ�
feaSet1={'MA1','MI1','ME1','PK1','ST1','KU1','SK1','RM1','S1','C1','I1','L1','FC1','MSF1','RMSF1','VF1','RVF1','PSDE1','SVDPE1','EE1','APE1','SE1','FE1','PE1'};
feaSet2={'MA2','MI2','ME2','PK2','ST2','KU2','SK2','RM2','S2','C2','I2','L2','FC2','MSF2','RMSF2','VF2','RVF2','PSDE2','SVDPE2','EE2','APE2','SE2','FE2','PE2'};
feaSet3={'MA3','MI3','ME3','PK3','ST3','KU3','SK3','RM3','S3','C3','I3','L3','FC3','MSF3','RMSF3','VF3','RVF3','PSDE3','SVDPE3','EE3','APE3','SE3','FE3','PE3'};
feaSet4={'MA4','MI4','ME4','PK4','ST4','KU4','SK4','RM4','S4','C4','I4','L4','FC4','MSF4','RMSF4','VF4','RVF4','PSDE4','SVDPE4','EE4','APE4','SE4','FE4','PE4'};
feaSet5={'MA5','MI5','ME5','PK5','ST5','KU5','SK5','RM5','S5','C5','I5','L5','FC5','MSF5','RMSF5','VF5','RVF5','PSDE5','SVDPE5','EE5','APE5','SE5','FE5','PE5'};
feaSet6={'MA6','MI6','ME6','PK6','ST6','KU6','SK6','RM6','S6','C6','I6','L6','FC6','MSF6','RMSF6','VF6','RVF6','PSDE6','SVDPE6','EE6','APE6','SE6','FE6','PE6'};
feaSet7={'MA7','MI7','ME7','PK7','ST7','KU7','SK7','RM7','S7','C7','I7','L7','FC7','MSF7','RMSF7','VF7','RVF7','PSDE7','SVDPE7','EE7','APE7','SE7','FE7','PE7'};
feaSet8={'MA8','MI8','ME8','PK8','ST8','KU8','SK8','RM8','S8','C8','I8','L8','FC8','MSF8','RMSF8','VF8','RVF8','PSDE8','SVDPE8','EE8','APE8','SE8','FE8','PE8'};
feaSet9={'MA9','MI9','ME9','PK9','ST9','KU9','SK9','RM9','S9','C9','I9','L9','FC9','MSF9','RMSF9','VF9','RVF9','PSDE9','SVDPE9','EE9','APE9','SE9','FE9','PE9'};
feaSet10={'MA10','MI10','ME10','PK10','ST10','KU10','SK10','RM10','S10','C10','I10','L10','FC10','MSF10','RMSF10','VF10','RVF10','PSDE10','SVDPE10','EE10','APE10','SE10','FE10','PE10'};
feaSet11={'MA11','MI11','ME11','PK11','ST11','KU11','SK11','RM11','S11','C11','I11','L11','FC11','MSF11','RMSF11','VF11','RVF11','PSDE11','SVDPE11','EE11','APE11','SE11','FE11','PE11'};
feaSet12={'MA12','MI12','ME12','PK12','ST12','KU12','SK12','RM12','S12','C12','I12','L12','FC12','MSF12','RMSF12','VF12','RVF12','PSDE12','SVDPE12','EE12','APE12','SE12','FE12','PE12'};
feaSet13={'MA13','MI13','ME13','PK13','ST13','KU13','SK13','RM13','S13','C13','I13','L13','FC13','MSF13','RMSF13','VF13','RVF13','PSDE13','SVDPE13','EE13','APE13','SE13','FE13','PE13'};
feaSet14={'MA14','MI14','ME14','PK14','ST14','KU14','SK14','RM14','S14','C14','I14','L14','FC14','MSF14','RMSF14','VF14','RVF14','PSDE14','SVDPE14','EE14','APE14','SE14','FE14','PE14'};
feaSet15={'MA15','MI15','ME15','PK15','ST15','KU15','SK15','RM15','S15','C15','I15','L15','FC15','MSF15','RMSF15','VF15','RVF15','PSDE15','SVDPE15','EE15','APE15','SE15','FE15','PE15'};
feaSet16={'MA16','MI16','ME16','PK16','ST16','KU16','SK16','RM16','S16','C16','I16','L16','FC16','MSF16','RMSF16','VF16','RVF16','PSDE16','SVDPE16','EE16','APE16','SE16','FE16','PE16'};
feaSet17={'MA17','MI17','ME17','PK17','ST17','KU17','SK17','RM17','S17','C17','I17','L17','FC17','MSF17','RMSF17','VF17','RVF17','PSDE17','SVDPE17','EE17','APE17','SE17','FE17','PE17'};
feaSet18={'MA18','MI18','ME18','PK18','ST18','KU18','SK18','RM18','S18','C18','I18','L18','FC18','MSF18','RMSF18','VF18','RVF18','PSDE18','SVDPE18','EE18','APE18','SE18','FE18','PE18'};
%һ���ź��������ܵ��������ϣ�cell���飩
feature=[feaSet1 feaSet2 feaSet3 feaSet4 feaSet5 feaSet6 feaSet7 feaSet8 feaSet9 feaSet10 feaSet11 feaSet12 feaSet13 feaSet14 feaSet15 feaSet16 feaSet17 feaSet18];  
index=corrSel(train_data,train_label); %��ҪԤ�����Ӵ�С���ֲ�ͬ��СƤ��ѷ�����ȵ��������ڵ�feature����λ��
selected_features=feature(:,index);    %feature�����в�ͬ��������ҪԤ������Ƥ��ѷ�����ȴӴ�С����
%feature�����в�ͬ������ҪԤ������Ƥ��ѷ�����ȴӴ�С����
B=zeros(1, size(train_data,2));  %zeros(m,n)����һ��m*n�������,m��n��,size(data,2)���ؾ���data������.B�ǲ�ͬ������ҪԤ������Ƥ��ѷ�����ȵ�����
for i=1:size(train_data,2)
    switch isnan(abs(corr(train_data(:,i), train_label)))  %isnan�ж�data��i����label��֮��Ƥ��ѷ�����(corr)�ľ���ֵ(abs)�Ƿ�NaN(not a number),�Ƿ���1,�񷵻�0
        case 1
            B(i)=0;
        otherwise 
            B(i)=abs(corr(train_data(:,i), train_label));
    end
end
sortedB=sort(B,'descend'); 
%����ѡ�������Ҳ๤������selected_features���ź������ı�ѡ�����ԵĽ������򣩺�sortedB���ź�������ҪԤ������Ƥ��ѷ�����ȵĽ�������
