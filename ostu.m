 I = imread('2.bmp');       

 level = graythresh(I) %Ҳ����ԭ����ѭ������ʹ����䷽����󻯵���ֵ����    

BW = im2bw(I,level);     %�ҵ���ֵ��ֵ������

figure, imshow(BW)

yuzhi=level*256



