function x=auto_sort(x,col_num)
switch nargin
case 1
    col_num=1;
end
% default sort by first column
[Val,Index]=sort(x(:,col_num));
x_size=size(x);
row_size=x_size(1);
x(1:row_size,:)=x(Index,:);

