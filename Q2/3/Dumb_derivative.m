function y = Dumb_derivative(x,m)

step = 0.00001;
x_initial = x;
x(m) = x(m) + step; 

y = (DumbFun(x) - DumbFun(x_initial))/step;

end