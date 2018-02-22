clc 
clear all;
close all; 
% Manual Mixing test with RICA algorithm. 
%% case 1 
[Audio1, Fs1]= audioread('Audio_Recordings/7-laptop_mic3.wav');
[Audio2, Fs2]= audioread('Audio_Recordings/9-headphone_mic3.wav');

L=min(0.5e6, min(length(Audio1), length(Audio2)));
Audio1 = Audio1(1:L);
Audio2 = Audio2(1:L);
X(1,:)= Audio1;
X(2,:)= Audio2;
[SE, W, A]=fastica(X, 'approach', 'symm', 'numOfIC', '2', 'g','tanh', 'epsilon','0.000001', 'maxNumIterations','1000', 'maxFineTune','1000');

mkdir feb22_case1
cd
cd feb22_case1
case1_output1 ='case1_output9.wav'; 
case1_output2 ='case1_output10.wav';
audiowrite(case1_output1, SE(1,:),Fs1);
audiowrite(case1_output2, SE(2,:),Fs2);


%% case 2 

% [Audio1, Fs1]= audioread('C1 2/C1-Henr.wav');
% [Audio2, Fs2]= audioread('C1 2/C1-Kyle.wav');
% 
% L=min(0.5e6, min(length(Audio1), length(Audio2)));
% Audio1 = Audio1(1:L);
% Audio2 = Audio2(1:L);
% X(1,:)= Audio1;
% X(2,:)= Audio2;
% [SE, W, A]=fastica(X, 'approach', 'symm', 'numOfIC', '2', 'g','tanh', 'epsilon','0.000001');
% 
% mkdir feb22_case2
% cd
% cd feb22_case1
% case1_output1 ='case1_output1.wav'; 
% case1_output2 ='case1_output2.wav';
% audiowrite(case1_output1, SE(1,:),Fs1);
% audiowrite(case1_output2, SE(2,:),Fs2);

