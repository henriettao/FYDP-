clc; clear all; close all; 
[y, Fs]= audioread('9-headphone_mic.wav');
[x, Fs]= audioread('7-laptop_mic.wav');
figure()
plot(psd(spectrum.periodogram,y,'Fs',Fs,'NFFT',length(y)));

figure()
plot(psd(spectrum.periodogram,x,'Fs',Fs,'NFFT',length(x)));
