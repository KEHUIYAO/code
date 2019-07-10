function [which_centroids,prob]=nearest_centroids(centroids,z,Nj,C,k,driver_id)
    likelihood=zeros(1,k);
 
    event_list=z(driver_id,:);
    cj=C(driver_id);
    nj=Nj(driver_id);
    q=event_list(1:nj);
    
    for i=1:k
        params=centroids(i,:);
        likelihood(i)=logLj(params(2),params(3),params(1),cj,nj,q, ...
                            0);
    end
    
    [prob,which_centroids]=max(likelihood);
    
    
end




