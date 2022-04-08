function y = DumbFun_Newtons_Method(x,uk)


[n,~] = size(x);

Grad = zeros(n,1);
Hessian = zeros(n,n);

row = n;
column = n;

epsilon = 10^-2;
    j = 1;
    while(1)
        
        for k=1:n
            Grad(k) = Dumb_derivative(x(:,j),k);
        end
        
        % we find upper part of hessian
        for r=1:row
            for c=r:column
                Hessian(r,c) = Dumb_second_derivative(x(:,j),c,r);
            end
        end
        % we rearrange hessian matrix 
        for r=1:row
            for c=1:column
                Hessian(c,r) = Hessian(r,c);
            end
        end
        
        x(:,j+1) = x(:,j) - (Hessian + uk*eye(n))\Grad;
        error = norm(x(:,j+1) - x(:,j));
        
        if error < epsilon
            break
        end
        j = j+1;
    end
     
end