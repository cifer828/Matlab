function transform(img_name)
pic_name = img_name(1: end - 3);

I = imread(['C:\Users\zhqch\Documents\code\Python3Projects\visual_detection\data\', pic_name, '\', img_name]);

udata = [0 1920];  vdata = [0 1080];
tform = maketform('projective',[907 197; 976 132; 1182 232; 1114 305], [0 0; 0 60; 125 60;125 0]);
% tform = fitgeotrans([907 197; 976 132; 1182 232; 1114 305], [0 0; 0 60; 125 60;125 0], 'projective');

% Fill with gray and use bicubic interpolation. 
% Make the output size the same as the input size.

[B,xdata,ydata] = imtransform(I, tform, 'bicubic', ...
                              'udata', udata,...
                              'vdata', vdata,...
                              'size', size(I),...
                              'fill', 255);
                          
                          
% subplot(1,2,1), imshow(I,'XData',udata,'YData',vdata), ...
%    axis on 
% subplot(1,2,2), imshow(B,'XData',xdata,'YData',ydata), ...
%    axis on 
imshow(B)

end