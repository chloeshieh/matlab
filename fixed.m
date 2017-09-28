% kim & sal rsch!
% 28/9/2017
% fixed point iteration root finder


% define var

% tebakan awal 
x1 = 8;
n = 100;
tol = 0.001;

for i=1:n
    % show 
   disp('n = ');
   disp(i);  
    
   disp('Xn = ');
   disp(x1); 
    
   %persamaan
   %fx = x1.^2-2*x1-3;
   fx = x1.^4-8*x1.^3-2*x1.^2+4*x1-100;
   
   % mencari gx
   %gx= 3/(x1-2); %--> g(Xn-1)
   %gx= (8*x1.^3+2*x1.^2-4*x1+100).^(1/4); %--> g(Xn-1) ----> (1) konvergen
   %gx= (x1.^4-2*x1.^2+4*x1-100).^(1/3); %--> g(Xn-1) ----> (2) divergen
   %gx= ((x1.^4-8*x1.^3+4*x1-100)/2).^(1/2); %--> g(Xn-1) ----> (3) divergen
   gx= ((-x1.^4+8*x1.^3+2*x1.^2+100)/4); %--> g(Xn-1) ----> (4) divergen
  
   %show data
   disp('G(Xn-1) = ');
   disp(gx);
   disp('f(Xn) = ');
   disp(fx);
   
   %disp('Xn-Gx = ');
   %disp(fx)
   
   % stop loop
   if abs(fx) <= tol 
        break
   end
   
   disp('-----------');
       
   % fill to x1 
   x1 = gx;  %--> Xn
end
