function test02(X,Y,n)
%��������Ϊ10��
K=5000;
%���ѡȡm����
m=floor((n/5)*4);
sigma=6;        %�������ֱ�������ݾ����ƫ��
pretotal=0;     %�������ģ�͵����ݵĸ���
k=1;
a=0,b=0;
maxtotal=0;
while k<K && pretotal< floor((n/5)*4)
    c=randperm(numel(X));
    randomx1=[ones(m,1),X(c(1:m))];
    randomy1=Y(c(1:m));
    [bans,bint,r,rint,stats]=regress(randomy1 ,randomx1);
    total=sum(r<sigma);
    if total>pretotal            %�ҵ��������ֱ�������������ֱ��
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
