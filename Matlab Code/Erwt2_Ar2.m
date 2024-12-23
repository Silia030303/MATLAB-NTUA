%PAT ORISMOS  
tinit=0.0;% Deksi akro p.o. tou t 
tend=2.0;% Aristero akro p.o. tou t  
f = @(t,y) y.^3-t*exp(-0.5*t.^2)-exp(-1.5*t.^2);%y'(t)=f(t,y) 
yexact = @(t) exp(-0.5*t.^2);%Pragmatikh Lysh 
y0=1.0;%Arxikh Synthhkh  
Ns=[10,20,40,80]; 
  
maxits=7; 
  
errs=zeros(length(Ns),1); 
rates=zeros(length(Ns)-1,1); 
  
  
  
b = [0.75;0.25]; 
tau = [1/3;1]; 
A = [5/12,-1/12;0.75,0.25]; 
  
for i =1:length(Ns) 
    sol = Implicit_RK_FP(tinit,tend,y0, A,b,tau,Ns(i),f,maxits); 
    t = linspace(tinit, tend, Ns(i)+1); 
    errs(i) = max(abs(yexact(t)-sol)); 
end 
  
for i = 1:length(Ns)-1 
    denom = log(Ns(i+1)/Ns(i)); 
    rates(i)=log( errs(i)/errs(i+1) )/denom; 
end 
  
figure(1) 
plot(t, yexact(t),'r',t, sol, 'k--')  
  
  
errs 
rates