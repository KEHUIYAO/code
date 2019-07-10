function [z,Nj,C,tau_index]=latent_simu_f_lamj3(u_v,m,l1,l2,K)% simulate date with K unique values of change-points
%a1, a2 is the prior for lam1, lam2, b1=b2=1
c_lam = 100;% the scale parameter of the gamrnd 
%lam1=gamrnd(c_lam*a1,1/c_lam,m,1);%mean is a1*0.001, var is a1*0.001^2
%lam2=gamrnd(c_lam*a2,1/c_lam,m,1);
C=unifrnd(450,500,m,1);% censoring time
tau_index=unidrnd(K,m,1);%the true membership 
tau=u_v(1)*ones(m,1);% the true tau
for k_t=2:K
tau(tau_index==k_t)=u_v(k_t);% some drivers change at u1, others change at u2;
end
c1 = 5;
r = -c1 + (2*c1)*rand(m,1);% add some randomness in the tau within the range[-c1,c1]
tau = tau + r;
Nj=zeros(1,m);% # of events for each driver
%______________
%lambda = @(x,tau2) ((x >= 0 & x <=tau2) * l1 +(x >tau2 ) * l2 ); %intensity rate
Lambda=@(x,tau2) ((x >= 0 & x <=tau2) *l1.*x+(x >tau2 ).*(l1*tau2+l2*(x-tau2)));%comulative intensity rate
Ft=@(x,c,tau2) (Lambda(x,tau2)/Lambda(c,tau2));
avgnum2=40;
%%
%________initialize end______________________________
z=-1000*ones(m,avgnum2);
    for j=1:m            
            n=poissrnd(Lambda(C(j),tau(j)));
            X0=zeros(1,n);
        for i = 1:n
            u=unifrnd(0,1);
             a=0;
             b=C(j);
                for s=1:20
                    temp=Ft((a+b)/2,C(j),tau(j));
                    if temp<=u 
                  binf=(a+b)/2; bsup=b;
                    elseif temp>u 
                     bsup=(a+b)/2;binf=a;
                     end   
                     a=binf;
                     b=bsup;
                end 
            X0(i)=(a+b)/2;
        end
        z(j,1:n)=sort(X0);% data for one driver
        Nj(j)=n;
    end
z(z<0)=0;% 
end