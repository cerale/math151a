%                       newtonRoot.m
%
% A Matlab script that implements Aitken's method
%
%

%Normal fixed point iteration
p=inline('(-1).^(n)./(n+1)')

aitken=[ 0,0,0]
for n=1:100
    pn=p(n)
    pn1=p(n+1);
    pn2=p(n+2);
    pnhat=pn-((pn1-pn)^2)/(pn2-2*pn1+pn);
    aitken=[aitken; n,pn,pnhat];
%     if abs(pnhat)<=5*1E-10
%         break;
%     end
end

% if abs(pnhat)>5*1E-2
%     disp('fail to find root with Aitken delta square method');
% else
    disp('                 Aitken delta^2 method')
    disp('         Iteration       pn        pnhat')
    disp(aitken)
% end 

figure 
plot(aitken,'.')


