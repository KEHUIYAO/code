%% the first version of ref_new is bootstrap vs parametric 

function [success]=ref_new(bdfts,centroids,k,num,B,adj,tau_lower,tau_upper)
if length(bdfts)>1
% % k is the number of clusters
% % num is the number of observations
% % B is the number of replications
% 
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
p_value=ranksum(bdfts,u)
if p_value<adj
    success=1;
else
    success=0;
end


%% the second version is just parametric
else
test_stat=bdfts
% k is the number of clusters
% num is the number of observations
% B is the number of replications

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
%success=(sum(test_stat>=u)-B/2)>0;
%success=(test_stat-prctile(u,(50+adj)))>0;
success=(test_stat-(u+adj*sd)>0);

end