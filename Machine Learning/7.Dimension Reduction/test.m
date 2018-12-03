fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');

%  Load an image of a bird
A = double(imread('bird_small.png'));

% If imread does not work for you, you can try instead
%   load ('bird_small.mat');

A = A / 255; % Divide by 255 so that all values are in the range 0 - 1

% Size of the image
img_size = size(A);

% Reshape the image into an Nx3 matrix where N = number of pixels.
% Each row will contain the Red, Green and Blue pixel values
% This gives us our dataset matrix X that we will use K-Means on.
X = reshape(A, img_size(1) * img_size(2), 3);

% Run your K-Means algorithm on this data
% You should try different values of K and max_iters here
K = 16; 
max_iters = 10;

% When using K-Means, it is important the initialize the centroids
% randomly. 
% You should complete the code in kMeansInitCentroids.m before proceeding
initial_centroids = kMeansInitCentroids(X, K);

% Run K-Means
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);
a = centroids(idx,:);
scatter3(X(:,1)*256, X(:,2)*256, X(:,3)*256, 10, centroids(idx,:), 'filled');
% marker = {};
% for i=1:16
%     m = X(find(idx==i),:);
%     color = centroids(i,:)
%     scatter3(m(:,1)*256, m(:,2)*256, m(:,3)*256, [1 0 0], 'filled');
%     hold on;
% %     pause;
% end
