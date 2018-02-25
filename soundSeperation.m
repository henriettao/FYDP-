function soundSeparation(Audio1, Audio2)
    Audio1= 'Audio1.wav';
    Audio2= 'Audio2.wav';
    [x1, Fs1] = audioread(Audio1);
    [x2, Fs2] = audioread(Audio2);
    m = size(x1,1); % size of each signal
    L= min(length(x1),length(x2));
    S1= x1(1:L);
    S2= x2(1:L);
    n = 2; % Number of sound sources
    A = randn(n, n); %  Random 2 X 2 mixing matrix
    S(1,:)= S1;
    S(2,:)= S2;
    x = A*S; % Mix the signals
    mx = sum(x, 2)/m; % supposed to be the mean; E{x}
    x = x - repmat(mx, 1, m); % x - E{x}
    for i = 1:n                      % This step is done
    c = cov(x');
    sq = inv(sqrtm(c));
    x = c*x;                 % to whiten the data
        [E, D] = eig(x(i)*x(i)');        % make variance one
        x(i) = E*sqrtm(inv(D))*E'*x(i);  % and uncorrelate the data)
        x(i,:) = x(i);
    end
    w = randn(n, 1); % Random weight vector
    w = w/norm(w,2); % make 'w' a unit vector
    w0 = randn(n, 1);
    w0 = w0/norm(w0, 2);
    while abs(abs(w0'*w)-1) > 0.000001
        w0 = w;
        w = x*G(w'*x)'/m - sum(DG(w'*x))*w/m; % This step is supposed to perform:
                                              % w = E{xg(w^{T}*x)} - E{g'(w^{T}*x)}w
        w = w/norm(w, 2);
    end
sound(w'*x); % Supposed to be one of the original signals

end 
