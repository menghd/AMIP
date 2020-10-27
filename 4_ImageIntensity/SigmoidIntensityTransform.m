clear
oimg = imread('ABD_CT.jpg');
size(oimg) % 取出图像尺寸

% 生成Sigmoid处理向量
pomega = 127;
psigma = 25;
sigmoid = zeros(256, 1);
for rho = 0:255
  sigmoid(rho + 1, 1) = 128*1/(1 + exp(-((rho -pomega)/psigma))); % 注意rho与向量计数方式的差别
end
% plot(sigmoid)
transimage = zeros(261, 435);
transimage(:) =  sigmoid(oimg(:) + 1, 1); % 尽量减少for循环的使用，并注意下标
colormap(gray)
image(transimage) % 显示命令为image