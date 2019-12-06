t1=im2double(imread('gaussian.png'));
t1=imnoise(t1, 'salt & pepper', 0.05);
subplot(1,2,1);imshow(t1);title('高斯噪声和椒盐噪声混合图片');
imwrite(t1,'gaussian&salt&pepper.png');
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
subplot(1, 2, 2), imshow(J_Alpha);
imwrite(J_Alpha,'alpha-gaussian&salt&pepper.png');
title('修正后的阿尔法均值滤波器:d=4');