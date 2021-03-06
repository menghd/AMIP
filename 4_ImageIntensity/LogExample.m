clear
fp = fopen('SKULLBASE.DCM', 'r');
fseek(fp, 1622, 'bof');
img = zeros(512);
img(:) = fread(fp, (512*512), 'short');
img = transpose(img); % 自己创建的矩阵转换应转置并及时添加';'
fclose(fp); % 用完记得关闭fopen内容
minrho = min(img(:));
img = img - minrho + 1; % 避免log0
img = log(img);
maxr = max(img(:));
img = img/maxr*128; % 可结合之前归一方式理解，64普遍偏暗故换为128
colormap(gray)
image(img)