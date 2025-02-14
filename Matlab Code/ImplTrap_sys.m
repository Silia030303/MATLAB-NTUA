 
function sol = ImplTrap_sys(a,b,Y0,N,F,JF,maxits)
    %? ???????? ??????? ??????????? ??? ??? 
    %??????? ??? ?? ????????? ?????????? ?? ???? ????.
    h=(b-a)/N;
    t=linspace(a,b,N+1);
    d=length(Y0);
    sol=zeros(d,N+1);
    sol(:,1)=Y0;
    
    for n=1:N
        Yold = sol(:,n);%TIM? LYS?S TOY PRO?OYMENOY B?MATOS
        Ynew = sol(:,n);%TREXOYSA EKTIMWMEN? TIM? LYS?S
        
        for k=1:maxits %Mesa se ayto to loop yold paramenei stathero 
                       %enw ynew allazei synexws maxits fores 
            F12=F(t(n),Yold)+F(t(n+1),Ynew);
            
            g  = Ynew-Yold - 0.5*h*F12;
            Jg = eye(d) - 0.5*h*JF(t(n+1),Ynew);

            Ynew = Ynew-inv(Jg)*g;
        end
        sol(:,n+1)=Ynew;
    end


end