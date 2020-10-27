clear
img = imread('ABD_CT.jpg');
depth = max(img(:)) - min(img(:)) % 计算图像深度确定覆盖范围
bn = 16; % 分桶数
hist = zeros(bn, 1);
[w h] = size(img); % 取出图像尺寸用于for循环
for i = 1:w
  for j = 1:h
   rho = img(i, j);
   bin = floor(rho/(bn + 1) + 1); % matlab起始为1，采用floor加1确保下标合法
   hist(bin, 1) = hist(bin, 1) + 1; % 同一桶中rho叠加数量
  end
end
bar(hist) % 条形图绘制
save('Histogram.txt', 'hist', '-ascii'); % 保存有关信息，其中txt用于存放各桶具体桶高