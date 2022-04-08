clc;
clear;

average_time = [];
average_iteration = [];

index = 1;

n=[2 5 10 20 100 200 300];
% for any dimension, we will obtain same result,which is the greater
% step size is (of course there is some upper limit), the less time and iteration are needed

% To avoid from extra unnecessary operations we can choose random dimension
d=randi(7) 

for step_size = 0.0001:0.00001:0.0005;
    
    [time , iteration] = Rosenbrock_FixedStepSize(step_size,d);
    
    average_time(index) = time;
    average_iteration(index) = iteration;
    
    index = index +1
end  



figure
plot(average_time)
grid
xlabel('index of alpha array')
ylabel('Average Time')
hold on

figure
plot(average_iteration)
grid
xlabel('index of alpha array')
ylabel('Average Iteration')
