clc;
close all;
gaussian=imread('gaussian.png');
subplot(221);
imshow(gaussian);
title('高斯噪声图片');
salt=imread('salt&pepper.png');
subplot(222);
imshow(salt);
title('椒盐噪声图片');
%均值滤波
h=fspecial('average',5);%创建一个均值(5*5)
fdata=imfilter(gaussian,h);%前面是图片，后面是模板
subplot(223);
imshow(fdata);
imwrite(fdata,'gaussian-average.png');
title('高斯噪声图片-均值滤波');
h=fspecial('average',5);%创建一个均值(5*5)
fdata=imfilter(salt,h);%前面是图片，后面是模板
subplot(224);
imshow(fdata);
imwrite(fdata,'salt&pepper-average.png');
title('椒盐噪声图片-均值滤波');



