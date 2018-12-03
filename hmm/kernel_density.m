function kd = kernel_density(point, samples)
kd = 0;
r = 3;
for i=1:size(samples, 1)
    kd = kd + samples(i,3)/r/r/sqrt(2 * pi) * exp(sum((point-samples(i,1:2)).^2, 2)/-2/r/r);
end
kd = kd / size(samples, 1);