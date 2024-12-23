%Implicit_RK 
function sol = Implicit_RK_FP(tinit,tend,y0,A,b,tau,N,f, maxits) 
  
h=(tend - tinit)/N; 
t=linspace(tinit,tend,N+1); 
sol =zeros(1,N+1); %[0 0 0 ... 0] 
sol(1)=y0; 
  
%q = length(b);  
k = ones(2,1); 
  
    for n = 1:N  
        y =sol(n); 
   %----------------------------------------------      
        for i=1:2 
            tni = t(n) +tau(i)*h; 
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
           %Poses fores ta treksei i loopa wste na dw pou syglinei  
           %to k mas deixnei to m  
            for m=1:maxits 
                 
                for j=1:2 %ypologizodai ola ta k se kathe vhma tis loopas 
                k(j)=f(tni,y +h*A(j,1:2)*k(1:2)); 
                end 
                 
            end 
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
     end 
    %----------------------------------------------    
        y =y + h*b'*k;  
8 
 
        sol(n+1)=y;   
    end     
end 