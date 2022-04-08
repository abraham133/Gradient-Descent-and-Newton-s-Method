clc;
clear;

x_initial = [0.5;1];

[x,y] = meshgrid(0:0.1:7);
z= x.^(1/3) + y.^(1/3);

mesh(x,y,z);
xlabel('x')
ylabel('y')

% this problem is caused by discontinuity, 
% which is why complex numbers are involved in the process  

y=DumbFun_Newtons_Method(x_initial,0.0001)


