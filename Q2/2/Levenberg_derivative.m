function y = Levenberg_derivative(x,n)

step = 0.00001;
x_initial = x;
x(n) = x(n) + step; 

y = (Levenberg_ModificationFun(x) - Levenberg_ModificationFun(x_initial))/step;

end