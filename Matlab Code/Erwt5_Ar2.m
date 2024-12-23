a=0.0;  
b=1.0;  
A=0.0;  
B=2.0; 
  
k = 0.0; 
r =@(x) 10^k; 
f =@(x) -12*x.^2 + 10^(k)*x.*(x.^(3) -2); 
  
uexact=@(x) x.*(x.^(3) -2); 
%§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ 
  
%Ns=[10,1000,2000,3000]; 
Ns=[5,9,999]; 
errs =zeros(length(Ns),1); 
rates=zeros(length(Ns)-1,1); 
  
for i=1:length(Ns) 
    U = FDM_Dirichlet_Neumann(a,b,A,B,r,f,Ns(i)); 
    x = linspace(a,b,Ns(i)+2); 
    errs(i) = max(abs(uexact(x)-U)); 
end 
  
for i=1:length(Ns)-1 
     
    den=log(Ns(i+1)/Ns(i)); 
    rates(i)=log(errs(i)/errs(i+1))/den; 
     
end 
  
errs 
rates 
cond_U = cond(U); 
cond_U