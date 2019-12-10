function [x,y]=GenerRand_Linear()
a=5;
b=10;
x=[];
for i=1:1000
    x(i,1)=i;
    y(i,1)=a*i+b+randn(1,1)*200;
end
for i=1001:1200
    x(i,1)=randn(1,1)*20+500;
    y(i,1)=randn(1,1)*200+500;
end
 c=randperm(numel(x));
x=x(c(1:1200));
y=y(c(1:1200));


