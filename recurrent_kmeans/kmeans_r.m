% find the centroid when the number of groups is given.
function [group,centroids,prob] = kmeans_r(z,Nj,C,k,tau_lower,tau_upper)
% input
% z is a matrix, each row represents a object, which contains multiple events
% Nj is a vector, each element represents the event number for the corresponding object
% C is a vector, each element represents the censoring time for the corresponing object
% k is the number of clusters the algorithm needs to cluster the objects into
% tau_lower is the lower bound for any change-point occur
% tau_upper is the upper bound for any change-point occur
	
% output
% group is a vector, each element represents the group id for the corresponding object
% centroids is a matrix, each row records a vector which contains the information about a cluster including the change-point, intensity rate before change-point and after change-point  
% prob is a vector, each element is the distance from the corresponding object to its nearest cluster

% sample sizes
m=length(Nj); 

% initialize the centroids
centroids=random_initialize(z,Nj,C,k,tau_lower,tau_upper);
group=zeros(m,1);

% set the maximum iteration to be 10, which means our algorithm assumes that the upper bound of the number of clusters are 10
iter=1;
maximum_iter=10;
temp=zeros(m,2);

% kmeans algorithm to cluster the objects
while iter<=maximum_iter
    for i=1:m
        [temp(i,1),temp(i,2)]=nearest_centroids(centroids,z,Nj,C,k,i);
    end
    % if the assignment is the same with the last time's, break the loop
    if isequal(temp(:,1),group)
        break;
    else
    % otherwise, record the current assignment, and update the parameters based on the current assignment
        group=temp(:,1);
        for i=1:k
            new_group_i=find(group==i);
            if isempty(new_group_i)
                centroids=random_initialize(z,Nj,C,k,tau_lower,tau_upper);
            else
                [a,b,c]=same_rate_f(z,Nj,C,new_group_i,tau_lower,tau_upper);
                centroids(i,:)=[a b c];
            end
        end
    end
    iter=iter+1;
end

prob=temp(:,2);

end







            
    
    
        





