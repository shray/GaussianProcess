function [ K, invK ] = kernCreate( params, data, type )
%KERNCREATE Creates the kernel matrix. Currently only implements
%RBF + Linear + Bias


if (nargin <3)
    type = strcat('RBF','Linear','Bias');
end

% RBF, Linear, Bias
if type == strcat('RBF','Linear','Bias')
    % params = [kern_width, RBF_variance, noise_variance]
    width = params(1);
    rbf_var = params(2);
    noise_var = params(3);
    K = width * exp((-1/(2*rbf_var)) * dist2(data,data));
    % add the noise
    K = K + noise_var * eye(size(K,1));
    invK = pdinv(K);
end

end

