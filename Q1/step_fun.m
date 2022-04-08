function output = step_fun(alpha,x,grad)

%We minimize this function in relation to step size(alpha) while implementing steepest descent
%operation with secant line search method

% It actually has the same format as rosenbrock function but our variable
% is step size (alpha). ceteris paribus!
[n,~] = size(x);
output=0;
 
for k=1:(n-1)
        
    output = output + 100*(x(k+1) - alpha*grad(k+1) -(x(k) - ...
        alpha*grad(k))^2)^2 + (1 - (x(k) - alpha*grad(k)))^2 ;
end 
end