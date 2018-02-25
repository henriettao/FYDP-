clc 
clear all;
close all; 
% Manual Mixing test with fastICA algorithm. 
%% case 1 
% read audio files from file path 
[Audio1, Fs1]= audioread('recording1.wav');
[Audio2, Fs2]= audioread('recording1.wav');

% find the minimum length and trim length of longer file 
L=min(0.5e6, min(length(Audio1), length(Audio2)));
Audio1 = Audio1(1:L);
Audio2 = Audio2(1:L);
% add trimmed audio to a 2xm matrix where m is the length L 
X(1,:)= Audio1;
X(2,:)= Audio2;

% run fastICA to recover independent components 
[SE, W, A]=fastica(X, 'approach', 'symm', 'numOfIC', '2', 'g','tanh', 'epsilon','0.000001', 'maxNumIterations','1000', 'maxFineTune','1000');


% makes new directory to store output from fastICA 
mkdir feb22_case1
cd
cd feb22_case1
case1_output1 ='case1_output#.wav'; 
case1_output2 ='case1_output#.wav';

% writes output file to .wav files and saves it 
audiowrite(case1_output1, SE(1,:),Fs1);
audiowrite(case1_output2, SE(2,:),Fs2);




