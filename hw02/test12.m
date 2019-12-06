block=3;
t1=im2double(imread('gaussian.png'));
%t1=im2double(imread('salt&pepper.png'));
subplot(1,2,1);
imshow(t1);
[M,N]=size(t1);title('椒盐噪声图片');
NI=zeros(M,N);
Eta_total=(25/255).^2;
[MM,NN]=size(t1);
m=5;
n=5;
len_m=floor(m/2);
len_n=floor(n/2);
I_D_pad=padarray(t1,[len_m,len_n],'symmetric');
[M,N]=size(I_D_pad);
d=4;
J_Alpha=zeros(MM,NN);
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        Eta_local=std2(Block).^2;  %求局部方差
        average=mean(mean(Block)); %求平均值
        J_Alpha(i-len_m,j-len_n)=t1(i-len_m,j-len_n)-(Eta_total/Eta_local)*(t1(i-len_m,j-len_n)-average);
    end
end
subplot(1, 2, 2), imshow(J_Alpha);
%imwrite(J_Alpha,'selfadapt-gaussian.png');
title('自适应均值滤波器');