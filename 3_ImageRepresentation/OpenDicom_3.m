clear
fpointer = fopen('PIG_MR', 'r'); % fopen打开各类文件
fseek(fpointer, 8446, 'bof'); % bof代表从前(begin)向后找

img = zeros(512); % 需要新建空矩阵存放修改图片，默认输入一个参数则产生对应大小方阵
img(:) = fread(fpointer, (512*512), 'short'); % ':'代表逐行(per row)读入对应文件值，short则指按16位(bit)进行存入
img = transpose(img); % 储存的矩阵需要转置
colormap(gray)
image(img) % 直接image得到的是整体矩阵图特征，但并不适合成像，故需靠LUT(颜色查找表，Lookup Table)用灰度图显示

% 生成PGM格式图片，均以字符串变量储存
pgmfp = fopen('PIG_MR.pgm', 'w');
str = sprintf('P2\n'); % sprintf生成字符串变量
fprintf(pgmfp, str); % 把生成的字符串输入文件
str = sprintf('512 512\n');
fprintf(pgmfp, str); % 新输入接上次输入后
MaximumValue = max(max(img)); % 对矩阵(matrix)取max得最大列向量(vector)，再取最大值得矩阵最大元素
str = sprintf('%d\n', MaximumValue);
fprintf(pgmfp, str);
for i = 1:512
  for j = 1:512
    str = sprintf('%d', img(i,j));
    fprintf(pgmfp, str);
  end
end
fclose(pgmfp);
fclose(fpointer);

