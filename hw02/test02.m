clc;
close all;
gaussian=imread('gaussian.png');
subplot(221);
imshow(gaussian);
title('��˹����ͼƬ');
salt=imread('salt&pepper.png');
subplot(222);
imshow(salt);
title('��������ͼƬ');
%��ֵ�˲�
h=fspecial('average',5);%����һ����ֵ(5*5)
fdata=imfilter(gaussian,h);%ǰ����ͼƬ��������ģ��
subplot(223);
imshow(fdata);
imwrite(fdata,'gaussian-average.png');
title('��˹����ͼƬ-��ֵ�˲�');
h=fspecial('average',5);%����һ����ֵ(5*5)
fdata=imfilter(salt,h);%ǰ����ͼƬ��������ģ��
subplot(224);
imshow(fdata);
imwrite(fdata,'salt&pepper-average.png');
title('��������ͼƬ-��ֵ�˲�');



