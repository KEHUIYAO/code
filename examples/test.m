clear
clc

addpath("../recurrent_kmeans/")
load('fake_data.mat');

true_centroids=[7000 100 10;51000 60 150;75000 60 30;96000 200 50]*0.001;

num_accuracy=sum(num_list==4)/40;

index=num_list==4;

index_list=1:40;

index_list=index_list(index);

centroids=[0 0 0;0 0 0;0 0 0;0 0 0];
for i=index_list
    centroids=centroids+autosort(centroids_list{i});
end
centroids=centroids./length(index_list);
bias=(centroids-true_centroids)./true_centroids;


SSE=[0 0 0;0 0 0;0 0 0;0 0 0 ];
for i=index_list
    SSE=SSE+(autosort(centroids_list{i})-true_centroids).^2;
end

RMSE=sqrt(SSE/length(index_list));
% RMSE*100
RMSE(:,2:end)=RMSE(:,2:end)*100;

accuracy=ones(1,40)*40;
for k=1:40
    
    tau=tau_list(:,k);
    cluster=group_list(:,k);
    
    for i=1:4
        group_index=find(tau==i);
        a=cluster(group_index);
        aa=length(a);
        aaa=mode(a);
        aaaa=sum(a==aaa);
        aaaaa=aa-aaaa;
        accuracy(k)=accuracy(k)-aaaaa;
    end
end
accuracy=mean(accuracy./ones(1,40)/40);

        
        
        
    

    
save result_fake_data.mat num_accuracy centroids bias RMSE accuracy