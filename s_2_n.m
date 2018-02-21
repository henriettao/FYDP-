clear all; clc; close all;
%% Case 1 outputs 
[y1_1, Fs] = audioread('C1_out1_defl.wav');
c11_snr= snr(y1_1, 'aliased');
ff1 = Filtered_sound('C1_out1_defl.wav');
c11b_snr = snr(ff1, 'aliased');
c111= [c11_snr c11b_snr];
output_file= 'C1_out1_defl_filtered.wav';
audiowrite(output_file, ff1, Fs);

y2_1 = audioread('C1_out1_gauss.wav');
c21_snr= snr(y2_1, 'aliased');
ff2 = Filtered_sound('C1_out1_gauss.wav');
c21b_snr = snr(ff2, 'aliased');
c211= [c21_snr c21b_snr];

y3_1 = audioread('C1_out1_symm.wav');
c31_snr= snr(y3_1, 'aliased');
ff3 = Filtered_sound('C1_out1_symm.wav');
c31b_snr = snr(ff3, 'aliased');
c31= [c31_snr c31b_snr];

y1_2 = audioread('C1_out2_defl.wav');
c12_snr= snr(y1_2, 'aliased');
ff4 = Filtered_sound('C1_out2_defl.wav');
c12b_snr = snr(ff4, 'aliased');
c121= [c12_snr c12b_snr];

y2_2 = audioread('C1_out2_gauss.wav');
c22_snr= snr(y2_2, 'aliased');
ff5 = Filtered_sound('C1_out2_gauss.wav');
c22b_snr = snr(ff5, 'aliased');
c22= [c22_snr c22b_snr];

y3_2 = audioread('C1_out2_symm.wav');
c32_snr= snr(y3_2, 'aliased');
ff6 = Filtered_sound('C1_out2_symm.wav');
c32b_snr = snr(ff6, 'aliased');
c32= [c32_snr c32b_snr];

%% Case 2 outputs

x1_1 = audioread('Case2/C2_out1_defl.wav');
c11x_snr= snr(x1_1, 'aliased');
ff7 = Filtered_sound('Case2/C2_out1_defl.wav');
c11xb_snr = snr(ff7, 'aliased');
c112= [c11x_snr c11xb_snr];


x2_1 = audioread('Case2/C2_out2_defl.wav');
c21x_snr= snr(x2_1, 'aliased');
ff8 = Filtered_sound('Case2/C2_out2_defl.wav');
c21xb_snr = snr(ff8, 'aliased');
c212= [c21x_snr c21xb_snr];

%% Case 3 
z1_1 = audioread('Case3/C3_out1_defl.wav');
c11xx_snr= snr(z1_1, 'aliased');
ff9 = Filtered_sound('Case3/C3_out1_defl.wav');
c11xxb_snr = snr(ff9, 'aliased');
c123= [c11xx_snr c11xxb_snr];

z2_1 = audioread('Case3/C3_out2_defl.wav');
c21xx_snr= snr(z2_1, 'aliased');
ff10 = Filtered_sound('Case3/C3_out1_defl.wav');
c21xxb_snr = snr(ff10, 'aliased');
c233= [c21xx_snr c21xxb_snr];

