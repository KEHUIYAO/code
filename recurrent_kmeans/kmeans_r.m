function [group,centroids,prob] = kmeans_r(z,Nj,C,k,tau_lower,tau_upper)
m=length(Nj);   
centroids=random_initialize(z,Nj,C,k,tau_lower,tau_upper);
group=zeros(m,1);
iter=1;
maximum_iter=10;
temp=zeros(m,2);

while iter<=maximum_iter
    for i=1:m
        [temp(i,1),temp(i,2)]=nearest_centroids(centroids,z,Nj,C,k,i);
    end
    
    if isequal(temp(:,1),group)
        break;
    else
        group=temp(:,1);
        for i=1:k
            new_group_i=find(group==i);
            if length(new_group_i)==0
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







            
    
    
        





