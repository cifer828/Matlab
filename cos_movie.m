N = 1000;
M = moviein(N);
x = linspace(0,2*pi);
for n=1:N
    plot(x,cos(n*x),'r-');
    xlabel('x-axis');
    if n>1
        ss = strcat('cos(',num2str(n),'x)');
    else
        ss = 'cos(x)';
    end
    ylabel(ss)
    title('Cosine functions cos(nx)','Fontsize',12)
    axis tight
    grid
    M(:,n) = getframe;
end
movie(M)
