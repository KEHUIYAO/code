% calculate test statistics
function [test_stat]=test_stat(z,Nj,C,k,tau_lower,tau_upper)
% input
% z,Nj,C are straight-forward
% k is the number of groups under the null hypothesis

% output
% test_stat is the test statistics of this heuristic hypothesis-testing approach

    [~,~, prob1]=kmeans_r(z,Nj,C,k,tau_lower,tau_upper);
    [~,~,prob2]=kmeans_r(z,Nj,C,k+1,tau_lower,tau_upper);
    test_stat=(sum(prob2)-sum(prob1));

end


