img= im2double(rgb2gray(imread('pic.jpg')));%im2double作归一化处理
sigma=25;%添加噪声的标准差
J_Gaussian=imnoise(img,'gaussian',0,(sigma/255)^2); %添加均值为0，标准差为sigma高斯噪声
imwrite(J_Gaussian,'gaussian.png');%输出高斯噪声图
J_salt=imnoise(img,'salt & pepper',0.07); %添加7%的椒盐噪声
imwrite(J_salt,'salt&pepper.png');
%生成瑞利噪声
[M,N]=size(img);
a=0;
b=0.08;
B=1;
N_Ray1=a+b*raylrnd(B,M,N);
%将噪声叠加到图像上
J_rayl=img+N_Ray1;
imwrite(J_rayl,'rayl.png');
% 伽马噪声
a=0;
b=0.08;
A=1;
B=2;
N_Gam=a+b*gamrnd(A,B,[M,N]);
J_Gamma=img+N_Gam;
imwrite(J_Gamma,'gamma.png');
% 指数噪声
a=0;
b=0.08;
mu=2;
N_exp=a+b*exprnd(mu,[M,N]);
J_exp=img+N_exp;
imwrite(J_exp,'exp.png');
% 均匀分布噪声
a=0;
b=0.08;
A=0;
B=2;
N_unif=a+b*unifrnd(A,B,[M,N]);
J_unif=img+N_unif;
imwrite(J_unif,'uniform.png');
subplot(2,3,1);
imshow(J_Gaussian);
title('高斯噪声');
subplot(2,3,2);
imshow(J_rayl,[]);
title('瑞利噪声');
subplot(2,3,3);
imshow(J_Gamma,[]);
title('伽马噪声');
subplot(2,3,4);
imshow(J_exp,[]);
title('指数噪声');
subplot(2,3,5);
imshow(J_unif,[]);
title('均匀分布噪声');
subplot(2,3,6);
imshow(J_salt,[]);
title('椒盐噪声');




