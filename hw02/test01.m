img= im2double(rgb2gray(imread('pic.jpg')));%im2double����һ������
sigma=25;%��������ı�׼��
J_Gaussian=imnoise(img,'gaussian',0,(sigma/255)^2); %��Ӿ�ֵΪ0����׼��Ϊsigma��˹����
imwrite(J_Gaussian,'gaussian.png');%�����˹����ͼ
J_salt=imnoise(img,'salt & pepper',0.07); %���7%�Ľ�������
imwrite(J_salt,'salt&pepper.png');
%������������
[M,N]=size(img);
a=0;
b=0.08;
B=1;
N_Ray1=a+b*raylrnd(B,M,N);
%���������ӵ�ͼ����
J_rayl=img+N_Ray1;
imwrite(J_rayl,'rayl.png');
% ٤������
a=0;
b=0.08;
A=1;
B=2;
N_Gam=a+b*gamrnd(A,B,[M,N]);
J_Gamma=img+N_Gam;
imwrite(J_Gamma,'gamma.png');
% ָ������
a=0;
b=0.08;
mu=2;
N_exp=a+b*exprnd(mu,[M,N]);
J_exp=img+N_exp;
imwrite(J_exp,'exp.png');
% ���ȷֲ�����
a=0;
b=0.08;
A=0;
B=2;
N_unif=a+b*unifrnd(A,B,[M,N]);
J_unif=img+N_unif;
imwrite(J_unif,'uniform.png');
subplot(2,3,1);
imshow(J_Gaussian);
title('��˹����');
subplot(2,3,2);
imshow(J_rayl,[]);
title('��������');
subplot(2,3,3);
imshow(J_Gamma,[]);
title('٤������');
subplot(2,3,4);
imshow(J_exp,[]);
title('ָ������');
subplot(2,3,5);
imshow(J_unif,[]);
title('���ȷֲ�����');
subplot(2,3,6);
imshow(J_salt,[]);
title('��������');




