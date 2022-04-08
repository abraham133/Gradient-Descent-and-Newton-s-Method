function output = Rosenbrock_Gradient(x)

[n,~]=size(x);

%% Numerical Derivative 
% e = 0.00001;
% output=zeros(n,1);
% for i=1:n
%     initial = x ;
%     x(i) = x(i) + e;
%     output(i) = (RosenbrockFun(x) - RosenbrockFun(initial))/e;
% end


%% Analytical Derivative (We are using this method to be able run faster )
grad = zeros(n,1);
for k=1:n
    if k==1
        grad(k,1) = -400*x(k)*(x(k+1) - x(k)^2)-2*(1-x(k));
    elseif k==n
        grad(k,1) = 200*(x(k) - x(k-1)^2);
    else
        grad(k,1) = -400*x(k)*(x(k+1) - x(k)^2)-2*(1-x(k)) ...
                   + 200*(x(k) - (x(k-1)^2));
    end        
end

output = grad ;

end