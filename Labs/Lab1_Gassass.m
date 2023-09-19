
% 1 Create a vector A that has four values 1, 1, 1, 1
A = [1,1,1,1];

% 2 Create a vector B that have two values 2, 3.
B = [2, 3];

% 3 Repeat vector B to match the length of A
B_repeated = repelem(B, ceil(length(A) / length(B)));

% Perform element-wise multiplication
C = A .* B_repeated;

% Display the result
disp(C)

% 4 Write a for-loop that counts from 1 to 10 and outputs the current value at every step. 
for i = 1:10
    fprintf('Current value: %d\n', i);
end

% 5 Write a for-loop that counts from 1 to 10 and outputs the sum of all previous values up to that point at every step.
% Initialize a variable to store the sum
sum_so_far = 0; 
for i = 1:10
    sum_so_far = sum_so_far + i;
    fprintf('Sum of values up to %d: %d\n', i, sum_so_far);
end 

% 6 Create a data frame with 40 simulated participants, 20 males and 20 females.
% Simulate normally distributed heights for each of these groups using the values given in the 
% Lab 01 script file. How can you most efficiently calculate the mean and the standard deviation
% for the males and females? (Hint. We did not directly show you how to do this.
% This will mostly be an exercise in creative thinking, searching the web, and working together!)

% Create a cell array of character vectors for sex
sex = [repmat({'Male'}, 20, 1); repmat({'Female'}, 20, 1)];

% Define the heights based on the provided values in lab 1
height = [normrnd(67, 2.5, 20, 1); normrnd(64, 2.2, 20, 1)];

% Create a table 
data = table(sex, height, 'VariableNames', {'Sex', 'Height'});

% Display the table
disp(data);

% Calculate the mean and standard deviation for males and females
Stats = grpstats(data, 'Sex', {'mean', 'std'}, 'DataVars', 'Height');

% Display the results
disp(Stats);

% 8 Create a plot that shows height as a function of sex for your 40 simulated participants.
% Insert your plot in the document below. 

% Create a boxplot of height vs. sex
% Plotting
figure;
boxplot(data.Height, data.Sex);
xlabel('Sex');
ylabel('Height');

saveas(gcf, 'my_figure.png');




