clear
fp = fopen('PIG_MR', 'r');
fseek(fp, 8446, 'bof');
img = zeros(512);
img(:) = fread(fp, (512*512), 'short');
img = transpose(img);
rhomax = max(max(img)) % 可利用':'简写为max(img(:))
rhomin = min(min(img)) % 此处与之前方法略微不同，可对比加深印象
newimg = zeros(512);
newimg = (img - rhomin)/(rhomax - rhomin)*256; % 直接全图处理填入，原程序采用64亮度不够
colormap(gray) % 显示用灰度图
image(newimg)
