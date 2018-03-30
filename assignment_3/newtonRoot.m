%                       newtonRoot.m
%
% A Matlab script that implements Newton's method for 
% finding the roots of the non-linear equation x^3 - 3.0
%
% This is not a robust code - there is no code that 
% terminates the iteration if too many iterates are taken. 
%
fstring = 'x^3';      % target function 
dfstring = '3.0*x.^2';       % target functions derivative

x0  = 1.0;               % initial guess
eps = 1.0e-4;             % stopping tolerance
format long;              % print out in long format
format compact;           % suppress line feeds

xn  = x0;

counter = 1; 

eval(['x = xn;',fstring,';']);     % evaluate f  at xn
fn = ans; 
eval(['x = xn;',dfstring,';']);    % evaluate f' at xn
dfn = ans; 

error_vec = [x0];

while(abs(fn) > eps)      
   xn  = xn - fn/dfn;      % Newton iteration
   
   sprintf(['Count: %f'],counter)
   sprintf(['Approximate root is %-15.15f'],xn) 
   
   eval(['x = xn;',fstring,';']);     % evaluate the f  at xn
   fn = ans; 
   eval(['x = xn;',dfstring,';']);    % evaluate the f' at xn
   %dfn = ans;
   counter=counter+1;
   
   error_vec = [error_vec; (xn)];
end

alpha = [];
for i=3:length(error_vec)
   alph = (log(error_vec(i)/error_vec(i-1)))/...
       (log(error_vec(i-1)/error_vec(i-2)));
   alpha = [alpha; alph];
end
   
disp(sprintf('Error vector'));
error_vec
disp(sprintf('\nAlpha vector'));
alpha
%
% Print out final results
%
rootErr = abs(xn); %CHANGE!this should be cube root of 3
sprintf(['Approximate root of  x^2 - 3.0 is %-15.10f \n'],xn) 

sprintf(['Error in    root of  x^2 - 3.0 is %-15.10e \n'],rootErr) 