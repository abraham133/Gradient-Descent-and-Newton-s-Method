function output = Rosenbrock_Secant(grad,x)

[n,~] = size(x);

alpha=[0.00001,0.00003]; %random initial value

j=1;
controller = 1;

while (controller)
       
    alpha(j+2)= alpha(j+1) - step_fun(alpha(j+1),x,grad)*(alpha(j)-alpha(j+1))/(step_fun(alpha(j),x,grad)-step_fun(alpha(j+1),x,grad));
               
                
    if abs(alpha(j+2)-alpha(j+1))<10^-5 && alpha(j+2)>0
        step_size = alpha(j+2);
        controller = 0;
    end
           
    if alpha(j+2)<0
        step_size = 0.00005;
        controller = 0;
    end
    j=j+1;
end
    output = step_size;
end

