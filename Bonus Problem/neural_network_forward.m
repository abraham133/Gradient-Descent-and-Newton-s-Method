function [output,a_1,z_1,z_2] = neural_network_forward(im,W_1,b_1,W_2,b_2)
    
% We need the values z_1,z_2 and a_1 for back propagation

% Forward Pass

% First Layer

z_1 = W_1*im + b_1;
a_1 = sigmoid(z_1);

% Second Layer

z_2 = W_2*a_1 + b_2;
a_2 = exp(z_2);

% Normalize output

output = a_2./sum(a_2); %element-wise division

end