parpool(24)
tau_list=zeros(40);
group_list=zeros(40);
num_list=zeros(1,40);
centroids_list=cell(1,40);
parfor i=1:40
rng('shuffle')%set up the random seed
u_v=[150 150];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
lambda_k=[0.25 0.1;0.1,0.25];
[z,Nj,C,tau_list(i,:)]=latent_simu_f_different_intensity_rate(u_v,m,lambda_k,K_d);%___________data simulation end_______________
% You can also make plots, I will show you next time
[num_list(i),group_list(i,:),centroids_list{i}]=main(z,Nj,C);
end


save 11.mat tau_list num_list group_list centroids_list