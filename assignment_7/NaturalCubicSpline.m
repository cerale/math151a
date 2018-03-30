% Programming Problem #27

function [b,c,d] = NaturalCubicSpline(n, x_val, a_val);

%Step 1 
h = zeros(1,n);
for i=1:n
    h(i)= (x_val(i+1) - x_val(i));
end

%Step 2
for i = 2:n
    alpha(i) = (3/h(i)*(a_val(i+1) - a_val(i))) - (3/h(i-1)*(a_val(i) - a_val(i-1)));
end

%Step 3
l = zeros(1,n+1);
l(1) = 1;

mu = zeros(1,n);
mu(1) = 0;

z = zeros(1,n+1);
z(1) = 0;

%Step 4
for i=2:n
   l(i)= 2*(x_val(i+1)-x_val(i-1)) - h(i-1)*mu(i-1);
   mu(i) = h(i)/l(i);
   z(i) = (alpha(i) - h(i-1)*z(i-1))/l(i);
end

c = zeros(1,n+1);

%Step 5
for j=n:-1:1
    c(j)= z(j)-(mu(j)*c(j+1));
    b(j)= ((a_val(j+1)-a_val(j))/h(j)) - ((h(j)*(c(j+1)+2*c(j)))/3);
    d(j)= (c(j+1)-c(j))/ (3* h(j));
end