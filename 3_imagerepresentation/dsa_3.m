clear;
img1 = imread('DSA1.jpg');
img2 = imread('DSA2.jpg');
resing = (img1 - img2);
colormap(gray);

subplot(131)
image(img1)

subplot(132)
image(img2)

subplot(133)
image(resing)

% 图像亮度不够，后续考虑锐化处理