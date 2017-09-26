% Program Code of Newton-Raphson Method in MATLAB 
% recoded by: Khakim Grey 
% ref: http://www.codewithc.com/newton-raphson-method-matlab-program/


function root = newtonraphson(func,x1,tol)


a=func;
x(1)=x1;
error=tol;
f=inline(a);
dif=diff(sym(a));
d=inline(dif);

for i=1:100
    
    n = i;
    
    x(i+1)=x(i)-((f(x(i))/d(x(i))));
    err(i)=abs((x(i+1)-x(i))/x(i));
    
    if err(i)<error
    break
    end
end

n


root=x(i);
