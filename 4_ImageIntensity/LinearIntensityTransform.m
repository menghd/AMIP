clear
fp = fopen('PIG_MR', 'r');
fseek(fp, 8446, 'bof');
img = zeros(512);
img(:) = fread(fp, (512*512), 'short');
img = transpose(img);
