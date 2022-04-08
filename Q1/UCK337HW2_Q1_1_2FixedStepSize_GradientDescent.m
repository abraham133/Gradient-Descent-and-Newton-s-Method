clc;
clear;

epsilon = 10^-8; 

error = Inf;


fun=@(x,y,z) (x-4)^4 + (y-3)^2 + 4*(z+5)^4 ;

grad_fun=@(x,y,z)[4*(x-4)^3; 2*(y-3);16*(z+5)^3];

step_size=0.00001;  


x=[];
x(: , 1)=[4 ; 2 ; 2]; %initial point

i = 1;

while ~(error < epsilon)

    grad = grad_fun(x(1,i), x(2,i), x(3,i));
    
    x(:,i+1) = x(:,i) - step_size*grad;
    
    error = norm(x(:,i+1)-x(:,i));
    
    i = i + 1;
end
            
x(:,i)    
    
    
    
    
    