clear
% 以double分别型读入三通道图片，确保为浮点数防止后续归一化按int归零
imgr = double(imread('salamanderred.jpg'));
imgg = double(imread('salamandergreen.jpg'));
imgb = double(imread('salamanderblue.jpg'));
cimg = double(zeros(400, 400, 3)); % 生成用于存放最后彩色图片的三维矩阵
% 类似于圆周序列确保所有rho非负
maxr = max(imgr(:));
maxg = max(imgg(:));
maxb = max(imgb(:));
% 直接逐个读入比for循环更快
imgr(:) = maxr - imgr(:);
imgg(:) = maxg - imgg(:);
imgb(:) = maxb - imgb(:);
% 为了合成彩色图片进行归一化
imgr = imgr/maxr;
imgg = imgg/maxg;
imgb = imgb/maxb;
% 改变第三维输入不同通道
for i = 1:400
  for j = 1:400
    cimg(i, j, 1) = imgr(i, j);
    cimg(i, j, 2) = imgg(i, j);
    cimg(i, j, 3) = imgb(i, j);
  end
end
image(cimg) % 直接输出彩色图像