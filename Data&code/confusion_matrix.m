clear;
close all;
clc

% 混淆矩阵
mat = [
74.5,7.8,8.6,9.1;
8.9,73.4,10.3,7.4;
8,13.1,70.1,8.8;
8.6,8.2,9.7,73.6
    ];
% 标签
label = {'Calm','Happy','Angry','Sad'}; %“Pe”指的是“Positive emotion”,“Ne”指的是“Negative emotion”

% 混淆矩阵主题颜色
% 可通过各种拾色器获得rgb色值
maxcolor = [191,54,12]; % 最大值颜色
mincolor = [255,255,255]; % 最小值颜色

% 绘制坐标轴
m = length(mat);
imagesc(1:m,1:m,mat)
xticks(1:m)
xlabel('Predicted class','fontsize',12)
xticklabels(label)
yticks(1:m)
ylabel('Actual class','fontsize',12)
yticklabels(label)

% 构造渐变色
mymap = [linspace(mincolor(1)/255,maxcolor(1)/255,64)',...
         linspace(mincolor(2)/255,maxcolor(2)/255,64)',...
         linspace(mincolor(3)/255,maxcolor(3)/255,64)'];

colormap(mymap)
colorbar()

% 色块填充数字
for i = 1:m
    for j = 1:m
        text(i,j,sprintf('%g%%',mat(j,i)),...
            'horizontalAlignment','center',...
            'verticalAlignment','middle',...
            'fontname','Times New Roman',...
            'fontsize',12);
    end
end

% 图像坐标轴等宽
ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 12;
set(gca,'box','on','xlim',[0.5,m+0.5],'ylim',[0.5,m+0.5]);
axis square

% 保存
saveas(gca,'RF_DF_BestWindow_4class_validation.png');