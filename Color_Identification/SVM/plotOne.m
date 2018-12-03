function plotOne(dirName, type)
load(['centers_', dirName, '.mat']);
load(['radius_', dirName, '.mat']);
z_list = unique(centers(:,type));
x_type = mod(type + 1,3);
y_type = mod(type + 2,3);
space = {'Red', 'Green', 'Blue'};
if x_type == 0
    x_type = 3;
end
if y_type == 0
    y_type = 3;
end
x_label = space{1,x_type};
y_label = space{1,y_type};
title_ =  space{1,type};


for i=1:size(z_list, 1)
    z = z_list(i);
    zMin = floor(min(radius(:,4))) - 1;
    zMax = ceil(max(radius(:,4))) + 1;
    
    radius_list = radius(radius(:,type)==z, :);
    x_list = unique(radius(radius(:,type)==z,x_type));
    y_list = unique(radius(radius(:,type)==z,y_type));
    [gg,rr]=meshgrid(y_list, x_list);

    % reshapeÑù±¾¾ØÕó
    [~,I]=sort(radius_list(:,2));
    radius_list = radius_list(I,:);
    [~,I]=sort(radius_list(:,1));
    radius_list = radius_list(I,:);
    radius_value = reshape(radius_list(:,4), size(x_list,1), size(y_list,1));

    % »æÍ¼
    figure(i);
    h = pcolor(gg, rr, radius_value);
    set(h,'edgecolor','none','facecolor','interp');
    axis([0 255 0 255]);
    colorbar;
%     surf(gg, rr, radius_value);    
%     axis([0 255 0 255 zMin zMax]);
    title([title_, ' = ' ,num2str(z)],'fontsize', 30); 
    set(gca,'fontSize',15);
    xlabel(x_label,'fontsize', 25);      
    ylabel(y_label,'fontsize', 25);    
    zlabel('radius','fontsize', 25);       
    saveas(h,['figure\',dirName,'\',title_, int2str(i),'heat.fig'])
    saveas(h,['figure\',dirName,'\',title_, int2str(i),'heat.jpg'])
    
    figure(i+5);
    g = surf(gg, rr, radius_value);  
    shading interp
    axis([0 255 0 255 zMin zMax]);
    title([title_, ' = ' ,num2str(z)],'fontsize', 30); 
    set(gca,'fontSize',15);
    xlabel(x_label,'fontsize', 25);      
    ylabel(y_label,'fontsize', 25);    
    zlabel('radius','fontsize', 25);       
    saveas(g,['figure\',dirName,'\',title_, int2str(i),'surf.fig'])
    saveas(g,['figure\',dirName,'\',title_, int2str(i),'surf.jpg'])
end
end