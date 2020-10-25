clear
cd SNR % 切换路径，change directory
% 保存图片起始位置
headersize = zeros(8, 1);
headersize(1, 1) = 1384;
headersize(1, 2) = 1402;
headersize(1, 3) = 1390;
headersize(1, 4) = 1386;
headersize(1, 5) = 984;
headersize(1, 6) = 988;
headersize(1, 7) = 984;
headersize(1, 8) = 988;

snrs = zeros(8, 1);
for i = 1:8
SignalFreeArea = zeros(350, 300); % 创建无信号区(未穿透死鸡)用于后续信噪比计算
img = zeros(2364, 2964);
fname = sprintf('chicken%d.dcm', i);
fp = fopen(fname);
fseek(fp, headersize(i, 1), 'bof'); % 移至图片起始处
img(:) = fread(fp, (2364*2964), 'short');
fclose(fp);
img = transpose(img);
for j = 1:350
  for k = 1:300
    SignalFreeArea(j, k) =  img(j + 99, k + 199);
  end
end
sigmaSignalFree = std(SignalFreeArea(:));
snrs(i) = mean(mean(img))/sigmaSignalFree; % 计算信噪比，即总体均值与对比区域标准差之比
end
snrs = round(snrs);

for i = 1:8
  snrs(i) = snrs(i) + i/10; % 建立哈希表用于后续排序，而小数部分即为对应序号图片
end
ssnrs = sort(snrs)
cd ..

