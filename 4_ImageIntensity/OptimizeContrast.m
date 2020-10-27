clear
fp = fopen('LungCT.dcm');
fseek(fp, (-512*512*2), 'eof'); % 反向查找，eof可以用1替换，注意offset中的负号
img = zeros(512);
img(:) = fread(fp, (512*512), 'short');
img = transpose(img);
fclose(fp);

% 显示原图像
[orimax orimin] = [max(img(:)) min(img(:))];
depth = orimax - orimin;
colormap(gray)
oimg = img;
oimg = round(128*(oimg - orimin)/depth); % round确保整数，此处又是一种缩放写法
image(oimg)
foo = input('Please ENTER to proceed to the histogram...'); % input接收键盘输入与foo配合

% 绘制histogram
hist = zeros(depth + 1, 1);
for i = 1:512
  for j = 1:512
    hindex = img(i,j) - orimin + 1; % 直接逐个分桶再确保matlab下标规范
    hist(hindex, 1) = hist(hindex, 1) + 1;
  end
end
bar(hist)
foo = input('Press ENTER to proceed to the contrast-enhanced image...');

% histogram处理
cutoff = .004; % 设定阈值
border = round(512*512*cutoff);

BelowBorder = 1; % while循环跳出条件
count = 1; % 计数并用于储存新的最低桶
Nopix = 0; % if比较对象

while BelowBorder == 1
  Nopix = Nopix + 1;
  count = count + 1;
  if Nopix > border
    BelowBorder = 0;
  end % if后也需跟end
end 
LowerBoundary = count - 1;

count = depth + 1; % 上限从高到低
Nopix = 0; 
AboveBorder = 1;
% 同理可得上限
while AboveBorder == 1
  Nopix = Nopix + 1;
  count = count - 1;
  if Nopix > border
    AboveBorder = 0;
  end 
end 
UpperBoundary = count + 1;

% 更新最大最小灰度并进行覆盖
newmin = LowerBoundary + orimin;
newmax = UpperBoundary + orimax;

% matlab中没有三目操作符只能逐个if
for i = 1:512
  for j = 1:512
    if img(i:j) < newmin
      img(i:j) = newmin;
    end % 记得补上对应if的end
    if img(i:j) > newmax
      img(i:j) = newmax;
    end 
  end 
end 

img = round(128*(img - newmin)/(newmax - newmin));
image(img) % 前面已指定colormap为gray
