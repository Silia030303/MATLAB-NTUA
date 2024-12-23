function sol = Explicit_RK(tinit,tend,y0,A,b,tau,N,f) 
  
h=(tend - tinit)/N; 
t=linspace(tinit,tend,N+1); %???????? ?? ??? ???????? ??????? ??? ?? tinit ??? ?? tend.

  
sol = zeros(1,N+1); %[0 0 0 ... 0] 
sol(1)=y0; 
  
q = length(b);  
k = zeros(q,1); 
  
    for n = 1:N 
         
        y =sol(n); 
        k(1)=f(t(n),y); 
         
        for i=2:q 
             
            tni = t(n) +tau(i)*h; 
            k(i)=f(tni,y +h*A(i,1:i-1)*k(1:i-1)); 
        end 
         
        y =y + h*b'*k;  
        sol(n+1)=y; 
         
    end  
end