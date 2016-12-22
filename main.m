close all;

clear all;

clc;
tic;
global im;
[filename, pathname] = uigetfile({'*.bmp'},'��ѡ����������ļ����е�һ��ͼƬ');
str = [pathname, filename];
img = imread(str);
figure;
imshow(img);
title('ԭͼ');

newimg=img;

mimg=mean(mean(img))
%------------
temperature=10;

iter=10;
yuzhi=ceil(mimg);

%yuzhi=150;
k=1;
%ģ���˻����
while temperature>0
    for i=1:iter
        e1=energy2(yuzhi,img)
        
        newyuzhi=updateyuzhi(yuzhi)
       
        e2=energy2(newyuzhi,img)
        
        delta_e=e1-e2;   
        if delta_e<0       
            yuzhi=newyuzhi;
            
        else                        %�¶�Խ�ͣ�Խ��̫���ܽ����½⣻����������ֵԽ��Խ��̫���ܽ����½�
            if exp(-delta_e/temperature)>rand() %�Ը���ѡ���Ƿ�����½�
                yuzhi=newyuzhi;      
            end
        end  
        yuzhi
    end
    k=k+1;

    temperature=temperature-1;   %�¶Ȳ����½�
  
end  

disp(['����������ʱ��Ϊ��']);
toc;

disp(['��ѭ������Ϊ��']);
k

disp(['ͼ��ָ�ĳ�ʼ��ֵΪ��']);

ceil(mimg)



disp(['ģ���˻���������ֵΪ��']);
 yuzhi

for i=1:256
    for j=1:256
        if newimg(i,j)>yuzhi
            newimg(i,j)=256;
        else
            newimg(i,j)=1;
        end
    end
end
figure;
imshow(newimg);
title('��ֵ����ͼ��');

            
 I =  img;     

 level = graythresh(I); %Ҳ����ԭ����ѭ������ʹ����䷽����󻯵���ֵ����    

disp(['ostu�����������ֵΪ��']);
ostuyuzhi=ceil(level*256)
BW = im2bw(I,level);   
imwrite(BW, 'ostuimg.bmp', 'bmp');

imwrite(uint8(newimg), 'fireimg.bmp', 'bmp');
