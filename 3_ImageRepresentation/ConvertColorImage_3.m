clear % 清空习惯
colorimg = imread('PET_image.jpg');
size(colorimg) % 读取尺寸用于创建灰度图
grayimg = zeros(652, 1417);
for i = 1:652
  for j = 1:1417
    grayimg(i, j) = 0.3*colorimg(i, j, 1) + 0.59*colorimg(i, j, 2) + 0.11*colorimg(i, j, 3); % 将RGB对应值逐个转为灰度值
  end
end % 可利用':'简写矩阵循环
% grayimg(:) = .3*colorimg(:,:,1) + .59*colorimg(:,:,2) + .11*colorimg(:,:,3);

% 转换为64灰度值
MinmumValue = min(min(grayimg));
grayimg = grayimg - MinmumValue;
MaxValue = max(max(grayimg)); % 此处的grayimg已发生改变
grayimg = floor(grayimg/MaxValue*64);

colormap(gray)
image(grayimg)


