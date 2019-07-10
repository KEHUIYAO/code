clear
clc
rng('shuffle')%set up the random seed
u_v=[100 200 300];% two possible values of change-points
K_d=3;% two clusters
m=200; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point
[z,Nj,C,tau_true_index]=latent_simu_f(u_v,m,l1,l2,K_d);%___________data simulation end_______________
% You can also make plots, I will show you next time
