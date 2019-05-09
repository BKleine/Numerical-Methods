%%Bryan Kleine
%% Mech 105
%%Homework 11-False Position Algorithm Development
function [root,fx,ea,iter]= falsePosition

xl=input ('lower limit '); %lower limit
xu=input ('upper limit '); %upper limit
maxiter=input ('interations');
es=input ('stopping criteria');
if nargin < 4
    es = .00001
    maxiter=200
end
xu=zeros(maxiter,1);
xu(1,1)=xu;
xl=zeros(maxiter,1);
xl(1,1)=xl;
xR=zeros(maxiter,1);
func=input ('function');
format long
es=0.0001;
    
for i= 2 : maxiter
xR(i,1)=xu(i-1,1)-func(xu(i-1,1))*(xl(i-1,1)-xu(i-1,1))/(func(xl(i-1,1))-func(xu(i-1,1)));
if (xR(i,1)-xR(i-1,1))./xR(i-1,1)<=es;
    ea=abs((xR(i,1)-xR(i-1,1))./xR(i-1,1))
    iter=i
%     assignin('base','iter',iter_val)
    root=xR(i,1)
%     assignin('base','root',root)
fx=func(xR(i,1))
    fprintf('The number of iterations= %d',i)
else
xl(i,1)=xR(i,1);
xu(i,1)=xu(i-1,1); 
end
  
end


function f=func(x)
% f=@(x) input ('Your Function= ');
%f=x^10-1; test function
end
end
fprintf ('ea',ea)
fprintf ('function',fx)
fprintf ('root ',root)
fprintf ('iter',iter)
