%%
load("result_fake_data.mat")
%% accuracy (%)
temp=accuracy*100
accuracy=round(temp,2)
temp=num_accuracy*100
num_accuracy=round(temp,2)
%% centroids
centroids(:,2:end)=round(centroids(:,2:end)*1000,2)
centroids(:,1)=round(centroids(:,1),2)
centroids=reshape(centroids,[],1)
%% bias (%)
bias=round(bias*100,2)
bias=reshape(bias,[],1)

%% RMSE
RMSE=round(RMSE,2)
RMSE=reshape(RMSE,[],1)

%% coverage prob
coverage_rate=round(coverage_rate*100,2)
coverage_rate=reshape(coverage_rate,[],1)

%% last column is two accuracies, then true value, then centroids,then RMSE
% then bias, then coverage prob
result=[]
result(:,2:4)=[centroids RMSE bias ]
result(1:2,5)=[num_accuracy accuracy]
%% clear others
clear high low coverage 