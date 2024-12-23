 
a = 0.0;% Deksi akro p.o. tou t 
b = 2.0;% Aristero akro p.o. tou t  
y0 = 1.0;%Arxikh Synthhkh  
  
%Ns=[20,40,80,160]; 
%Ns=[200 ,330]; 

f = @(t,y) y.^2+(-11*t+1)*exp(-5.5*t.^2+t)-exp(-11*t.^2+2*t);%y'(t)=f(t,y)
Df = @(t,y) 2*y;
  
yexact = @(t) exp(-5.5*t.^2+t);%Pragmatikh Lysh 

Ns=[1000,2000,4000]; 
%Ns=[200 ,330]; 


maxits1=5; 
maxits2=3;   
errsBDF3=zeros(length(Ns),1); 
ratesBDF3=zeros(length(Ns)-1,1); 
  
for i =1:length(Ns) 
     
    solBDF3 = BDF3(a,b,y0,Ns(i),f,Df,maxits1,maxits2) 
    t = linspace(a, b, Ns(i)+1); 
    errsBDF3(i) = max(abs(yexact(t)-solBDF3)); 
  
end 
  
for i = 1:length(Ns)-1 
   denom=log(Ns(i+1)/Ns(i)); 
   ratesBDF3(i)=log(errsBDF3(i)/errsBDF3(i+1))/denom; 
end 
  
errsBDF3 
ratesBDF3 
  
figure(1)% gia na mas dwsei ayta poy grapsame se m;ia eikona 
plot( t, yexact(t),'r', t, solBDF3, 'k--') 
%mou deixnei se legada poia einai poia  
legend('exact','BDF3') 