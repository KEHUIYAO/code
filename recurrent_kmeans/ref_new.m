% derive the reference distribution of the test statistics by simulating the dataset multiple times, then do the hypothesis testing based on the original test statistics
function [success]=ref_new(bdfts,centroids,k,num,B,adj,tau_lower,tau_upper)
% input
% bdfts is the original test statistics
% centroids,num are straight-forward
% k is the number of groups under the null hypothesis
% B is the number of replicated datasets you want to generate
% adj here serves as p-value, based on 1-standard-error, adj takes value of 0.05

% output
% success is we determine reject the null hypothesis or not

    test_stat=bdfts
    u=zeros(1,B);
    u_v=centroids(:,1);
    K_d=length(u_v);
    intensity_rate=centroids(:,2:end);

    for i=1:B
    [z,Nj,C]=latent_simu_f_different_intensity_rate(u_v,num,intensity_rate,K_d);
    [~,~,prob1] = kmeans_r(z,Nj,C,k,tau_lower,tau_upper);
    [~,~,prob2] = kmeans_r(z,Nj,C,k+1,tau_lower,tau_upper);
    u(i)=(sum(prob2)-sum(prob1));
    end

    sd=std(u);
    u=mean(u);
    success=(test_stat-(u+adj*sd)>0);

end