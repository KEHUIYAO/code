% simulate date with K unique values of change-points, with different intensity rates.
function [z,Nj,C,tau_index]=latent_simu_f_different_intensity_rate(u_v,m,lambda_k,K)
%% for different dataset, you should change the C_l and C_u, the censoring time
%C_l=450;
%C_u=500;
C_l=200;
C_u=255;
%C=unifrnd(C_l,C_u,m,1);% censoring time
C=unifrnd(C_l,C_u,m,1);
%%
tau_index=unidrnd(K,m,1);% balanced, which cluster each driver is from
tau=u_v(tau_index);
Nj=zeros(1,m);% # of events for each driver
%______________
%lambda = @(x,tau2) ((x >= 0 & x <=tau2) * l1 +(x >tau2 ) * l2 ); %intensity rate
Lambda=@(x,tau2,l1,l2) ((x >= 0 & x <=tau2) *l1.*x+(x >tau2 ).*(l1*tau2+l2*(x-tau2)));%comulative intensity rate
Ft=@(x,c,tau2,l1,l2) (Lambda(x,tau2,l1,l2)/Lambda(c,tau2,l1,l2));
avgnum2=40;
%%
%________initialize end______________________________
z=-1000*ones(m,avgnum2);
    for j=1:m
            n=poissrnd(Lambda(C(j),tau(j),lambda_k(tau_index(j),1),lambda_k(tau_index(j),2)));
            if n==0
                n=1;
            end
                
            X0=zeros(1,n);
        for i = 1:n
            u=unifrnd(0,1);
             a=0;
             b=C(j);
                for s=1:20
                    temp=Ft((a+b)/2,C(j),tau(j),lambda_k(tau_index(j),1),lambda_k(tau_index(j),2));
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
z(z<0)=0;  

