function y = Dumb_second_derivative(x,n,m)

% the function take derivates first by m at x point 
% and then by n at again x point

step = 0.00001;
x_initial = x;
x(n) = x(n) + step;

y = (Dumb_derivative(x,m)-Dumb_derivative(x_initial,m))/step;

end