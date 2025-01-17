% testModel_UI.m
clc;
clear;
close all;

% Load the trained model
modelFile = fullfile('C:\Users\Casper\Desktop\cancerdetection\LungcancerDataSet\Models', 'trainedNet.mat');
if exist(modelFile, 'file')
    load(modelFile, 'trainedNet');
else
    error('Trained model file not found. Please ensure the file path is correct.');
end

% Select an image file
[file, path] = uigetfile({'*.png;*.jpg;*.jpeg', 'Image Files (*.png, *.jpg, *.jpeg)'});
if isequal(file, 0)
    disp('No file selected. Exiting program.');
    return;
end

imagePath = fullfile(path, file);
img = imread(imagePath);

% Preprocess the image
imgProcessed = imresize(img, [224, 224]); % Adjust to model input size

% Classify the image
predictedLabel = classify(trainedNet, imgProcessed);

% Display the result
figure;
imshow(img);
title(['Predicted: ', char(predictedLabel)]);

disp(['The model predicts this image as: ', char(predictedLabel)]);
