function WhiteNoise_filter(signal)
    x=signal;
    [b,a]=butter(2,0.1,'low');
    y = filter(b,a,x);
    plot(x)
    subplot(3,1,2)
    code = x > 0.5;
    plot(y)
    subplot(3,1,3)
    plot(code)
    %sound (y, Fs);
end 