clc;
clear;

epsilon_secant = 10^-9; 
epsilon_steepest = 10^-4; 

error = Inf;


fun=@(x,y,z) (x - 4)^4 + (y - 3)^2 + 4*(z + 5)^4 ;

grad_fun=@(x,y,z)[4*(x - 4)^3; 2*(y - 3);16*(z + 5)^3];

step_size=[];  


x=[];
x(: , 1)=[4 ; 2 ; -1]; %initial point

i = 1;

while ~(error<epsilon_steepest)

    grad = grad_fun(x(1,i), x(2,i), x(3,i))
    
    
    a_step=[];
    a_step(1) = 5; a_step(2) = 7;
    
     
    a = @(alpha) x(1,i) - alpha*grad(1);
    b = @(alpha) x(2,i) - alpha*grad(2);
    c = @(alpha) x(3,i) - alpha*grad(3);
    
    k=1;
     while 1

        step_fun = @(alpha) (a(alpha) - 4)^4 +(b(alpha) - 3)^2 ...
        + 4*(c(alpha) + 5)^4;
        
        a_step(k+2) = a_step(k+1) - step_fun(a_step(k+1))*(a_step(k)-...
            a_step(k+1))/(step_fun(a_step(k))-step_fun(a_step(k+1)));
        
        
        if abs(a_step(k+2) - a_step(k+1))<=epsilon_secant && a_step(k+2)>0
            result = a_step(k+2);
            break
        end
        
        if a_step(k+2)<0
            result = a_step(k+1);
            break
        end
        
        k = k + 1;
    end
    
    
        
    step_size(i) = result;
    
    x(:,i+1) = x(:,i) - step_size(i)*grad;
    
    error = norm(x(:,i+1)-x(:,i));
    
    i = i+1;
end


x(:,21)    
    
    
    
    
    