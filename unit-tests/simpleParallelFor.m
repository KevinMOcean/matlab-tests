% Simple script to test parallel processing with Matlab using
% Parallel Computing toolbox and the 'parfor' statement.

tic
n = 200;
A = 200;
parfor i = 1:n
    a(i) = max(abs(eig(rand(A))));
end
toc
