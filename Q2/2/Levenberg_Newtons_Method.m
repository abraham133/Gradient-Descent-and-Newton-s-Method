function y = Levenberg_Newtons_Method(x,logical)

if logical == 1
    levenberg = 0.0001;
else
    levenberg = 0;
end

[n,~] = size(x);
Grad = zeros(n,1);
Hessian = zeros(n,n);

row = n;
column = n;

epsilon = 10^-2;

    j = 1;
    while(1)
        
        for k=1:n
            Grad(k) = Levenberg_derivative(x(:,j),k);
        end
        
        
        for r=1:row
            for c=r:column
                Hessian(r,c) = Levenberg_second_derivative(x(:,j),c,r);
            end
        end
        
        for r=1:row
            for c=1:column
                Hessian(c,r) = Hessian(r,c);
            end
        end
        x(:,j+1) = x(:,j) - (Hessian + levenberg*eye(n))\Grad;
        error = norm(x(:,j+1) - x(:,j));
        
       
        if error < epsilon
            break
        end
        j = j+1;
    end
y = x(:,j+1);
end