function e = energy2( yuzhi,img)


histimg=imhist(img); %����ֱ��ͼ
%bar(histimg);%��ֱ��ͼ

n0=0;
for i=1:yuzhi
n0=n0+histimg(i);

end



w0=n0/(256*256);% ǰ��������ռ���ص�ı���
% w0


w1=1-w0;  % ����������ռ���ص�ı���







u0=0;
for i0=1: yuzhi
    u0=u0+i0*histimg(i0);
end
u0=u0/n0;   % ǰ���������ص�ƽ���Ҷ�ֵ



n1=0;
for  v2=(yuzhi+1):256

n1=n1+histimg(v2);

end  

%n1  % ����������ռ���ص�ĸ���





u1=0;
for j=(yuzhi+1):256
    u1=u1+j*histimg(j);
end
u1=u1/n1;   % �������������ص�ƽ���Ҷ�ֵ


 uimg=0;

 
 
 uimg= w0*u0+w1*u1;







%������䷽��
var=w0*(u0-uimg)*(u0-uimg)+w1*(u1-uimg)*(u1-uimg);

e=var;


end

