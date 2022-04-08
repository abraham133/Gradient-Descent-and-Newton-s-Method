clc;
clear;

average_time = [];
average_iteration = [];


n=[2 5 10 20 100 200 300];

for i=1:7
    
    dimension = n(i);

    [time , iteration] = Rosenbrock_SteepestDescent(dimension);
    
    average_time(i) = time ;
    average_iteration(i) = iteration;

end


figure
plot(average_time)
grid
xlabel('index of dimension array')
ylabel('Average Time')
hold on

figure
plot(average_iteration)
grid
xlabel('index of dimension array')
ylabel('Average Iteration')