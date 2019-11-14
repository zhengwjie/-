function img=generateFigure(imgW,imgH)
x=0:2*pi/100:2*pi;
y1=sin(x);
y2=cos(x);
y3=x.^2;
fig=figure;
set(gcf,'visible','off')
plot(x,y1,'r')
hold on;
plot(x,y2,'g')
hold on;
plot(x,y3,'b')
legend('y=sin(x)','y=cos(x)','y=x^2')
hold on;
frame=getframe(fig);
img=frame2im(frame);
img=imresize(img,[imgW,imgH]);


