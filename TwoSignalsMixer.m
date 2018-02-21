function [X,A,S,Fs1,Fs2] = TwoSignalsMixer(Audio1,Audio2)
% mixes two auido signals and returns mixed audio 
    [S1,Fs1]=audioread(Audio1);
    [S2,Fs2]=audioread(Audio2);
    
    L= min(length(S1),length(S2));
    S1= S1(1:L);
    S2= S2(1:L);
    S=[S1(:) S2(:)]';
    
    if nargin<3
        % can use the matrix [0.5 0.5; 0.44 0.56];
        A=0.2+0.8*rand(2); 
        A=diag(1./sum(A,2))*A;
    end 
%  this value of A gives practical signal recording of tow audio inputs 
% A = [0.340226776123987	0.659773223876013; 0.409257618338637	0.590742381661363];
% returns the mixed audio as a 2xm matrix 
    X=A*S;

end
