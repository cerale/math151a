%Assignment 7.1 Test (Clamped)

%Curve 1: 
x=[1,2,5,6,7,8,10,13,17];
a=[3.0,3.7,3.9,4.2,5.7,6.6,7.1,6.7,4.5];
fpo=1;
fpn=-0.67;
n=8;

[b,c,d] = ClampedCubicSpline(n,x,a,fpo,fpn);

m=100;
%Graph Spline 1
spline_x = zeros(m,n);
spline_y = zeros(m,n);
hold on; 
for i=1:n
    spline_x(:,i) = linspace(x(i),x(i+1),m);
    spline_y(:,i) = a(i) + b(i)*(spline_x(:,i)-x(i)) + ...
        c(i)*(spline_x(:,i)-x(i)).^2 + d(i)*(spline_x(:,i)-x(i)).^3;
    plot(spline_x(:,i),spline_y(:,i)); 
end


%graph spline 1

%Curve 2:
x2=[17,20,23,24,25,27,27.7];
a2=[4.5,7.0,6.1,5.6,5.8,5.2,4.1];
fpo2=3.0;
fpn2=-4.0;
n2=6;

[b2,c2,d2] = ClampedCubicSpline(n2,x2,a2,fpo2,fpn2);

%Graph splines 2:
spline_x2 = zeros(m,n2);
spline_y2 = zeros(m,n2);
hold on; 
for i=1:n2
    spline_x2(:,i) = linspace(x2(i),x2(i+1),m);
    spline_y2(:,i) = a2(i) + b2(i)*(spline_x2(:,i)-x2(i)) + ...
        c2(i)*(spline_x2(:,i)-x2(i)).^2 + d2(i)*(spline_x2(:,i)-x2(i)).^3;
    plot(spline_x2(:,i),spline_y2(:,i)); 
end

%Curve 3:
x3=[27.7,28,29,30];
a3=[4.1,4.3,4.1,3.0];
fpo3=0.33;
fpn3=-1.5;
n3=3;

[b3,c3,d3] = ClampedCubicSpline(n3,x3,a3,fpo3,fpn3);

%Graph splines 3: 
spline_x3 = zeros(m,n3);
spline_y3 = zeros(m,n3);
hold on; 
for i=1:n3
    spline_x3(:,i) = linspace(x3(i),x3(i+1),m);
    spline_y3(:,i) = a3(i) + b3(i)*(spline_x3(:,i)-x3(i)) + ...
        c3(i)*(spline_x3(:,i)-x3(i)).^2 + d3(i)*(spline_x3(:,i)-x3(i)).^3;
    plot(spline_x3(:,i),spline_y3(:,i)); 
end




