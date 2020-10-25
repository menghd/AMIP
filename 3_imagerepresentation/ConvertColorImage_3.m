colorimg = imread('PET_image.jpg');
size(colorimg) % 读取尺寸用于创建灰度图
grayimg = zeros(652, 1417);
for i = 1:652
  for j = 1:1417
    grayimg = 0.3*colorimg(i, j, 1) + 0.59*colorimg(i, j, 2) + 0.11*colorimg(i, j, 3); % 将三张RGB图转换为灰度图
  end
end

% 转换为64灰度值
MinmumValue = min(min(grayimg));
grayimg = grayimg - MinmumValue;
MaxValue = max(max(grayimg)); % 此处的grayimg已发生改变
grayimg = floor(grayimg/MaxValue*64);

colormap(gray)
image(graying)


