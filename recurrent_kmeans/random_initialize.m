% centroids initialization function
function centroids=random_initialize(z,Nj,C,k,tau_lower,tau_upper)
    
%% kmeans++
%     m=length(Nj);
% 
%     initial_id=1:m;
%     
%     init_list=zeros(m,3);
%     
%     for i=initial_id
%         [a,b,c]=same_rate_f(z,Nj,C,i,tau_lower,tau_upper);
%         init_list(i,:)=[a,b,c];
%     end
%     
%     centroids=kmeans_plus(init_list',k);
%     
%     centroids=centroids';
%% based on change-point
m=length(Nj);

    initial_id=1:m;
    
    init_list=zeros(m,1);
    
    for i=initial_id
        [a,~,~]=same_rate_f(z,Nj,C,i,tau_lower,tau_upper);
        init_list(i)=a;
    end
    
    [idx,center]=kmeans(init_list,k);
    centroids=zeros(k,3);
    for i=1:k
            new_group_i=find(idx==i);
            
            [a,b,c]=same_rate_f(z,Nj,C,new_group_i,tau_lower,tau_upper);
            centroids(i,:)=[a b c];
    end
%  %% random assignment
%  m=length(Nj);
%  centroids=zeros(k,3);
%  idx=1:k;
%  idx=randsample(idx,m,true)
%  for i=1:k
%             new_group_i=find(idx==i);
%             
%             [a,b,c]=same_rate_f(z,Nj,C,new_group_i,tau_lower,tau_upper);
%             centroids(i,:)=[a b c];
%  end
    
end