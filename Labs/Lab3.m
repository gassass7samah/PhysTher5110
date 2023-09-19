% new comment
% In this lab, we will be working with resting electroencephalography data recorded under eyes open (EO)
% and eyes closed (EC) conditions, from younger adults (YA; <35) and older adults (OA; >60). 
% These data are stored as individual files in the class "data/EEG_sub_files/" folder. 

% Using these data, you will learn some basic data science skills: importing data, combining data by rows and 
% columns, splitting string variables to create new values, transforming 
% numeric variables to create new values, reformatting from long to wide format and wide to long format, etc. 

% Define the source directory path
cd 'C:/Users/lenov/OneDrive/Documents/GitHub/PhysTher5110/data/EEG_sub_files';

% 1.How many unique files are in the data/EEG_sub_files/ folder? What do code could you run to get this answer?
% There are 88 unique files in the folder and we can run the following code
% to get the count of files 

% Define the path for all folder that we want to count the files from  
folder_path ='C:/Users/lenov/OneDrive/Documents/GitHub/PhysTher5110/data/EEG_sub_files';

% Get the file count 
file_list = dir(fullfile(folder_path,'\*.csv'));
n=length(file_list);

% 2. Write a basic for loop that loops through the names of all the files and prints each name to the screen.
% We can use the previous code that defined the list of files  
file_list = dir(fullfile(folder_path,'\*.csv'));

% Get a list of all files in the folder from the previous code 
file_list = dir(fullfile(folder_path, '*.*'));

% Loop through the files and display each name
for file = file_list'
    if ~file.isdir
        disp(['File Name: ', file.name]);
    end
end

% 3. What code could you write to see if the first file name is "oa01_ec.csv"? 
% Your code should return a TRUE or FALSE.

% Check if the first file name is "oa01_ec.csv"
first_file_Oa01EcCsv = strcmp(file_list(1).name, 'oa01_ec.csv');

if first_file_Oa01EcCsv
    disp('The first file name is "oa01_ec.csv": TRUE')
else
    disp('The first file name is not "oa01_ec.csv": FALSE')
end

%  4. In the code, we provide a for-loop that imports the data from the first file, stores it, 
%imports the data from the next file, appends it to the first file, and so on until all files have 
% been imported and appended. Paste the code of that loop below and insert comments 
% (using # in R/Python or % in MATLAB).
% Your comments should explain what *every line* in the code is doing.

% Reading in the individual subjects and merging into a master file
% Read the data from the current file into a table called subject using the readtable function
file_names = dir('*.csv');
file_names = {file_names.name}';

for i = 1:10
    disp(i);
end

for i = 1:length(file_names)
    disp(file_names{i});
end

k = 0;
for i = 1:length(file_names)
    k = k + 1;
    disp(file_names{i});
    disp(k);
end

 MASTER = [];
for i = 1:length(file_names)
    name = file_names{i};
    subject = readtable(name);

    % If it's empty, assign the subject table to MASTER 
    % Add a new column to MASTER called file_id containing the name of the current file as a cell array
 if isempty(MASTER)
        MASTER = subject;
        MASTER.file_id = repmat({name}, height(subject), 1); % Create a cell array matching the number of rows
       class(file_id)

 % if MASTER is empty, create a temporary table called temp_dataset from the subject data
 % Add a new column to temp_dataset called file_id containing the name of
 % the file id

 else
        temp_dataset = subject;
        temp_dataset.file_id = repmat({name}, height(subject), 1); % Convert to a cell array
      

  % After the loop completes, MASTER will contain the combined data from all the files      
        MASTER = [MASTER; temp_dataset];
    end
end

% 5. What code could you use to remove the "X" variable from the data frame and
% relocate the "file_id" variable to the beginning of the data frame

% Remove the "X" variable
 MASTER.X = []

% Get the index of the "file_id" variable
file_id_idx = find(strcmp(MASTER.Properties.VariableNames, 'file_id'))

% Move the "file_id" variable to the beginning
if ~isempty(file_id_idx)
    MASTER = [MASTER(:, file_id_idx), MASTER(:, 1:file_id_idx - 1), MASTER(:, file_id_idx + 1:end)]
end

