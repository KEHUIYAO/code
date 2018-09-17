%the working version
function r= Lj(lam1,lam2,tauj,cj,Nj_r,t,adj)
% Compute the likelihood of one individual
% tauj is a vector, cj is a number, t is a vector of event times
% Nj_r the # of events for each driver
len=length(tauj);logr=zeros(1,len);
t_sub=t(1:Nj_r);
for i=1:len
Nj_1=sum(t_sub<=tauj(i));% # of events before the change-point
logr(i)=(lam2-lam1)*tauj(i)-lam2*cj+Nj_1*log(lam1)+(Nj_r-Nj_1)*log(lam2)+adj;
end
r=exp(logr);