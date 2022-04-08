clc;
clear;

[x,y] = meshgrid(-5:0.1:5);

z=  exp(x+y/10);

mesh(x,y,z);
xlabel('x')
ylabel('y')
x_initial=[-0.5 ; 0.1];

y = Levenberg_Newtons_Method(x_initial,1) 
%it works thanks to the levenberg modification

