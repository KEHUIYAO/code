% calculate bic value based on the number of samples, the number of parameters in the model and the log likelihood.
function[BICValue]=BIC(n,k,logL)
% input
% n is the number of objects
% k is the number of unknown parameters in the model
% logL is the loglikelihood value of the model

% ouput
% BICValue is the well-known bic value
    BICValue = log(n)*k-2*logL;
end

