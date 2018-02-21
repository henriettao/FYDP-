function [W]= Filtered_sound(signal)
[s, Fs] = audioread(signal);                                                    
Fn = Fs/2;                                              % Nyquist Frequency (Hz)
Wp = 1000/Fn;                                           % Passband Frequency (Normalised)
Ws = 1010/Fn;                                           % Stopband Frequency (Normalised)
Rp =   1;                                               % Passband Ripple (dB)
Rs = 150;                                               % Stopband Ripple (dB)
[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                         % Filter Order
[z,p,k] = cheby2(n,Rs,Ws,'low');                        % Filter Design
[soslp,glp] = zp2sos(z,p,k);                            % Convert To Second-Order-Section For Stability
W= filtfilt(soslp, glp, s);
end 