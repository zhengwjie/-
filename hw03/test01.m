
function test01(X,Y,n)
x2=sum(X.^2);       % ��(xi^2)
x1=sum(X);          % ��(xi)
x1y1=sum(X.*Y);     % ��(xi*yi)
y1=sum(Y);          % ��(yi)
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %���ֱ��б��b=(y1-a*x1)/n
b=(y1-a*x1)/n;                      %���ֱ�߽ؾ�
figure
plot(X,Y,'.');      
hold on;
px=X;
py=a*px+b;
plot(px,py,'r');