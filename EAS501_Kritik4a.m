%Trade-off between the truncation error in derivative approximations and floating-point errors.
%%Function of a single variable!
function [df] = EAS501_Kritik4a(f, x, h, order)

%%%%%%%CONDITION CHECK START%%%%%%%%
%%checking order
if order~=1 && order~=2
    disp("Order is other than 1 or 2, re enter!")
    return %it will take out from the function
end 

%Checking size of x and h to check array 
[pp,oo]=size(x); %size of x
[ii,uu]=size(h); %size of h
%if both are array condition check
if (pp>1 || oo>1) && (ii>1 || uu>1)
    disp("Both x and h can't be array, re enter")
    return %it will take out from the function
end    
%%%%%%%%%%CONDITION CHECK END%%%%%%%%%%%

xh=x+h; %(x+h)
xm=x-h; %(x-m)

%n=whichever is an array
n=max(length(x),length(h)); %array length

if order==1 %order=1 finite difference formula
%if x is an array
    if length(x)>length(h)
        for i=1:n
         ff(i)=((f(xh(i))-f(x(i)))/h) + h; %O(H)
        end    
%if h is an array
    else
        for i=1:n
         ff(i)=((f(xh(i))-f(x))/h(i)) + h(i); %O(H)
        end
    end    
end

if order==2 %order=2 finite difference formula
%if x is an array
    if length(x)>length(h)
        for i=1:n
         ff(i)=((f(xh(i))-f(xm(i)))/(2*h)) + (h^2); %O(H^2)
        end    
%if h is an array
    else
        for i=1:n
         ff(i)=((f(xh(i))-f(xm(i)))/(2*h(i))) + (h(i)^2); %O(H^2)
        end
    end  
end

df=ff; %return df
end