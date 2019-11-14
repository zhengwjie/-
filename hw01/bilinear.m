function img=bilinear(oldimg,newWidth,newHeight)
[a,b,c]=size(oldimg);
for i=1:newHeight
    for j=1:newWidth
        for k=1:c
          x=(i+0.5)*a/newHeight-0.5;
          y=(j+0.5)*b/newWidth-0.5;
          x1=floor(x);
          x2=ceil(x);
          y1=floor(y);
          y2=ceil(y);
          if x1<1
              x1=1;
          end
          if y1<1
              y1=1;
          end;
          if x2>newHeight
              x2=newHeight-1;
          end;
          if y2>newWidth
              y2=newWidth-1;
          end
          if x2>x1
             R1=(x2-x)/(x2-x1)*oldimg(x1,y1,k)+(x-x1)/(x2-x1)*oldimg(x2,y1,k);
             R2=(x2-x)/(x2-x1)*oldimg(x1,y2,k)+(x-x1)/(x2-x1)*oldimg(x2,y2,k);
          else
             R1=oldimg(x1,y1,k);
             R2=oldimg(x1,y2,k); 
          end
          if y2>y1
            img(i,j,k)=(y2-y)/(y2-y1)*R1+(y-y1)/(y2-y1)*R2;
          else
            img(i,j,k)=R1;
          end;
        end
     end
end
        
        