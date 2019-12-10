
function test01(X,Y,n)
x2=sum(X.^2);       % 求Σ(xi^2)
x1=sum(X);          % 求Σ(xi)
x1y1=sum(X.*Y);     % 求Σ(xi*yi)
y1=sum(Y);          % 求Σ(yi)
a=(n*x1y1-x1*y1)/(n*x2-x1*x1);      %解出直线斜率b=(y1-a*x1)/n
b=(y1-a*x1)/n;                      %解出直线截距
figure
plot(X,Y,'.');      
hold on;
px=X;
py=a*px+b;
plot(px,py,'r');