fpointer = fopen('PIG_MR', 'r'); % fopen打开各类文件
fseek(fpointer, 8446, 'bof'); % bof代表从前(begib)向后找

img = zeros(512); % 需要新建空矩阵存放修改图片，默认输入一个参数则产生对应大小方阵
img(:) = fread(fopinter, (512*512), 'short'); % ':'代表逐行(per row)读入对应文件值，short则指按16位(bit)进行存入
img = transpose(img); % 储存的矩阵需要转置
colormap(gray)
image(img) % 直接image得到的是整体矩阵图特征，但并不适合成像，故需靠LUT(颜色查找表，Lookup Table)用灰阶图显示

