function [test_stat,u]=bootstrap_test_stat(z,Nj,C,B,k,tau_lower,tau_upper)
[~,~, prob1]=kmeans_r(z,Nj,C,k,tau_lower,tau_upper);
[~,~,prob2]=kmeans_r(z,Nj,C,k+1,tau_lower,tau_upper);
test_stat=(sum(prob2)-sum(prob1));
m=length(Nj);
index=1:m;
u=zeros(1,B);

%% if the following sentences were used, then it will be bootstrap vs parametric method.

% for i=1:B
% 
% ind=datasample(index,m);
% dat=z(ind,:);
% nj=Nj(ind);
% c=C(ind);
% 
% [~,~,prob1] = kmeans_r(dat,nj,c,k,tau_lower,tau_upper);
% [~,~,prob2] = kmeans_r(dat,nj,c,k+1,tau_lower,tau_upper);
% 
% u(i)=(sum(prob2)-sum(prob1));
% 
% end
