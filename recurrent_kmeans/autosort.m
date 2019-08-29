% sort x by the column col_num in the increasing order
function x=auto_sort(x,col_num)
% default sort by first column
switch nargin
case 1
    col_num=1;
end
[Val,Index]=sort(x(:,col_num));
x_size=size(x);
row_size=x_size(1);
x(1:row_size,:)=x(Index,:);

