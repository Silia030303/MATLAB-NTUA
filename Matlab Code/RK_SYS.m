function sol = RK_SYS(tinit,tend,Y0,N,AA,b,tau,F) 
h=(tend-tinit)/N; 
t=linspace(tinit,tend,N+1); 
d=length(Y0); 
  
  
sol = zeros(d,N+1); 
sol(:,1)= Y0 ; 
q= length(b); 
k = zeros(d,q); 
%Y=Y0; % <----- 
for n= 1:N 
     Y = sol(:,n);      
     k(:,1)=F(t(n),Y); 
     
    for i=2:q 
        tni=t(n)+h*tau(i); 
        AAk= k(:,1:i-1)*AA(i,1:i-1)'; 
        k(:,i)=F(tni,Y+h*AAk); 
    end 
    Y = Y + h*k*b; 
    sol(:,n+1)= Y; 
end 
end 