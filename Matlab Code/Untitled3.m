%PAT ORISMOS 
a=0.0;% Deksi akro p.o. tou t
b=2.0;% Aristero akro p.o. tou t 
f = @(t,y) y.^2+(-11*t+1)*exp(-5.5*t.^2+t)-exp(-11*t.^2+2*t);%y'(t)=f(t,y)
yexact = @(t) exp(-5.5*t.^2+t);%Pragmatikh Lysh 
y0=1;%Arxikh Synthhkh 
Ns=[10,20,40,80];%? ??????? ??? ???????.