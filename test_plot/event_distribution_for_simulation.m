% For each simulation setting, plot the distribution of events per subject
% The output figures are located in test_plot folder


rng('shuffle')%set up the random seed
u_v=[150 300];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/1.png")


rng('shuffle')%set up the random seed
K_d=2;% two clusters
m=80; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/2.png")


rng('shuffle')%set up the random seed
u_v=[150 200];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; 
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/3.png")

rng('shuffle')%set up the random seed
u_v=[150 300];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
lambda_k=[0.25 0.1;0.25,0.1];
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f_balanced(u_v,m,lambda_k,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/4.png")

rng('shuffle')%set up the random seed
u_v=[150 300];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % int
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f_unbalanced(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/5.png")


rng('shuffle')%set up the random seed
u_v=[150 300];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
lambda_k=[0.25 0.1;0.25,0.1];
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f_Cjsmall(u_v,m,lambda_k,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/6.png")

rng('shuffle')%set up the random seed
u_v=[150 300];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1;
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f_lamj3(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/7.png")

rng('shuffle')%set up the random seed
u_v=[150 300];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.10; % intensity rate after the change-point
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f_lamj(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/8.png")

rng('shuffle')%set up the random seed
u_v=[150 300];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
lambda_k=[0.25 0.1;0.1,0.25];
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f_different_intensity_rate(u_v,m,lambda_k,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/9.png")

rng('shuffle')%set up the random seed
u_v=[100 200 300];% two possible values of change-points
K_d=3;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % intensity rate after the change-point
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/10.png")

rng('shuffle')%set up the random seed
u_v=[150 150];% two possible values of change-points
K_d=2;% two clusters
m=40; % # of drivers
lambda_k=[0.25 0.1;0.1,0.25];
Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f_different_intensity_rate(u_v,m,lambda_k,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/11.png")

rng('shuffle')%set up the random seed
u_v=[80 160 240 320];% two possible values of change-points
K_d=4;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % 

Nj=zeros(40,m);
for i=1:40
[~,Nj(i,:),~,~]=latent_simu_f(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/12.png")

% another three settings
repTime=40;
rng('shuffle')%set up the random seed
u_v=[150];% two possible values of change-points
K_d=1;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % 
Nj=zeros(repTime,m);
for i=1:repTime
[~,Nj(i,:),~,~]=latent_simu_f(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
histogram(reshape(Nj.',1,[]))
mean(reshape(Nj.',1,[]))
std(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/show_1.png")


repTime=40;
rng('shuffle')%set up the random seed
u_v=[300];% two possible values of change-points
K_d=1;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.1; % 
Nj=zeros(repTime,m);
for i=1:repTime
[~,Nj(i,:),~,~]=latent_simu_f(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
mean(reshape(Nj.',1,[]))
std(reshape(Nj.',1,[]))
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/show_2.png")

repTime=40;
rng('shuffle')%set up the random seed
u_v=[150];% two possible values of change-points
K_d=1;% two clusters
m=40; % # of drivers
l1=0.25;% intensity rate before the change-point
l2=0.2; % 
Nj=zeros(repTime,m);
for i=1:repTime
[~,Nj(i,:),~,~]=latent_simu_f(u_v,m,l1,l2,K_d);%___________data simulation end_______________
end
% plot the distribution of number of events per subject 
mean(reshape(Nj.',1,[]))
std(reshape(Nj.',1,[]))
histogram(reshape(Nj.',1,[]))
saveas(gcf,"../test_plot/show_3.png")

