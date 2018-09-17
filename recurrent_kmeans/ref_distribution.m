function [ u,uu ] = ref_distribution(z,Nj,C,k,tau_lower,tau_upper)
%% z,Nj,C are generated from latent_simu_f
% k is user-defined



%% true data
m=length(Nj);
[~, centroids1,~]=kmeans_r(z,Nj,C,k,tau_lower,tau_upper);
    
[~,centroids2,~]=kmeans_r(z,Nj,C,k+1,tau_lower,tau_upper);


%% true cluster=k
centroids=centroids1;
num=m;
B=200;


u=zeros(1,B);
u_v=centroids(:,1);
K_d=length(u_v);

intensity_rate=centroids(:,2:end);



parfor i=1:B
[z,Nj,C]=latent_simu_f_different_intensity_rate(u_v,num,intensity_rate,K_d);

[~,~,prob1] = kmeans_r(z,Nj,C,k,tau_lower,tau_upper);
[~,~,prob2] = kmeans_r(z,Nj,C,k+1,tau_lower,tau_upper);

u(i)=(sum(prob2)-sum(prob1));


end




%% true cluster=k+1
centroids=centroids2;
num=m;



uu=zeros(1,B);
u_v=centroids(:,1);
K_d=length(u_v);

intensity_rate=centroids(:,2:end);



parfor i=1:B
[z,Nj,C]=latent_simu_f_different_intensity_rate(u_v,num,intensity_rate,K_d);

[~,~,prob1] = kmeans_r(z,Nj,C,k,tau_lower,tau_upper);
[~,~,prob2] = kmeans_r(z,Nj,C,k+1,tau_lower,tau_upper);

uu(i)=(sum(prob2)-sum(prob1));


end





end
