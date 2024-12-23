function U = FDM_Dirichlet_Neumann(a,b,A,B,r,f,N) 
h=(b-a)/(N+1);  
x=linspace(a,b,N+2); %x=linspace(a,b,N+2);  
U=zeros(1,N+2); %<------ oxi U=zeros(1,N+2); 
U(1)=A;  
%U(N+1)= B;%<---------- mipws U(N+2)= U(N+1)+2*B*h; 
  
  
a1     =(-1/h^2)*ones(N,1); %katw diag 
a1(N-1)= -2/(h^2); 
  
a2=(2/h^2)*ones(N,1)+r(x(2:N))' ; %diag 
  
a3= (-1/h^2)*ones(N,1); %anw diag 
  
  
M = spdiags([a1,a2,a3],[-1,0,1],N,N); 
  
%Ta afksisa ola kata mia (+1) diastasi  
F = f(x(2:N+1))'; 
F(1) = f(x(2)) + A/(h^2);  
F(N) = f(x(N+1)) + 2*B/h; 
  
Uint = M\F; %lisi systimatos 
  
U(2:N+1)=Uint'; 
U(N+2)= U(N)+2*B*h; 
end%Uint dianysma stili enw to U einai dianysma rammi 