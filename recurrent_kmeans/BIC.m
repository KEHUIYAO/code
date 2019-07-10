function[BICValue]=BIC(n,k,logL)
BICValue = log(n)*k-2*logL;
end

