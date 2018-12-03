function funplot(F,xstart,xend,col)
if (nargin == 0)
    error('no function is provided');
end
if (nargin<2)
    xstart = 0;
    xend = 10;
end
if (nargin == 2)
    error('wrong number or arguments.');
end
if (nargin < 4)
    col = 'b';
end

if (xstart == xend)
    error('non-zero range');
elseif (xstart > xend)
    exchange = xend;
    xend = xstart;
    xstart = exchange;
end
switch col
    case {'b','k'}
        ;
    otherwise
        error('wrong col value')
end

x = linspace(xstart, xend);
y = feval(F,x);
plot(x,y,col);
return;