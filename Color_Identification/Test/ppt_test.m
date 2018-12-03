MyYuanLaiPic = imread('1.jpg');
MyFirstGrayPic = rgb2gray(MyYuanLaiPic);

[rows , cols , colors] = size(MyYuanLaiPic);
MidGrayPic = zeros(rows , cols);
MidGrayPic = uint8(MidGrayPic);

for i = 1:rows  
    for j = 1:cols   
        MidGrayPic(i , j) = MyYuanLaiPic(i , j , 1) * 0.8 +  MyYuanLaiPic(i , j , 1) * 0.2 +   MyYuanLaiPic(i , j , 1) * 0  ;%进行转化的关键公式，sum每次都因为后面的数字而不能超过255  
    end  
end  

%显示原来的RGB图像  
figure(1);  
imshow(MyYuanLaiPic);  
  
%显示经过系统函数运算过的灰度图像  
figure(2);  
imshow(MyFirstGrayPic);  
  
%显示转化之后的灰度图像  
figure(3);  
imshow(MidGrayPic);  

imwrite(MidGrayPic , 'E:/image/matlab/DarkMouseGray.png' , 'png');  

imwrite(MyFirstGrayPic , '1.png' , 'png'); 