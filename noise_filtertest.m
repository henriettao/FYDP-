% This M file uses rfft.m & irfft.m
[S_in_1,Fs1]=audioread('S_out_1.wav'); %Noisy signal
%soundsc(s)
po=[0.004 0.1 0.032 1. .08 500 10 5 5 0.0001 8].'; 
% po=[0.05 0.1 0.032 0.8 0.08 1000 4 4 1.5 0.1 4].'; 
 
ns=length(S_in_1);
ts=1/Fs1;
ss=zeros(ns,1);
ni=pow2(nextpow2(Fs1*po(3)/po(8)));
ti=ni/Fs1;
nw=ni*po(8);
nf=1+floor((ns-nw)/ni);
nm=ceil(Fs1*po(4)/(ni*po(7)));
win=0.5*hamming(nw+1)/1.08;
win(end)=[];
zg=exp(-ti/po(1));
za=exp(-ti/po(2));
zo=exp(-ti/po(5));
px=zeros(1+nw/2,1);
pxn=px;
os=px;
mb=ones(1+nw/2,po(7))*nw/2;
im=0;
osf=po(11)*(1+(0:nw/2).'*Fs1/(nw*po(6))).^(-1);
  
for is=1:nf
   idx=(1:nw)+(is-1)*ni;
   x=fft(S_in_1(idx).*win);
   x2=x.*conj(x);
   pxn=za*pxn+(1-za)*x2;
   im=rem(im+1,nm);
   if im
      mb(:,1)=min(mb(:,1),pxn);
   else
      mb=[pxn,mb(:,1:po(7)-1)];
   end
   pn=po(9)*min(mb,[],2);
   %os= oversubtraction factor
   os=zo*os+(1-zo)*(1+osf.*pn./(pn+pxn));
   px=zg*px+(1-zg)*x2;
   q=max(po(10)*sqrt(pn./x2),1-sqrt(os.*pn./px)); 
   ss(idx)=ss(idx)+irfft(x.*q);
   end
soundsc(ss)
 
subplot(2,2,1); plot(s);    title('Noisy signal');          
xlabel('Time'); ylabel('Amplitude');
subplot(2,2,3); plot(ss);   title('Enhanced Speech Signal');
xlabel('Time'); ylabel('Amplitude');
subplot(2,2,2); spectrogram(s,256,224,1024,fs,'yaxis');     
title('Spectrogram of Noisy signal '); 
xlabel('Time (sec)');    ylabel('Frequency');
subplot(2,2,4); spectrogram(ss,256,224,1024,fs,'yaxis');
title('Spectrogram of Enhanced Speech Signal'); 
xlabel('Time (sec)');     ylabel('Frequency');   
