%RECOCIDO SIMULADO V1.04
%UNIVERSIDAD FRANSISCO JOSE DE CALDAS, BOGOTA D.C
%Brian Giovanny Alfonso Rodriguez 20151020600
                %RECOCIDO SIMULADO
%----------------------------------------------------------------%
clear 
clc
%V1.0.0%
%Variables
%fucion objtivo
syms x y q
%1-------------------------------------------------------------
z=(9*x)+(24*y)+(x*y)-(x^2)-(6*y^2);
z2=(9*x)+(24*y)+(x*y)-(x^2)-(6*y^2)-(q*abs(x+5*y-30));
%2-------------------------------------------------------------
c=0.8;
Ra(1,1)=(-0.5);
Ra(1,2)=(0.5);
k=1;
q=10;
n=1;
nIteraciones = 500;
%se generan 4 soluciones random
i = 1;
%{
auxSoluciones=[];
x=24.4417;
y=3.7942;
auxSoluciones(1)=eval(z);
promedio=eval(z);
x=27.1738;
y=0.5852;
auxSoluciones(2)=eval(z);
promedio=eval(z)+promedio;
x=3.8096;
y=1.6710;
auxSoluciones(3)=eval(z);
promedio=eval(z)+promedio;
x=27.4013;
y=3.2813;
auxSoluciones(4)=eval(z);
promedio=eval(z)+promedio;
%}
%33.05?
%3--------------------------------------------------------------------------------
%
promedio=0;
while i < 5
    a=aleatorios();
    x1=a(1);
    x=a(1);
    y1=a(2);
    y=a(2);
    auxSoluciones(i)=eval(z);
    promedio= promedio+auxSoluciones(i);
    i=i+1;
end
%
TI=promedio/4; %temeratura inicial
%4--------------------------------------------------------------------------------
% s elgie una funcion con x, y aleatorios 
    xAct=rand()*30;
    yAct=(30-x)/5;
    
    x=xAct;
    y=yAct;
    v=[];
    i=1;
%5--------------------------------------------------------------------------------
    while i <nIteraciones
        fxy=eval(z2);
        v(1,1)=xAct+Ra(1,1);
        v(1,2)=xAct+Ra(1,2);
        v(2,1)=yAct+Ra(1,1);
        v(2,2)=yAct+Ra(1,2);
        u1=rand();
        u2=rand();
        %u1=0.25;
        %u2=0.14;
        r1=v(1,1)+(u1*(v(1,2)-v(1,1)));
        r2=v(2,1)+(u2*(v(2,2)-v(2,1)));
        x=r1;
        y=r2;
        fr1r2=eval(z2);
        %6--------------------------------------------------------------------------------
        %aceptar o no la solucion
        if fr1r2 < fxy
            P=exp((-(fr1r2-fxy))/(k*TI));
            A=rand();
            %A=0.374,;
            if(A<P)
                %se acepta
                
                x=r1;
                y=r2;
                xAct=r1;
                yAct=r2;
                TI=TI*c;
            else
                x=xAct;
                y=yAct;               
            end  
        else
             xAct=r1;
             yAct=r2;     
             x=r1;
             y=r2;
            TI=TI*c;
        end
        
        i=i+1;
    end  
"SOLUCION: "+ fxy +" CON X= " + x + ", Y= "+ y     

%7--------------------------------------------------------------------------------

%-----------------------------FUNNCIONES----------------------------------%
%generacion aleatorios-
function a=aleatorios()
    x=rand()*(30);
    y=(30-x)/5;
    a=[x,y]  ;
end
%---------------------------------------------------------------------------------%