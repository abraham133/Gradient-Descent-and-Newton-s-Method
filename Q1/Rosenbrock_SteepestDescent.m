function [time , iteration] = Rosenbrock_SteepestDescent(dimension)


epsilon = 0.01;
error = Inf;


iteration=0;
tic; 


for m=1:10
    
    x=4*rand(dimension,1) - 2 ;
       
    while (1)
        
        grad = Rosenbrock_Gradient(x);
        
        step_size = Rosenbrock_Secant(grad,x);
        
        error = norm(grad);
        
        if error<epsilon
            break
        end
        
        x = x - step_size*grad;
        
        iteration = iteration + 1;
    end   
    
end

iteration = iteration / 10;
time = toc / 10;


end
            
            
            
            