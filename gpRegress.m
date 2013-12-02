function [ ystar, ystar_var ] = gpRegress( K, invK, X, params, y, Xstar )
%GPREGRESS Regresses to find the output for 
% an input set of points

% center y
meany = mean(y,1); 
y = y - repmat(meany, size(y,1),1);

Kstar = kernCreate([params(1) params(2) 0], Xstar, X); % No noise variance

Kstarstar = kernCreate(params, Xstar, Xstar);

% mean of y
ystar = Kstar * invK * y;
ystar = ystar + repmat(meany, size(ystar,1),1);

% variance of y
ystar_var = Kstarstar - Kstar * invK * Kstar';

end

