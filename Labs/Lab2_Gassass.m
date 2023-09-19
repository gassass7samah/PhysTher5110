
% Task 1: Variables and Basic Operations
% 1. Create a variable called num1 and assign it the value 15.
 num1=15;

% 2. Create another variable called num2 and assign it the value 7.
 num2=7;

%3. Calculate and print the sum, difference, product, and quotient of num1 and num2.
sum_result = num1 + num2;
difference_result = num1 - num2;
product_result = num1 * num2;
quotient_result = num1 / num2;

% Task 2: Working with Vectors
% 1. Create a numeric vector called ages with the values 25, 30, 22, 40, and 28.
ages = [25, 30, 22, 40, 28];

%2. Calculate and print the average age from the ages vector.
average_age = mean(ages);

% Print the results 
fprintf('The average age is: %.2f\n', average_age);

%3. Add 5 years to each element in the ages vector and print the updated vector.
ages = ages + 5;

% Print the updated vector
fprintf('Updated ages vector: %s\n', mat2str(ages));

% Task 3: Conditional Statements
% 4. Create a variable called temperature and assign it a value (e.g., 28).
temperature = 28;

% 5. Write an if-else statement to check if temperature is above 25 degrees Celsius.
% If it is, print "It's a hot day!", otherwise print "It's a pleasant day!"

if temperature > 25
    fprintf("It's a hot day!\n");
else
    fprintf("It's a pleasant day!\n");
end

% Task 4: Looping
% 6. Using a loop (for or while), print the numbers from 1 to 10 along with their squares.
for number = 1:10
    square = number^2;
    fprintf('%d squared is %d\n', number, square)
end

% Task 5: Functions
% 7. Write a function called calculate area that calculates the area of a rectangle. 
% The function should take two arguments: length and width.
lenght=5;
width=8;

% Calculate the area of a rectangle
area = calculateArea(5,8);
   disp(area)

% The function code was moved to the end of the script butn commented below 
%function area = calculateArea(length, width)
       % area = length * width;
%end

% Task 6: Working with Data Structures
% 9. Create an empty data structure called students with three columns: name, grade, and score.
students = struct('name', {}, 'grade', {}, 'score', {});
disp(students)

% 10. Add at least 3 rows of student names per grade and three levels of grade (e.g., 4, 5, 6 or Freshman, Sophomore, Junior). 
% Create a score on a hypothetical test for each student in each grade.

% Add data for Freshmen
freshmen_names = {'Clay','Dodi','Bjorn'};
freshmen_scores = [85, 92, 58];
freshmen_grade = repmat({'Freshman'}, numel(freshmen_names), 1);

% Add data for Sophomores
sophomore_names = {'Dan','Eva','Coco'};
sophomore_scores = [79, 83, 61];
sophomore_grade = repmat({'Sophomore'}, numel(sophomore_names), 1);

% Add data for Juniors
junior_names = {'Grace', 'Harry', 'Sarah'};
junior_scores = [99, 92, 91];
junior_grade = repmat({'Junior'}, numel(junior_names), 1);

% Find the first name in the Freshman group 
disp(freshmen_names);

% Combine the data for all the stduents 
all_names  = [freshmen_names, sophomore_names, junior_names];
all_scores = [freshmen_scores, sophomore_scores, junior_scores];
all_grades = [freshmen_grade; sophomore_grade; junior_grade];

% Add data to the "students" structure array
for i = 1:numel(all_names)
    students(i).name = all_names{i};
    students(i).grade = all_grades{i};
    students(i).score = all_scores(i);
end

% 11. Calculate and print the average score of the students in each grade

% List of unique grades
unique_grades = unique({students.grade});

% Calculate and print the average scores for each grade
for g = 1:numel(unique_grades) % for loop iterates through each unique grade
    grade = unique_grades{g}; % extract the unique grade labels from the "students" structure array 
    grade_indices = strcmp({students.grade}, grade); % a logical index where elements are true if the student's grade matches the current grade or false otherwise 
    grade_scores = [students(grade_indices).score]; % subset the stdeunt grades 
    average_score = mean(grade_scores); % Calculate the average score for each grade 
    fprintf('Average score for %s: %.2f\n', grade, average_score)
end

% Writing the function at the end of the script  
function area = calculateArea(length, width)
        area = length * width;
end
