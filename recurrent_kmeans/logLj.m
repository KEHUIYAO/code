% Compute the loglikelihood of one individual
function logr= logLj(lam1,lam2,tauj,cj,Nj_r,t,adj)
% input
% tauj is a vector, cj is a number, t is a vector of event times
% Nj_r the # of events for each driver

% ouput
% logr is the likelihood of one object belonging to this certain centroid
    len=length(tauj);Nj_1=zeros(1,len);
    t_sub=t(1:Nj_r);
    for i=1:len
    Nj_1(i)=sum(t_sub<=tauj(i));% # of events before the change-point
    end
    logr=(lam2-lam1)*(tauj)-lam2*cj+Nj_1*log(lam1)+(Nj_r-Nj_1)*log(lam2)+adj;
end
