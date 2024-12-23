%PAT ORISMOS 
tinit=0.0;% Deksi akro p.o. tou t
tend=2.0;% Aristero akro p.o. tou t 
f = @(t,y) y.^3-t*exp(-0.5*t.^2)-exp(-1.5*t.^2);%y'(t)=f(t,y)
yexact = @(t) exp(-0.5*t.^2);%Pragmatikh Lysh 
y0=1.0;%Arxikh Synthhkh 
Ns=[200];

errs=zeros(length(Ns),1);
rates=zeros(length(Ns)-1,1);

%b = [0.25;0;0.75];
%tau = [0;1/3;2/3];
%A = [0,0,0;1/3,0,0;0,2/3,0];

b = [1/6;0;0;2/3;1/6];
tau = [0;1/3;1/3;1/2;1];
A = [0,0,0,0,0;1/3,0,0,0,0;1/6,1/6,0,0,0;0.125,0,0.375,0,0;0.5,0,-1.5,2,0];

for i =1:length(Ns)
    sol = Explicit_RK(tinit,tend,y0, A,b,tau,Ns(i),f)
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