function[power,u,uu]=ref_power(z,Nj,C,k,tau_lower,tau_upper)

[u,uu]=ref_distribution(z,Nj,C,k,tau_lower,tau_upper);
sd=std(u);
mu=mean(u);
%success=(sum(test_stat>=u)-B/2)>0;
%success=(test_stat-prctile(u,(50+adj)))>0;

critical_value=mu+1.96*sd;
power=sum((uu-critical_value)>0)/length(uu);
