clc; 
clear all;
close all; 

Audio1= 'C1 2/C1-Henr.wav';
Audio2= 'C1 2/C1-Kyle.wav';
[X,A,S,Fs1,Fs2]=TwoSignalsMixer(Audio1,Audio2);
t= 0:10:2108500;
lx= length(X);
L= min(length(X), length(t));
plot(t(1:L), X(:,1:L));
title('Manual Mixing Time Dombain Response');
legend('Audio1 = C1-Henr.wav','Audio2 = C1-Kyle.wav')
sound (X, Fs1);
s= snr(X(2,:));



