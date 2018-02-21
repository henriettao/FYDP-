close all; clear all; clc 
y1 = '9-headphone_mic 2.wav';
y2 = '7-laptop_mic 2.wav';
% mix the audio stream
%[X,A,S,Fs1,Fs2]=TwoSignalsMixer(y1,y2);
t= linspace(1,10,1e5);
[y1_r,Fs1]= audioread(y1);
[y2_r,Fs2]= audioread(y2);

% sound(y1_r,Fs1);
% playback sound from two inputs 
% sound(S,Fs1);
t= linspace(1,10,1e5);
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
S_out_1 = 'S_out_1.wav';

figure (3)
plot(t, a(1:L2));
title ('Signal Cross Correlation');

audiowrite(S_out_1, a(1:L2),Fs1);
S_out_1 = 'S_out_1.wav';
S_out_2 = 'S_out_2.wav';
% [k, fs]= audioread('S_out_1.wav');
% sound(k,fs);


%% output for y1 audio recording 
% Fastica implementation for manual mixing case 
%[SE, W] = fastica (X, 'approach', 'symm', 'g', 'tanh'); 
[SE] = fastica (S, 'approach', 'symm', '', 'tanh');
audiowrite(S_out_1, SE(1,:),Fs1);
audiowrite(S_out_2, SE(2,:),Fs2);
[S_in_1,Fs1]= audioread('S_out_1.wav');
[S_in_2,Fs2]= audioread('S_out_2.wav');
% play back recovered audio 
% sound(S_in_1,Fs1);
% sound(S_in_2,Fs2);
SNR = snr(S_in_1);
% sound(S_in_1,Fs1);
[b,a]=butter(2,0.1,'low');
y = filter(b,a,S_in_1);
% plot(t)
% subplot(3,1,2)
% code = S_in_1 > 0.5;
% plot(y)
% subplot(3,1,3)
% plot(code)
% %sound (y, fs_t);
% 
% % no SNR improvement
% % comparing signal to noise ratio after SNR improvement 
SNR_1 = snr(S_in_1);






