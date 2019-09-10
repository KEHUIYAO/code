% find the nearest centroid the object belongs to based on the cozy-distance.
function [which_centroids,prob]=nearest_centroids(centroids,z,Nj,C,k,driver_id)
% input
% centroids is a matrix, each row records a vector which contains the information about a cluster including the change-point, intensity rate before change-point and after change-point  
% z is a matrix, each row represents a object, which contains multiple events
% Nj is a vector, each element represents the event number for the corresponding object
% C is a vector, each element represents the censoring time for the corresponing object
% k is the number of clusters the algorithm needs to cluster the objects into

% output
% which_centroids is an index pointing to the largest probability 
% prob is the largest probability

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




