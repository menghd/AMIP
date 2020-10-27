clear;
img1 = imread('DSA1.jpg'); % 利用';'不显示输出
img2 = imread('DSA2.jpg');
resing = (img1 - img2);
colormap(gray); % 指定输出灰阶图类型

subplot(131) % 中间可不加','并写
image(img1)

subplot(132)
image(img2)

subplot(133)
image(resing) % 图像亮度不够，后续考虑锐化或者灰度值转换处理