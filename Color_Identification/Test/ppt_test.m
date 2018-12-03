MyYuanLaiPic = imread('1.jpg');
MyFirstGrayPic = rgb2gray(MyYuanLaiPic);

[rows , cols , colors] = size(MyYuanLaiPic);
MidGrayPic = zeros(rows , cols);
MidGrayPic = uint8(MidGrayPic);

for i = 1:rows  
    for j = 1:cols   
        MidGrayPic(i , j) = MyYuanLaiPic(i , j , 1) * 0.8 +  MyYuanLaiPic(i , j , 1) * 0.2 +   MyYuanLaiPic(i , j , 1) * 0  ;%����ת���Ĺؼ���ʽ��sumÿ�ζ���Ϊ��������ֶ����ܳ���255  
    end  
end  

%��ʾԭ����RGBͼ��  
figure(1);  
imshow(MyYuanLaiPic);  
  
%��ʾ����ϵͳ����������ĻҶ�ͼ��  
figure(2);  
imshow(MyFirstGrayPic);  
  
%��ʾת��֮��ĻҶ�ͼ��  
figure(3);  
imshow(MidGrayPic);  

imwrite(MidGrayPic , 'E:/image/matlab/DarkMouseGray.png' , 'png');  

imwrite(MyFirstGrayPic , '1.png' , 'png'); 