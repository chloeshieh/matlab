% Program to find root with Secant Method - Metode Numerik
% recoded by: Khakim Grey 
% ref: http://www.codewithc.com/secant-method-matlab-program/

function root = sacant(func,x1,x2,filter,tol)


a=func;
f=inline(a);
 
x(1)=x1;
x(2)=x2;
n=tol;
iteration=filter;
 
for i=3:1000
   x(i) = x(i-1) - (f(x(i-1)))*((x(i-1) - x(i-2))/(f(x(i-1)) - f(x(i-2))));
    iteration=iteration+1;
    if abs((x(i)-x(i-1))/x(i))*100<n
        root=x(i)
        iteration=iteration
        break
    end
end
