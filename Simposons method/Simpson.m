%%mech 105
%%Bryan Kleine

function[I]=Simpson(x,y)

if nargin>2
    error('an x and y row matirx are required to perfom the simpsons rule')
 elseif length(x)~=length(y)
     error('arrays x and y must be equal in length')
elseif isequal(diff(x),circshift(diff(x),1))==0
         error('x must be equally spaced')
 else
 end
  %check for trap method/rule needed          
if floor(length(x)/2)==length(x)/2
    need_trap_rule=0;
    warning('Trap rule will be used for the last inter')
else 
    need_trap_rule=1;
end
%use 1/3 rule
if need_trap_rule==0
    %1/3 w/out trap rule
    for i=1:length(x)/2
        k=[1 2 3];
        k=k+2*(i-1);
        simsum(i)=1/6*(x(k(3))-x(k(x)))*(y(k(1))+4*y(k(2))+y(k(3)));
    end
else
    % one iter of trap rule is/needed
    for i=1:floor(length(x)/2)-1 
       k=[1 2 3];
       k=k+2*(i-1);
       simsum(i)=1/6*(x(k(3))-x*(k(1)))*(y(k(1))+4*y(k(2))+y(k(3)));
    end
    simsum(i+1)=(x(length(x))-x(length(x)-1))*(y(length(y))+y(length(y)-1))/2;
end
I= sum(simsum);
end