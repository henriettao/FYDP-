% This plots the time domain response of audio inputs 
close all; clear all; clc 
y1 = 'input1.wav';
y2 = 'input2.wav';

% mix the audio stream
%[X,A,S,Fs1,Fs2]=TwoSignalsMixer(y1,y2);
% initialize time axis 
t= linspace(1,10,1e5);
% reads the audio files 
[y1_r,Fs1]= audioread(y1);
[y2_r,Fs2]= audioread(y2);


% playback sound from two inputs mixture 
% sound(S,Fs1);
t= linspace(1,10,1e5);
% find min lenghtof two audio files 
L1= min(length(y1_r),length(y2_r));
s1_r= y1_r(1:L1);
s2_r= y2_r(1:L1);
S=[s1_r(:) s2_r(:)]';
sound(S, Fs1);
L2= min(length(t), length(y1_r));

%% Time Domain response of signals 
figure(1)
plot (t,y1_r(1:L2)');
title('Time Domain Response of Source 1');
legend('Source 1');
 
figure (2)
plot (t,y2_r(1:L2)');
title('Time Domain Response of Source 2');
legend('Source 2');

%% Signal Cross Correlation  
% S_out_1 = 'S_out_1.wav';

%figure (3)
% plot(t, a(1:L2));
% title ('Signal Cross Correlation');

% audiowrite(S_out_1, a(1:L2),Fs1);
% S_out_1 = 'S_out_1.wav';
% S_out_2 = 'S_out_2.wav';









