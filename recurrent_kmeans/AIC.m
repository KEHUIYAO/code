function [AICValue]=AIC(k,logL)
AICValue = 2*k-2*logL;
end