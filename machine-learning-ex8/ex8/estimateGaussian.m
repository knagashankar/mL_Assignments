function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%

% first method - using for loop
%for i=1:n
%  sum1=0;
%  diff=0;
%  for j=1:m
%    sum1=sum1+X(j,i);
%  end
%  mu(i,1) = (1/m)* (sum1);
%  for j=1:m
%    diff=diff+((X(j,i)-mu(i,1))^2);
%  end
%  sigma2(i,1)=(1/m)*(diff);
%end

% second method - using vectorisation
mu = mean(X)(:);
sigma2 = var(X);

sigma2 = (sigma2*(m-1))/m;
% this step included because octave uses 1/m-1 to calculate variance
% hence multiplying m-1 to ccancel out 1/m-1 and dividing the value by m



% =============================================================


end
