tinit = 0.0; tend = 1.0;  
Y0 = [1;1];  
A=[988,2023;-1001,2024]; 
F = @(t,Y) A*Y;  
JF = @(t,Y) A; 
%Yexact = @(t)[sin(t); cos(t)]; <- MALLON DEN TA XREIASTEI  
  
%����������������������������������������������������������� 
  
N=100; 
 
t=linspace(tinit,tend,N+1); 
  
%����������������� DEDOMENA IA BUTCER TABLEAU ����������������������������� 
b = [1/6;0;0;2/3;1/6]; 
tau = [0;1/3;1/3;1/2;1]; 
AA = [0,0,0,0,0;1/3,0,0,0,0;1/6,1/6,0,0,0;0.125,0,0.375,0,0;0.5,0,-1.5,2,0]; 
%�������������������������������������������������������������������������� 
  
solRK=RK_SYS(tinit,tend,Y0,N,AA,b,tau,F); 
  
plot(t,solRK,'r')