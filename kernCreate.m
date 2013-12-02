function [ K ] = kernCreate( params, data1, data2, type )
%KERNCREATE Creates the kernel matrix. Currently only implements
%RBF + Linear + Bias


if (nargin <4)
    type = strcat('RBF','Linear','Bias');
end

% RBF, Linear, Bias
if type == strcat('RBF','Linear','Bias')
    % params = [kern_width, RBF_variance, noise_variance]
    width = params(1);
    rbf_var = params(2);
    noise_var = params(3);
    K = width * exp((-1/(2*rbf_var)) * dist2(data1,data2));
    % add the noise
    %K = K + noise_var * eye(size(K,1));
    % if the distance is zero
    zero_dist = find(K == width);
    K(zero_dist) = K(zero_dist) + noise_var;
end

end

