function sol = BDF3(a,b,y0,N,f,Df,maxits1,maxits2) 
    
    h=(b-a)/N; 
    t=linspace(a,b,N+1); 
    sol=zeros(1,N+1); 
    sol(1)=y0;  
     
    %§§§§§§§§§§§§ IMPLICIT TRAPEZIOU §§§§§§§§§§§§§§§§§ 
    for n=1:2   
        yold = sol(n);  
        ynew = sol(n);  
        for k = 1:maxits1 
           f12=f(t(n),yold)+f(t(n+1),ynew); 
           ynew=yold + 0.5*h*f12; 
           yold = ynew; 
        end 
        sol(n+1)= ynew;   
    end  
    %§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ 
     
    for n = 1:N-2 
        Y0=sol(n); 
        Y1=sol(n+1); 
        Y2=sol(n+1); 
        %Y3=sol(n+2);  
         
        %§§§§§§§§§§§§ NEWTON RAPHSON §§§§§§§§§§§§§§§§§§§§ 
        for m = 1:maxits2 
            f2 = f(t(n+2),Y2); 
             g = 3*Y2 - 4*Y1 + Y0 -2*h*f2; 
            Dg = 3.0 - 2*h*Df(t(n+2),Y2); 
            Y2 = Y2 - g/Dg; 
        end 
        %§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ 
         
        sol(n+2) = Y2;  
    end 
     
end