function test02(X,Y,n)
%迭代次数为10次
K=5000;
%随机选取m个点
m=floor((n/5)*4);
sigma=6;        %设置拟合直线与数据距离的偏差
pretotal=0;     %符合拟合模型的数据的个数
k=1;
a=0,b=0;
maxtotal=0;
while k<K && pretotal< floor((n/5)*4)
    c=randperm(numel(X));
    randomx1=[ones(m,1),X(c(1:m))];
    randomy1=Y(c(1:m));
    [bans,bint,r,rint,stats]=regress(randomy1 ,randomx1);
    total=sum(r<sigma);
    if total>pretotal            %找到符合拟合直线数据最多的拟合直线
        pretotal=total;
        b=bans(1);a=bans(2);
    end
    k=k+1;
end
plot(X,Y,'.');      
hold on;
px=X;
py=a*X+b;
plot(px,py,'r');
