%                       horners.m
%
%  x^3-2x^2-5, x^3 + 3x^2-1
% start with initial iterate
% until you find a close enough root
% using deconv

clear all;
format compact;
format long;

pvec = [1,3,0,-1]; %coefficient vector
initial_iterate = 2;
max_iterations = 100; 
eps = 10^-4; 

iter = 1;
root_vector=[];

xn = initial_iterate; 
fn = polyval(pvec,xn); 
dfn = polyder(pvec,xn);

for i=1:(length(pvec)-1)
    while (iter < max_iterations) && (abs(fn(1)/dfn(1)) > eps)
        xn = xn - fn(1)/dfn(1);
        fn = polyval(pvec,xn); 
        dfn = polyder(pvec,xn);
        iter=iter+1;
    end
    
    if (iter ~= max_iterations)
        root_vector=[root_vector, xn];
        pvec = deconv(pvec,[1,-xn]);
        fn = polyval(pvec,xn); 
        dfn = polyder(pvec,xn);
        iter = 1; 
    else
        break;
    end 
end

if (pvec(1) == 1) && (length(pvec) == 2)
    root_vector= [root_vector, -pvec(2)];
end                

fprintf('Roots of function f(x) = x^3 + 3x^2-1: ');
root_vector

% Make a nicer output table :-)
% Submit program as just the text file of output!
%














