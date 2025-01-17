% trainModel.m
clc;
clear;
close all;

% Load preprocessed data
dataFile = 'processedData.mat';
load(dataFile, 'trainDS', 'validDS');

% Extract number of classes
numClasses = numel(categories(trainDS.Labels));

% Define custom CNN architecture
layers = [
    imageInputLayer([224 224 3], 'Name', 'input')
    
    % First convolutional block
    convolution2dLayer(3, 32, 'Padding', 'same', 'Name', 'conv1')
    batchNormalizationLayer('Name', 'bn1')
    reluLayer('Name', 'relu1')
    maxPooling2dLayer(2, 'Stride', 2, 'Name', 'maxpool1')
    
    % Second convolutional block
    convolution2dLayer(3, 64, 'Padding', 'same', 'Name', 'conv2')
    batchNormalizationLayer('Name', 'bn2')
    reluLayer('Name', 'relu2')
    maxPooling2dLayer(2, 'Stride', 2, 'Name', 'maxpool2')
    
    % Third convolutional block
    convolution2dLayer(3, 128, 'Padding', 'same', 'Name', 'conv3')
    batchNormalizationLayer('Name', 'bn3')
    reluLayer('Name', 'relu3')
    maxPooling2dLayer(2, 'Stride', 2, 'Name', 'maxpool3')
    
    % Fully connected block
    fullyConnectedLayer(256, 'Name', 'fc1')
    reluLayer('Name', 'relu_fc1')
    dropoutLayer(0.5, 'Name', 'dropout')
    
    fullyConnectedLayer(numClasses, 'Name', 'fc2') % Adjust for the number of classes
    softmaxLayer('Name', 'softmax')
    classificationLayer('Name', 'output')
];

% Specify training options
options = trainingOptions('adam', ...
    'InitialLearnRate', 1e-4, ...
    'MaxEpochs', 20, ...
    'MiniBatchSize', 16, ...
    'Shuffle', 'every-epoch', ...
    'ValidationData', validDS, ...
    'ValidationFrequency', 30, ...
    'Verbose', true, ...
    'Plots', 'training-progress');

% Train the network
disp('Training the custom CNN...');
trainedNet = trainNetwork(trainDS, layers, options);

% Save the trained model
modelFile = fullfile('C:\Users\Casper\Desktop\cancerdetection\LungcancerDataSet\Models', 'trainedNet.mat');
save(modelFile, 'trainedNet');

disp(['Training complete. Model saved to: ', modelFile]);
