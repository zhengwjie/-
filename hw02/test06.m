t1=imread('gaussian.png');
subplot(2,3,1);imshow(t1);title('��˹����ͼƬ');
t2=imread('salt&pepper.png');
subplot(2,3,2);imshow(t2);title('��������ͼƬ');
t3=imread('uniform.png');
subplot(2,3,3);imshow(t3);title('��������ͼƬ');
t1=medfilt2(t1,[3 3]);imwrite(t1,'med-gaussian.png');
subplot(2,3,4);imshow(t1);title('��ֵ�˲�ȥ��');
t2=medfilt2(t2,[3 3]);imwrite(t2,'med-salt&pepper.png');
subplot(2,3,5);imshow(t2);title('��ֵ�˲�ȥ��');
t3=medfilt2(t3,[3 3]);imwrite(t3,'med-uniform.png');
subplot(2,3,6);imshow(t3);title('��ֵ�˲�ȥ��');



