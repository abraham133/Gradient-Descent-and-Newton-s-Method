clear all;

% Change the filenames if you've saved the files under different names
% On some platforms, the files might be saved as 
% train-images.idx3-ubyte / train-labels.idx1-ubyte
images = loadMNISTImages('train_images.idx3-ubyte');
labels = loadMNISTLabels('train_labels.idx1-ubyte');


%% Statistics

[data_dim,n_samples] = size(images);
fprintf('Number of images on the original dataset: %d\n', n_samples)

%% Dislay a random image from data

d_index = randi(n_samples);

sample_im = images(:,d_index);

sample_im_reshaped = reshape(sample_im,28,28);
imshow(sample_im_reshaped);

fprintf('True label of this image is: %d\n', labels(d_index))

%% Get the loss with random matrices
n_neuros = 256;
W_1 = randn(n_neuros,data_dim);
b_1 = randn(n_neuros,1);

W_2 = randn(10,n_neuros);
b_2 = randn(10,1);

%loss = neural_network_loss(W_1,b_1,W_2,b_2,images,labels);

%% Now do gradient descent!

for grad_des_iter = 1:200

%sprintf('This is gradient descent iteration: %d\n', grad_des_iter)
alpha = 3.0/sqrt(grad_des_iter);


% Run on subsampled data
m = 30000;
batch_images = images(:,1:m);
batch_labels = labels(1:m);



grad_W1=zeros(n_neuros,data_dim);
grad_b1=zeros(n_neuros,1);

grad_da1 =zeros(n_neuros,m); 
grad_dz1 =zeros(n_neuros,m);

grad_W2=zeros(10,n_neuros);
grad_b2=zeros(10,1);

grad_da2 =zeros(10,m); 
grad_dz2 =zeros(10,m); 

  


im = batch_images;

[output,a_1,z_1,z_2] = neural_network_forward(im,W_1,b_1,W_2,b_2);


% Back Propagation


l=batch_labels+ 1;

y = zeros(10,m);
for k=1:m
    y(l(k),k) = 1; % for the gradient of z_2
end

%our label are always 1 for each sample because of softmax function
%the second term of derivative of loss function is 0.
grad_da2 = -(output).^-1;

%the corresponding expression to the gradient od z_2.
grad_dz2 = output - y;


grad_W2 = grad_W2 + grad_dz2*transpose(a_1);
grad_b2 = grad_b2 + grad_dz2;


grad_da1 = transpose(W_2)*grad_dz2;
grad_dz1 = grad_da1.*(a_1.*(1-a_1));


grad_W1 = grad_W1 + grad_dz1*transpose(im);
grad_b1 = grad_b1 + grad_dz1;
    
grad_b1 = sum(grad_b1,2)/m;
grad_b2 = sum(grad_b2,2)/m;
    
grad_W1 = grad_W1/m;
grad_b1 = grad_b1/m;

grad_W2 = grad_W2/m;
grad_b2 = grad_b2/m;

%loss = neural_network_loss(W_1,b_1,W_2,b_2,batch_images,batch_labels);

W_1 = W_1 - alpha.*grad_W1;
W_2 = W_2 - alpha.*grad_W2;
b_1 = b_1 - alpha.*grad_b1;
b_2 = b_2 - alpha.*grad_b2;

new_loss = neural_network_loss(W_1,b_1,W_2,b_2,batch_images,batch_labels);
fprintf('Loss at iteration %d is %f\n',grad_des_iter, new_loss)

end

%% Test it on the images
clc
close all

correct = 0;
for i=1:1000
% choose test data different from train data
d_index = m + randi(n_samples - m);

sample_im = images(:,d_index);

sample_im_reshaped = reshape(sample_im,28,28);
%imshow(sample_im_reshaped);

%fprintf('True label of this image is: %d\n', labels(d_index))

predicted_label = neural_network_predict(sample_im,W_1,b_1,W_2,b_2);
%fprintf('Predicted label of this image is: %d\n', predicted_label)
if (predicted_label==labels(d_index))
    correct = correct + 1;
end
end

accuracy = correct / 1000

