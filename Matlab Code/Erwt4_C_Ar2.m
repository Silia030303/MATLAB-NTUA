 
%§§§§§§§§ ORISMOS PAT : SYSTIMA SDE §§§§§§§§§§§§§§§§§§§§§§§ 
tinit = 0.0; tend = 1.0;  
Y0 = [1;1];  
A=[988,2023;-1001,2024]; 
F = @(t,Y) A*Y;  
JF = @(t,Y) A; 
%Yexact = @(t)[sin(t); cos(t)]; <- MALLON DEN TA XREIASTEI  
maxits =5; 
%§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ 
N1=10000; 
N2=10; 
N3=100; 
N4=1000; 
  
t1=linspace(tinit,tend,N1+1); 
t2=linspace(tinit,tend,N2+1); 
t3=linspace(tinit,tend,N3+1); 
t4=linspace(tinit,tend,N4+1); 
  
solImplTrap_1 = ImplTrap_sys(tinit,tend,Y0,N1,F,JF,maxits); %h=0.0001 
solImplTrap_2 = ImplTrap_sys(tinit,tend,Y0,N2,F,JF,maxits);   %h=0.1 
solImplTrap_3 = ImplTrap_sys(tinit,tend,Y0,N3,F,JF,maxits);  %h=0.01 
solImplTrap_4 = ImplTrap_sys(tinit,tend,Y0,N4,F,JF,maxits); %h=0.001 
  
  
figure(1) 
plot(t1,solImplTrap_1,'r') 
figure(2) 
plot(t2,solImplTrap_2,'b') 
figure(3) 
plot(t3,solImplTrap_3,'y') 
figure(4) 
plot(t4,solImplTrap_4,'g')