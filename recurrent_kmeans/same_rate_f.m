function [tau,lam1, lam2,logL]=same_rate_f(z,Nj,C,driver_id_list,tau_lower,tau_upper)
% tau_l, tau_u are the lower bound and upper bound of tau
% q is the vector of the ordered event_times
% Cj is the censoring time
% driver_id is a vector.
switch nargin
    case 4
        tau_lower=0;
        tau_upper=1000;
end
num_of_drivers=length(driver_id_list);
event_list=z(driver_id_list,:);
nj=Nj(driver_id_list);

q=zeros(1,sum(nj));
count=1;
for i=1:num_of_drivers
    q(count:(count+nj(i)-1))=event_list(i,1:nj(i));
    count=count+nj(i);
end





Cj=C(driver_id_list);


tau_l=0;
tau_u=max(tau_upper,min(Cj));
%tau_u=tau_upper;

if tau_lower~=0
    tau_l=tau_lower;
end

% if tau_upper~=1000
%     tau_u=min(tau_u,tau_upper);
% end


t_sub=q(q>=tau_l & q<=tau_u);% tau_u is the upper bound of tau
len_t=length(t_sub);
logL=zeros(1,len_t);

i=1;
for tau_s=t_sub
    sum_Njtau=sum(q<=tau_s); % # of events before tau
    
    lam1=sum_Njtau/(tau_s*num_of_drivers);
    lam2=(sum(nj)-sum_Njtau)/(sum(Cj)-tau_s*num_of_drivers); 

    temp=0;
    for j=1:num_of_drivers
        temp=temp+logLj(lam1,lam2,tau_s,Cj(j),nj(j),event_list(j,1: ...
                                                      nj(j)),0);
    end
    logL(i)=temp;
    i=i+1;
end
[val, idx] = max(logL);
tau=t_sub(idx);
sum_Njtau=sum(q<=tau); % # of events before tau
lam1=sum_Njtau/(tau*num_of_drivers);
lam2=(sum(nj)-sum_Njtau)/(sum(Cj)-tau*num_of_drivers); 
