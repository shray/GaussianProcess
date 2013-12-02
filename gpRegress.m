function [ ystar, ystar_var ] = gpRegress( K, X, params, y, Xstar )
%GPREGRESS Regresses to find the output for 
% an input set of points

% center y
meany = mean(y,1); 
y = y - repmat(meany, size(y,1),1);

Kstar = kernCreate(params, Xstar, X); % No noise variance

Kstarstar = kernCreate(params, Xstar, Xstar);

L = chol(K,'lower');
alpha = L' \ (L\y);

% mean of y
ystar = Kstar * alpha;
ystar = ystar + repmat(meany, size(ystar,1),1);

% variance of y
% ystar_var = Kstarstar - Kstar * invK * Kstar';
ystar_var = L\Kstar';
ystar_var = Kstarstar - ystar_var' * ystar_var;

end

