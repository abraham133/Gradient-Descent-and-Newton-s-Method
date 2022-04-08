function label = neural_network_predict(im,W_1,b_1,W_2,b_2)

% Forward Pass
[output,~,~,~] = neural_network_forward(im,W_1,b_1,W_2,b_2);
[~,label] = max(output);

% Matlab indexing
label = label-1;

end