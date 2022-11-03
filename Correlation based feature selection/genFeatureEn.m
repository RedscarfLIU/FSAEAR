function fea = genFeatureEn(data,featureNamesCell,options)

rng('default')
data = data';
[len,num] = size(data); %��ȡ���ݳߴ磬���ݳ���/��������
if len == 1  %һά�������з����������
    data = data';
    [len,num] = size(data); %��ȡ���ݳߴ磬���ݳ���/��������
end
allFeaNames = {'psdE','svdpE','eE','ApEn', 'SpEn','FuzzyEn','PeEn','enveEn'}; %������������

%% 1.��Ϣ��
% 1.1 ��������
psdE=zeros(1,num);%��ʼ��
if sum(contains(featureNamesCell,{'psdE'}))
    psdE = kPowerSpectrumEntropy(data);
end
% 1.2 ��������
svdpE =zeros(1,num);%��ʼ��
if sum(contains(featureNamesCell,{'svdpE'}))
    if ~exist('options.svdpEn') %���δ���봰��ֵ���������ݳ��ȵ�1/2ȡֵ
        options.svdpEn = round(0.5*(len));
    end
    svdpE = kSingularSpectrumEntropy(data,options.svdpEn);
end
% 1.3 ������
eE = zeros(1,num);%��ʼ��
if sum(contains(featureNamesCell,{'eE'}))
    eE = kEnergyEntropy(data);
end
allTimeFea = [psdE;svdpE;eE];
%% 2.������ָ��
ApEn = zeros(1,num);%��ʼ��
if sum(contains(featureNamesCell,{'ApEn'}))
     if num == 1
         ApEn = kApproximateEntropy(data, options.Apdim, options.Apr);  %һά����
    else
        for i = 1:num
            ApEn(i) = kApproximateEntropy(data(:,i), options.Apdim, options.Apr);  %��ά����
        end
    end

end
allTimeFea = [allTimeFea;ApEn];

%% 3.������ָ��
SpEn = zeros(1,num);%��ʼ��
if sum(contains(featureNamesCell,{'SpEn'}))
     if num == 1
         SpEn = kSampleEn(data, options.Spdim, options.Spr);  %һά����
    else
        for i = 1:num
            SpEn(i) = kSampleEn(data(:,i), options.Spdim, options.Spr);    %��ά����
        end
    end

end
allTimeFea = [allTimeFea;SpEn];

%% 4.ģ����ָ��
FuzzyEn = zeros(1,num);%��ʼ��
if sum(contains(featureNamesCell,{'FuzzyEn'}))
    if num == 1
        FuzzyEn = kFuzzyEntropy(data,options.Fuzdim,options.Fuzr,options.Fuzn);  %һά����
    else
        for i = 1:num
            FuzzyEn(i) = kFuzzyEntropy(data(:,i),options.Fuzdim,options.Fuzr,options.Fuzn);  %��ά����
        end
    end
end
allTimeFea = [allTimeFea;FuzzyEn];

%% 5.������ָ��
PeEn = zeros(1,num);%��ʼ��
if sum(contains(featureNamesCell,{'PeEn'}))
     if num == 1
         PeEn = kPermutationEntropy(data, options.Pedim, options.Pet);  %һά����
     else
        for i = 1:num
            PeEn(i) = kPermutationEntropy(data(:,i), options.Pedim, options.Pet);  %��ά����
        end
     end
end
allFea = [allTimeFea;PeEn];
%% 6.������ָ��
enveEn = zeros(1,num);%��ʼ��
if sum(contains(featureNamesCell,{'enveEn'}))
     if num == 1
         enveEn = kEnvelopeEntropy(data,options.fs);  %һά����
     else
        for i = 1:num
            enveEn(i) = kEnvelopeEntropy(data(:,i),options.fs);  %��ά����
        end
     end
end
allFea = [allTimeFea;PeEn];
%% end.���������fea��ֵ
fea = [];
for i = 1:length(featureNamesCell)
    %featureNamesCell{i} == allFeaNames;
    try
    if find(contains(allFeaNames,featureNamesCell{i})) %�����ǰ�����������б���
        fea = [fea;allFea(find(strcmp(allFeaNames,featureNamesCell{i})),:)];
    end
    catch ME 
    end
end

fea = fea';

end

function ie = kInformationEntopy(sig,SegmentNum)
% �����źŵ���Ϣ��
% �ο������ô�ʽ���ͻ��й�Զ�̹������ϵͳ��
% ���룺
% sig�������ź�
% SegmentNum�������������������룬���Զ�ʹ��˹�ظ�˹��Sturges�����鹫ʽ���㡣
% �����
% ie����Ϣ�������
[len,num] = size(sig);
if num >= 2
    SigLen = len;  %�����źų���
    if nargin == 1
        SegmentNum = round(1.87*(SigLen-1)^(2/5));  %˹�ظ�˹��Sturges���ľ��鹫ʽ������ѷ�����
    end
    CutLen = SigLen/SegmentNum; %ÿ���źų���
    Ent = [];
    for i = 1:SegmentNum
        Ent = [Ent;sum(sig(round(CutLen*(i-1)+1):round(CutLen*i),:),1)];  %��ÿ���źŵ�������
    end
    pk = Ent./sum(Ent,2); %��k������ռ��������С
    ie = -sum(pk.*log(pk)); %��Ϣ�ع�ʽ
end 
if num == 1
    
    [SigLen,~] = size(sig);  %�����źų���
    if nargin == 1
        SegmentNum = round(1.87*(SigLen-1)^(2/5));  %˹�ظ�˹��Sturges���ľ��鹫ʽ������ѷ�����
    end
    CutLen = SigLen/SegmentNum; %ÿ���źų���
    for i = 1:SegmentNum
        Ent(i) = sum(sig(round(CutLen*(i-1)+1):round(CutLen*i)));  %��ÿ���źŵ�������
    end
    pk = Ent/sum(Ent); %��k������ռ��������С
    ie = -sum(pk.*log(pk)); %��Ϣ�ع�ʽ
end
end
function svdpE = kSingularSpectrumEntropy(data,n)
% ���źŵ���������
% �ο������ô�ʽ���ͻ��й�Զ�̹������ϵͳ��
% ���룺
% data���������ź�
% n�����ڳ��ȣ�ע�⣺2<=n<=lenght(data)-1
% �����
% svdpE����������ֵ
% data = data(:)'; %ǿ��ת��Ϊ������
% if nargin == 1
%     n = round(sqrt(length(data)));  %˹�ظ�˹��Sturges���ľ��鹫ʽ������ѷ�����
% end
[len,num] = size(data);
m = len - n - 1; %����A������
svdpE = []; 
for j = 1:num
    A = []; %��ʼ��
    for i = 1:m
        A = [A;data(i:i+len-m,j)'];
    end

    svdVal = svd(A); %������ֵ

    svdpE(j) = kInformationEntopy(svdVal,length(svdVal));  %�������ء��������������ݳ��ȡ�
end
end
function psdE = kPowerSpectrumEntropy(data)
% ���źŵĹ�������
% ������ʹ������ͼ������õ�
% �ο������ô�ʽ���ͻ��й�Զ�̹������ϵͳ��
% ���룺
% data���������ź�
% �����
% psdE����������ֵ
[len,num] = size(data);
psdE = []; 
for j = 1:num
    [pxx] = periodogram(data(:,j)); %����ͼ��������
    [len,~] = size(pxx);
    psdE(j) = kInformationEntopy( pxx,len);
end


end
function eE = kEnergyEntropy(data)
% ���źŻ���emd�ֽ��㷨��������
% �ο�������������в���������㷨���о���ʵ�֡�
% ���룺
% data���������ź�
% �����
% eE��������ֵ

% ��Ҫʹ��MATLAB2018a�����°汾
[len,num] = size(data);
for i = 1:num
    imf = emd(data(:,i));
    imfE = sum(imf.^2,2);
    eE(i) = kInformationEntopy(imfE,length(imfE));  %�������ء��������������ݳ��ȡ�
end
end


function ApEn = kApproximateEntropy(data, dim, r)
%  ���������(ApEn)��������������ApproximateEntropy�����������޸�
%  ���룺
%  data  - ���������ݣ���Ҫ��һά����
%  dim - ģʽά��
%  r  -  ��ֵ��С��һ��ѡ��r=0.1~0.25��������������ApproximateEntropy��Ҫ�ٳ���data���ݵı�׼���������Ҫ��ֻ������0.1-0.25������ּ��ɣ�
%  �����
%  ApEn��������ֵ��С
%  (����������ApproximateEntropy����һ������������tau���˺����в����н�������ɾȥ�ò���)
%  ���ģ�Pincus S M . Approximate entropy as a measure of system complexity[J]. Proceedings of the National Academy of Sciences ,1991,88(6):2297��2301.


data = data(:);  %ǿ��ת������Ϊ�з���
N = length(data); %��ȡ���ݳ���
phi = zeros(1,2); %��ʼ������
r = r*std(data);%��r��ֵ��ֵΪ���ʳ������ݱ�׼��

for j = 1:2
    m = dim+j-1;  %����ѭ���ֱ�ֵά��Ϊm��m+1
    C = zeros(1,N-m+1);    %Cֵ��ʼ��������������ApproximateEntropy�д�ֵ����Ϊphi�������۲���Ӧ�����޸�ΪC
    dataMat = zeros(m,N-m+1);    %��ʼ��
    for i = 1:m
        dataMat(i,:) = data(i:N-m+i); %��������ָ��ά���µ���������
    end    
    % counting similar patterns using distance calculation
    for i = 1:N-m+1
        tempMat = abs(dataMat - repmat(dataMat(:,i),1,N-m+1));  %��������X(i)��X(j)����ϣ�������˵������ľ���ֵ
        boolMat = any( (tempMat > r),1);  %���X(j)�Ķ�Ӧ�˵㶼�����޷�Χ�ڣ�����Ϊ2ά��������X(i)��X(j)��ģʽ��r�½��ƣ��������ҵ��г������޵���ϣ�����һ��ȡ�ǣ�����Եõ��������������
        C(i) = sum(~boolMat)/(N-m+1);   %�˴˲�ȡ�ǣ���~�������Եõ�������ֵ�����ڵ�����
    end
    % summing over the counts
    phi(j) = sum(log(C))/(N-m+1);  %����������ApproximateEntropy�д�ֵ����Ϊresult��Ϊ�������۱���һ�£���������Ϊphi
end
ApEn = phi(1)-phi(2);   
end

function kSampleEnValue = kSampleEn(data, dim, r)
% ����data���е�������
% ���룺
% data��һά����
% dim���ع�ά����һ��ѡ��1��2������ѡ��2��һ�㲻ȡm>2
% r����ֵ��С��һ��ѡ��r=0.1~0.25��������������SampEn��Ҫ�ٳ���data���ݵı�׼���������Ҫ��ֻ������0.1-0.25������ּ��ɣ�
% �����
% kSampleEnValue��������ֵ��С
% ���ģ�Richman J S, Moorman J R. Physiological time-series analysis using approximate entropy and sample entropy[J]. American Journal of Physiology-Heart and Circulatory Physiology, 2000.


data = data(:);  %ǿ��ת������Ϊ�з���
N = length(data); %��ȡ���ݳ���
phi = zeros(1,2); %��ʼ������
r = r*std(data); %��r��ֵ��ֵΪ���ʳ������ݱ�׼��

for j = 1:2
    m = dim+j-1;  %������ѭ���ֱ�ֵά��Ϊm��m+1
    B = zeros(1,N-m+1);    %Bֵ��ʼ������������ά��Ϊm��m+1ʱ�ñ�����Ӧ�÷ֱ�ΪB��A�����Ǵ����������ͳһʹ��B��ʾ
    dataMat = zeros(m,N-m+1);    %��ʼ��
    for i = 1:m
        dataMat(i,:) = data(i:N-m+i); %��������ָ��ά���µ���������
    end    
    for i = 1:N-m
        tempMat = abs(dataMat - repmat(dataMat(:,i),1,N-m+1));  %��������X(i)��X(j)����ϣ�������˵������ľ���ֵ����ʱ������i=j�������Ҫ��������2�е�λ�ü�����������ļ���
        boolMat = any( (tempMat > r),1);  %���X(j)�Ķ�Ӧ�˵㶼�����޷�Χ�ڣ�����Ϊ2ά��������X(i)��X(j)��ģʽ��r�½��ƣ��������ҵ��г������޵���ϣ�����һ��ȡ�ǣ�����Եõ��������������
        B(i) = (sum(~boolMat)-1)/(N-m-1);   %�˲�ȡ�ǣ���~�������Եõ�������ֵ�����ڵ�������ע������ϼ�����1��Ҫ����i=j�����
    end
    phi(j) = sum(B)/(N-m);  %�������۴˴�������ӦΪBm��Am��Ϊ�˼��ͳһ����Ϊphi
end
kSampleEnValue = log(phi(1))-log(phi(2));    
end

function FuzEn = kFuzzyEntropy(data,dim,r,n)
% ����ģ���أ�������FuzzyEntropy.m�������޸Ĳ�ע��
% ���룺
% data��һά����
% dim���ع�ά����һ��ѡ��1��2������ѡ��2��һ�㲻ȡm>2
% r����ֵ��С��һ��ѡ��r=0.1~0.25��������������SampEn��Ҫ�ٳ���data���ݵı�׼���������Ҫ��ֻ������0.1-0.25������ּ��ɣ�
% n��Ȩ�أ�ȡ��С����������2����3���Ƽ�����Ϊ2
% �����
% FuzEn��ģ����ֵ��С

% ���ģ�Chen W , Wang Z , Xie H , et al. Characterization of Surface EMG Signal Based on Fuzzy Entropy[J]. IEEE Transactions on Neural Systems and Rehabilitation Engineering, 2007, 15(2):266-272.


data = data(:)';  %ǿ��ת������Ϊ������
N = length(data); %���ݳ���
phi = zeros(1,2); %��ʼ������
r = r*std(data); %��r��ֵ��ֵΪ���ʳ������ݱ�׼��

for m = dim:dim+1
    count = zeros(N-m+1,1);    %��ʼ��
    dataMat = zeros(N-m+1,m);  %��ʼ��
    
    % �������ݾ��󣬹����mά��ʸ��
    for i = 1:N-m+1
        dataMat(i,:) = data(1,i:i+m-1)-mean(data(1,i:i+m-1));  %%���ж���
    end
    % ���þ����������ģʽ��
    for j = 1:N-m+1
        % �����б�ѩ����룬��������ƥ�����
        tempmat=repmat(dataMat(j,:),N-m+1,1);
        dist = max(abs(dataMat - tempmat),[],2); %��������X(i)��X(j)����ϣ�������˵������ľ���ֵ�����ֵ
        D=exp(-(dist.^n)/r);                     %ģ��������
        count(j) = (sum(D)-1)/(N-m-1);           %��һ����ͷ����ڵĲ��֣�ע������м�1��Ϊ�˼���i=j����������ֵ
    end
    phi(m-dim+1) = sum(count)/(N-m);            
end
    % ����õ���ģ����ֵ
    FuzEn = log(phi(1)/phi(2));                  
end


function pe = kPermutationEntropy(data,m,t)
% ���������أ�������PermutationEntropy.m�������޸Ĳ�ע��
% ���룺
% data��һά����
% dim���ع�ά�����Ƽ�ֵΪ3~7������ܹ����ܳ�������ʱ��ã����Խ�m���õþ�����һЩ��
% t��ʱ���ӳ٣�ȡ����������Ϊ1������϶ࡣ
% �����
% pe������ֵ��С

% ���ģ�Bandt C��Pompe B. Permutation entropy:a natural complexity measure for time series[J]. Physical Review Letters,2002,88(17):174102.


data = data(:);  %ǿ��ת������Ϊ�з���
N = length(data);  %���ݳ���
permlist = perms(1:m);  %�г�mά�������п��ܵ�����
[h,~]=size(permlist);   %�������е�������h=m!
c(1:length(permlist))=0;  %������ʼ����c���ڴ���������������

 for j=1:N-t*(m-1)  %��ʼѭ����ע��ð�ź�Ϊѭ����������
     [~,iv(j,:)]=sort(data(j:t:j+t*(m-1))); %%����ʹ�õ���֪�������еڶ�����ⷽʽ�������е����֣�
     for jj=1:h
         if (abs(permlist(jj,:)-iv(j,:)))==0  %���������������permlist������ͬ�����¼�ڱ���c�Ķ�Ӧλ�õ��У�ÿ��һ����Ӧλ�ü�����һ
             c(jj) = c(jj) + 1 ; %���������������permlist������ͬ�����¼�ڱ���c�Ķ�Ӧλ�õ��У�ÿ��һ����Ӧλ�ü�����һ
         end
     end
 end
c=c(c~=0);  %�޳�c�е�0��
p = c/sum(c); %%
pe = -sum(p .* log2(p));%
% ��һ��
pe=pe/log2(factorial(m));%
end

function enveEn = kEnvelopeEntropy(data,fs)
% ���������
% ���룺
% data��һά����
% fs������Ƶ�ʣ�����Ƶ�ʼ�ÿ���Ӳɼ������ݵ���������ʵ���������
% �����
% enveEn��������ֵ

% ���ġ�����Ӧ�������ͶȽ�������������������ڹ�������е�Ӧ�á�

% ��ͨ�˲�
data = data(:);
ba = [fs*1/4,fs*3/8];  %��ͨ�˲�����MATLAB�Ƽ�ֵ��
b = fir1(50,[ba(1) ba(2)]/(fs/2));  %��ͨ�˲�������Ĭ��50��
data = bsxfun(@minus,data,mean(data,1));  %ȥ��ֱ������
xBandPass = conv2(data,b(:),'same');  % ���д�ͨ�˲�

% ���������
xAn = hilbert(xBandPass);  %ϣ�����ر任
xEnv = abs(xAn);           %��ģ��������ֵ

% ���������
pj = xEnv./sum(xEnv); %�����ع�һ��
enveEn = -sum(pj.*log(pj));
end