distense=zeros(75,75);
for i = 1:75
fprintf('%g to (1-75)\n',i);
for j = 1:75
distense(i,j)= dijkstra(ddd,j,i);
%fprintf(1,¡¯%g\n¡¯,distense(i));
end
end