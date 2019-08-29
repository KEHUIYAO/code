% calculate aic value based on the number of parameters in the model and the log likelihood.
function [AICValue]=AIC(k,logL)
AICValue = 2*k-2*logL;
end