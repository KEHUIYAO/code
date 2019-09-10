% sort x by the column col_num in the increasing order
function x=auto_sort(x,col_num)
% input
% x is a matrix
% col_num is the specific column used to be sorted in x

% output
% x is the sorted version of x

% default sort by first column
    switch nargin
    case 1
        col_num=1;
    end
    [~,Index]=sort(x(:,col_num));
    x_size=size(x);
    row_size=x_size(1);
    x(1:row_size,:)=x(Index,:);
end


