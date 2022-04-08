function [time , iteration] = Rosenbrock_FixedStepSize(step_size,dimension)


epsilon = 10^-2;
error = Inf;


iteration = 0;
time = 0;

tic;

for m=1:10   

    x=4*rand(dimension,1) - 2 ;
    
    while (1)
        
        grad = Rosenbrock_Gradient(x);        
        error = norm(grad);
        
        if (error<epsilon)
            x = x - step_size*grad;
            break
        end
        
        x = x - step_size*grad;
                        
        iteration = iteration + 1;
        
    end
  
end

time = toc / 10; 
iteration = iteration / 10;
 
end

            
            
            
            