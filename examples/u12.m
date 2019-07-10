parpool(18)
tau_list=zeros(40,40);
group_list=zeros(40,40);
num_list=zeros(1,40);
centroids_list=cell(1,40);
parfor i=1:40
rng('shuffle')%set up the random seed
u_v=[80 160 240 320];% two possible values of change-points
K_d=4;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point
[z,Nj,C,tau_list(i,:)]=latent_simu_f(u_v,m,l1,l2,K_d);%___________data simulation end_______________
% You can also make plots, I will show you next time
  [num_list(i),group_list(i,:),centroids_list{i}]=main(z,Nj,C,1.96,50,300);
end


save 12.mat tau_list num_list group_list centroids_list
