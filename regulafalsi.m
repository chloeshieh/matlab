function root = regulafalsi(func,x1,x2,filter,tol)
% Finds a bracketed zero of f(x) by bisection.
% USAGE: root = bisect(func,x1,x2,filter,tol)
% INPUT:
% func = handle of function that returns f(x).
% x1,x2 = limits on interval containing the root.
% filter = singularity filter: 0 = off (default), 1 = on.
% tol = error tolerance (default is 1.0e4*eps). -- pesisi
% OUTPUT:
% root = zero of f(x), or NaN if singularity suspected.
if nargin < 5; tol = 1.0e4*eps; end
if nargin < 4; filter = 0; end
    f1 = feval(func,x1);
if f1 == 0.0; root = x1; return; end
    f2 = feval(func,x2);
if f2 == 0.0; root = x2; return; end
if f1*f2 > 0;
    error('Root is not bracketed in (x1,x2)')
end

% n = r ----> jumlah literasi
%n = ceil(log(abs(x2 - x1)/tol)/log(2.0))

n = 100;

for i = 1:n
    % x3 --> c
    % x2 --> b
    % x1 --> a
    % f2 --> f(b)
    % f1 --> f(a)
    
    %x3 = 0.5*(x1 + x2); % diganti
    x3 = x2-(x2-x1)*f2/(f2-f1);
    f3 = feval(func,x3);

    if(filter == 1) & (abs(f3) > abs(f1))...
                    & (abs(f3) > abs(f2))
        root = NaN; return
    end
    
    if f3 == 0.0
        root = x3; return
    end

    % 0.0 = error
    if f2*f3 < 0.0
        x1 = x3; 
        f1 = f3;
        % *** f2 dibuat setengahnya untuk literasi selanjutnya 
        f2 = f2/2;
    else
        x2 = x3; 
        f2 = f3;
        
        % *** f1 dibuat setengahnya untuk literasi selanjutnya 
        f1 = f1/2;
    end
end

i

% hasil 
root=(x1 + x2)/2;
