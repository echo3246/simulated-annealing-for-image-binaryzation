im=imread('5.bmp'); %�ļ���Ϊ1.jpg��ͼ�񣬷���c�̵��£���Ȼ·���������Լ���
histimg=imhist(im); %����ֱ��ͼ
bar(histimg);%��ֱ��ͼ

yuzhi=150;
w0=0;
for i=1: yuzhi
    w0=w0+histimg(i)/(256*256);
end

w0  % ǰ��������ռ���ص�ı���

w1=1-w0  % ����������ռ���ص�ı���


n0=0;
for  v=1:yuzhi

n0=n0+histimg(v);

end  

n0 % ǰ��������ռ���ص�ĸ���



u0=0;
for i0=1: yuzhi
    u0=u0+i0*histimg(i0);
end
u0=u0/n0   % ǰ���������ص�ƽ���Ҷ�ֵ



n1=0;
for  v2=(yuzhi+1):256

n1=n1+histimg(v2);

end  

n1    % ����������ռ���ص�ĸ���





u1=0;
for j=(yuzhi+1):256
    u1=u1+j*histimg(j);
end
u1=u1/n1   % �������������ص�ƽ���Ҷ�ֵ


 uimg=0;
for s=1:256
    
uimg=uimg+s*histimg(s);
end 
uimg=uimg/(256*256)

%������䷽��
var=w0*(u0-uimg)*(u0-uimg)+w1*(u1-uimg)*(u1-uimg)


