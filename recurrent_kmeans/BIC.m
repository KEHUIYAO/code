% calculate bic value based on the number of samples, the number of parameters in the model and the log likelihood.
function[BICValue]=BIC(n,k,logL)
BICValue = log(n)*k-2*logL;
end

