% main function of the recurrent k means algorithm, including automatically detect the number of groups and estimate the change-point, intensity rates in each group
function [num,group,centroids]=main(z,Nj,C,adj,tau_lower,tau_upper)
% the following commented function are used when faced real data analysis,
% which allows additional estimates of CI lower bound and upper bound, as
% well as the standard error of the estimates
% function [num,group,centroids,CI_lower,CI_upper,std_centroids,based_on_centroids]=main(z,Nj,C,adj,tau_lower,tau_upper)

% input
% z, Nj, C are straight forward
% adj is user-defined critical value, if we use one standard-error criteria, adj is 1.96
% tau_lower and tau_upper are user-defined
	
% output
% num is the total number of clusters
% group is the centroids index each individual belongs to
% centroids are straight forward
% CI lower bound, CI upper bound std are based on bootstrap, replicate=200
	
% if the number of input parameters equal to 3, the algorithm automatically define adj and change-point bounds
    switch nargin
    case 3
       adj=1.96;
       tau_lower=0;
       tau_upper=1000;
    end

    k=1;
    m=length(Nj);
    upper_limit=5;
    
    while k<=upper_limit
        % this section use heuristic hypothesis testing method
        [group1, centroids1,~]=kmeans_r(z,Nj,C,k,tau_lower,tau_upper);
        test_stat=test_stat(z,Nj,C,k,tau_lower,tau_upper);
        if ref_new(test_stat,centroids1,k,m,200,adj,tau_lower,tau_upper)
            k=k+1;
        else
            num=k;
            group=group1;
            centroids=centroids1;
            break
        end
        % if k exceeds the upper limit, the number of cluster is considered as the upper limit
        if k == upper_limit + 1
            num=k-1;
            group=group1;
            centroids = centroids1;
        end

    % this section use AIC criteria
    %     [group, centroids,prob]=kmeans_r(z,Nj,C,k,tau_lower,tau_upper);
    %     if k==1
    %         tempAIC = AIC(3,sum(prob));
    %         tempGroup = group;
    %         tempCentroids = centroids;
    %     else
    %         AICValue=AIC(3*k,sum(prob));
    %         if AICValue < tempAIC
    %             tempAIC = AICValue;
    %             tempGroup = group;
    %             tempCentroids = centroids;
    %         else
    %             num = k-1;
    %             group = tempGroup;
    %             centroids = tempCentroids;
    %             break
    %         end
    %     end


    % this section use BIC criteria
    %     [group, centroids,prob]=kmeans_r(z,Nj,C,k,tau_lower,tau_upper);
    %     if k==1
    % 		tempBIC=BIC(3,m, sum(prob));
    %         tempGroup = group;
    %         tempCentroids = centroids;
    %         
    % 	else
    % 		BICValue=BIC(3*k,m,sum(prob));
    %         if BICValue < tempBIC
    % 			tempBIC = BICValue;
    % 			tempGroup=group;
    % 			tempCentroids=centroids;
    % 		else
    % 			num=k-1;
    %             group = tempGroup;
    %             centroids = tempCentroids;
    % 			break	
    %         end
    %    end
    %     
    %     
    % 	% if k exceeds the upper limit, the number of cluster is considered as the upper limit
    %     if k == upper_limit
    %         num = k;
    %         break
    %     end
    % 	
    %     k = k + 1;
    % 	
    % 				
    end

    % the following section are used in the real data analysis, which give the estimate of the confidence intervals and the standard errors
    % [CI_lower,CI_upper,std_centroids]=bootstrap_r(z,Nj,C,200,num,tau_lower,tau_upper);
    % 
    % 
    % based_on_centroids=zeros(m,3);
    % for i=1:m
    %     membership=group(i);
    %     
    %     q=z(i,1:Nj(i));
    %     lambda_b=sum(q<=centroids(membership,1))/centroids(membership,1);
    %     lambda_a=(Nj(i)-sum(q<=centroids(membership,1)))/(C(i)-centroids(membership,1));
    %     based_on_centroids(i,:)=[centroids(membership,1) lambda_b lambda_a];
    % end

end
    
    
    
    
    
