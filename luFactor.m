%%Homework 16: LU Factorization of a SQUARE MATRIX
%%created by Bryan Kleine
%%04/01/2019
%%Mech 105
%
function [L,U,P]=luFactor(A)
%A=[10,2,-1,5;2,-3,-6,2;1,1,1,5]%"coeff matrix,this comes from the Test system of equ "Test
% matrix"
%L*U*P=A
[m,n]=size(A);
L=eye(n); %identity matrix for fun maths
P=eye(n); %ID matrix
U=A;
for X=1:m-1 %elmination starts here
    pivot=max(abs(U(X:m,X)));%this is where the pivoting magic happens
    for i=X:m;
        if(abs(U(i,X))==pivot)%
            idx=i; %index
            break;
    end
end
U([X,idx],X:m)=U([idx,X],X:m);%uppper triangle, the zeros are in the lower portion
L([X,idx],1:X-1)=L([idx,X],1:X-1); %lower triangle, the zeros are in the upper
P([X,idx],:)=P([idx,X],:);% this is the magic pivoting ID matrix
for i=X+1:m
    L(i,X)=U(i,X)/U(X,X);
    U(i,X:m)=U(i,X:m)-L(i,X)*U(X,X:m);
    
end
end
%assignin used for the function input, rather than use already applied test matrix
assignin('base','L',L)
assignin('base','U',U)
assignin('base','P',P)
 end
%[L_1,U_1,P_1]=lu(A)%to test against my L,U and P