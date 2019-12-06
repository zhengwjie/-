clc;
clear;
t1=im2double(imread('gaussian.png'));
subplot(2,3,1);imshow(t1);title('高斯噪声图片');
t2=im2double(imread('salt&pepper.png'));
subplot(2,3,2);imshow(t2);title('椒盐噪声图片');
t3=im2double(imread('uniform.png'));
subplot(2,3,3);imshow(t3);title('均匀噪声图片');
[MM,NN]=size(t1);
m=3;
n=3;
len_m=floor(m/2);
len_n=floor(n/2);
I_D_pad=padarray(t1,[len_m,len_n],'symmetric');
[M,N]=size(I_D_pad);
d=4;
J_Alpha=zeros(MM,NN);
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        Block=sort(Block(:));
        Block=Block(floor(d/2+1):floor(m*n-d/2));        
        J_Alpha(i-len_m,j-len_n)=sum(sum(Block))/(m*n-d);
    end
end
subplot(2, 3, 4), imshow(J_Alpha);
imwrite(J_Alpha,'alpha-gaussian.png');
title('修正后的阿尔法均值滤波器:d=4');
I_D_pad=padarray(t2,[len_m,len_n],'symmetric');
[M,N]=size(I_D_pad);
d=4;
J_Alpha=zeros(MM,NN);
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        Block=sort(Block(:));
        Block=Block(floor(d/2+1):floor(m*n-d/2));      
        J_Alpha(i-len_m,j-len_n)=sum(sum(Block))/(m*n-d);
    end
end
subplot(2, 3, 5), imshow(J_Alpha);
imwrite(J_Alpha,'alpha-salt&pepper.png');
title('修正后的阿尔法均值滤波器:d=4');
I_D_pad=padarray(t3,[len_m,len_n],'symmetric');
[M,N]=size(I_D_pad);
d=4;
J_Alpha=zeros(MM,NN);
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        Block=sort(Block(:));
        Block=Block(floor(d/2+1):floor(m*n-d/2));      
        J_Alpha(i-len_m,j-len_n)=sum(sum(Block))/(m*n-d);
    end
end
subplot(2, 3, 6), imshow(J_Alpha);
imwrite(J_Alpha,'alpha-uniform.png');
title('修正后的阿尔法均值滤波器:d=4');
