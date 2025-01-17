% validateModel.m
clc;
clear;
close all;

% Load the trained model
modelFile = fullfile('C:\Users\Casper\Desktop\cancerdetection\LungcancerDataSet\Models', 'trainedNet.mat');
load(modelFile, 'trainedNet');

% Load validation data
dataFile = 'processedData.mat';
load(dataFile, 'validDS');

% Evaluate the model on validation data
disp('Evaluating the model on validation data...');
predictedLabels = classify(trainedNet, validDS);
trueLabels = validDS.Labels;

% Calculate validation accuracy
validationAccuracy = mean(predictedLabels == trueLabels);
disp(['Validation Accuracy: ', num2str(validationAccuracy * 100), '%']);

% Display the confusion matrix
figure;
confusionchart(trueLabels, predictedLabels);
title('Validation Confusion Matrix');
