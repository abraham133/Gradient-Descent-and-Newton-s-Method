clc;
clear;


x_initial = [3; -1; 0; 1];

a = Chong_Newtons_Method(x_initial,0); % 0 means run without levenge modification

Chong_Powell_Fun(a);


% Also Chong_Newtons_Method function prints the results of x, gradient vector
% and hessian matrix at first four stage just to check whether the
% solution is true in compared to example in Chong's Book