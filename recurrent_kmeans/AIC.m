% calculate aic value based on the number of parameters in the model and the log likelihood.
function [AICValue]=AIC(k,logL)
% input
% k is the number of the unknown parameters
% logL is the loglikelihood of the model

% output
% AICValue is the well-known aic-value

    AICValue = 2*k-2*logL;
end