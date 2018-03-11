function [S1,S2, W, A, X]= ICA_soundseparation(Audio1,Audio2)
%codegen
[Audio_1, Fs1]= audioread(Audio1);
[Audio_2, Fs2]= audioread(Audio2);
% W=0.2+0.8*rand(2); 
% W=diag(1./sum(W,2))*W;

L=min(0.5e6, min(length(Audio_1), length(Audio_2)));
Audio_1 = Audio_1(1:L);
Audio_2 = Audio_2(1:L);
X = zeros(2,L);
X(1,:)= Audio_1;
X(2,:)= Audio_2;

t =size(X);
t =t(1,2); 
Q = X(:,1:t)*X(:,1:t)';
[W,D] = eig(X*X',Q);       % compute unmixing matrix W 
S = W*X;
A = inv(W);
S1 = S(1,:);
S2 = S(2,:);

sound(S1,Fs1);
end 