function loss = neural_network_loss(W_1,b_1,W_2,b_2,images,labels)

loss = 0;

% Loop through all data

[~,n_samples] = size(images);


m = n_samples;



label = labels + 1; % Because of MATLAB indexing


[output,~,~,~] = neural_network_forward(images,W_1,b_1,W_2,b_2);

y=1;

% Compute the loss on these labels
for i=1:m
    loss = loss -(y.*log(output(label(i),i)) + (1-y).*log(1-output(label(i),i)));
end
     
    
% Normalize By Number of Samples
loss = loss/n_samples;

end