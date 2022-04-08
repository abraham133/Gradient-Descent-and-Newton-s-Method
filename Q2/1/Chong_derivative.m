function y = Chong_derivative(x,m)

step = 0.00001;
x_initial = x;
x(m) = x(m) + step; 

y = (Chong_Powell_Fun(x) - Chong_Powell_Fun(x_initial))/step;

end