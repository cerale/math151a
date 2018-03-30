% Programming Problem #27
% FPO is the first derivative at x_0, FPN is first derivative at x_n
function [b,c,d] = ClampedCubicSpline(n, x_val, a_val, FPO, FPN);


%Step 1 
h = zeros(1,n);
for i=1:n
    h(i)= (x_val(i+1) - x_val(i));
end

%Step 2
alpha = zeros(1,n+1);
alpha(1) = ((3*(a_val(2)-a_val(1)))/h(1))-3*FPO;
alpha(n+1) = (3*FPN - 3*(a_val(n+1)-a_val(n))/h(n));

%Step 3
for i = 2:n
    alpha(i) = (3/h(i)*(a_val(i+1) - a_val(i))) - (3/h(i-1)*(a_val(i) - a_val(i-1)));
end

%Step 4
l = zeros(1,n+1);
l(1) = 2*h(1);

mu = zeros(1,n);
mu(1) = 0.5;

z = zeros(1,n+1);
z(1) = alpha(1)/l(1);

%Step 5
for i=2:n
   l(i)= 2*(x_val(i+1)-x_val(i-1)) - h(i-1)*mu(i-1);
   mu(i) = h(i)/l(i);
   z(i) = (alpha(i) - h(i-1)*z(i-1))/l(i);
end

%Step 6
l(n+1)= h(n)*(2-mu(n-1));
z(n+1) = (alpha(n-1) - h(n)*z(n))/l(n+1);
c(n+1)=z(n+1); 

%Step 7
for j=n:-1:1
    c(j)= z(j)-(mu(j)*c(j+1));
    b(j)= ((a_val(j+1)-a_val(j))/h(j)) - ((h(j)*(c(j+1)+2*c(j)))/3);
    d(j)= (c(j+1)-c(j))/ (3* h(j));
end



    
    
    
    
    
    
    
    
    




    