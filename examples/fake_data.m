addpath("../recurrent_kmeans/")
tau_list=zeros(40,40);
group_list=zeros(40,40);
num_list=zeros(1,40);
centroids_list=cell(1,40);
parfor i=1:40
rng('shuffle')%set up the random seed
u_v=[7 51 75 96];% two possible values of change-points
K_d=4;% two clusters
m=40; % # of drivers
lambda_k=[100 10;60 150;60 30;200 50]*0.001
[z,Nj,C,tau_list(i,:)]=latent_simu_f_different_intensity_rate(u_v,m,lambda_k,K_d);%___________data simulation end_______________
[num_list(i),group_list(i,:),centroids_list{i}]=main(z,Nj,C,1,0,100);
end

save test.mat tau_list num_list group_list centroids_list