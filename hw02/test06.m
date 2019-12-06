t1=imread('gaussian.png');
subplot(2,3,1);imshow(t1);title('高斯噪声图片');
t2=imread('salt&pepper.png');
subplot(2,3,2);imshow(t2);title('椒盐噪声图片');
t3=imread('uniform.png');
subplot(2,3,3);imshow(t3);title('均匀噪声图片');
t1=medfilt2(t1,[3 3]);imwrite(t1,'med-gaussian.png');
subplot(2,3,4);imshow(t1);title('中值滤波去噪');
t2=medfilt2(t2,[3 3]);imwrite(t2,'med-salt&pepper.png');
subplot(2,3,5);imshow(t2);title('中值滤波去噪');
t3=medfilt2(t3,[3 3]);imwrite(t3,'med-uniform.png');
subplot(2,3,6);imshow(t3);title('中值滤波去噪');



