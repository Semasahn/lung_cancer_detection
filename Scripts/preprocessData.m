% preprocessData.m
% This script preprocesses images for a lung cancer detection project.
% It resizes the images and prepares data for training, validation, and testing.

clc;
clear;
close all;

% Define the folders for the dataset
dataDir = 'C:\Users\Casper\Desktop\cancerdetection\LungcancerDataSet\Data';
outputFile = 'processedData.mat'; % File to save the processed data

% Define folder paths for training, validation, and test sets
trainFolder = fullfile(dataDir, 'train');
validFolder = fullfile(dataDir, 'valid');
testFolder = fullfile(dataDir, 'test');

% Check if the folders exist
if ~isfolder(trainFolder)
    error("Training folder does not exist: " + trainFolder);
end
if ~isfolder(validFolder)
    error("Validation folder does not exist: " + validFolder);
end
if ~isfolder(testFolder)
    error("Test folder does not exist: " + testFolder);
end

% Set the size of the images for resizing
imageSize = [224, 224];

% Create datastores for each dataset
% These datastores automatically read images from the folders
trainDS = imageDatastore(trainFolder, 'IncludeSubfolders', true, 'LabelSource', 'foldernames', ...
    'ReadFcn', @(filename) resizeImage(filename, imageSize));

validDS = imageDatastore(validFolder, 'IncludeSubfolders', true, 'LabelSource', 'foldernames', ...
    'ReadFcn', @(filename) resizeImage(filename, imageSize));

testDS = imageDatastore(testFolder, 'IncludeSubfolders', true, 'LabelSource', 'foldernames', ...
    'ReadFcn', @(filename) resizeImage(filename, imageSize));

% Save the datastores to a file
save(outputFile, 'trainDS', 'validDS', 'testDS');

% Notify the user that preprocessing is done
disp('Preprocessing is complete. Data is saved to processedData.mat.');

% Function to resize images to the required size
function img = resizeImage(filename, imageSize)
    img = imread(filename); % Read the image from the file
    
    % If the image is grayscale, convert it to RGB
    if size(img, 3) == 1
        img = cat(3, img, img, img);
    end
    
    % Resize the image to the specified size
    img = imresize(img, imageSize);
    
    % Show the resized image for debugging purposes
    %figure;
    %imshow(img);
    %title('Resized Image');
    %pause(0.5); % Pause to allow viewing
end
