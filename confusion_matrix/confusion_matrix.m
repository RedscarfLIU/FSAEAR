clear;
close all;
clc

% 混淆矩阵
mat = [
15,5;
10,10
    ];
% 标签
label = {'Pe','Ne'}; %“Pe”指的是“Positive emotion”,“Ne”指的是“Negative emotion”

% 混淆矩阵主题颜色
% 可通过各种拾色器获得rgb色值
maxcolor = [191,54,12]; % 最大值颜色
mincolor = [255,255,255]; % 最小值颜色

% 绘制坐标轴
m = length(mat);
imagesc(1:m,1:m,mat)
xticks(1:m)
xlabel('Predicted class','fontsize',14)
xticklabels(label)
yticks(1:m)
ylabel('Actual class','fontsize',14)
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
        text(i,j,num2str(mat(j,i)),...
            'horizontalAlignment','center',...
            'verticalAlignment','middle',...
            'fontname','Times New Roman',...
            'fontsize',14);
    end
end

% 图像坐标轴等宽
ax = gca;
ax.FontName = 'Times New Roman';
ax.FontSize = 14;
set(gca,'box','on','xlim',[0.5,m+0.5],'ylim',[0.5,m+0.5]);
axis square

% 保存
saveas(gca,'LDA_validation.png');