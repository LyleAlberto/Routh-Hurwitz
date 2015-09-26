close all;
clear all;
clc;
disp('Ruht Horwihts')
d=input('ingresar el polinomio entre []');
poly2sym(d)%dibuja el polinomio
N=length(d);%numero de elementos del vector
mo=mod(N,2);
x1(1,:)=d(1:2:N);%llena la primer fila
if mo~=0%si es impar coloca 0 la en la fila dos ultima columna
    N1=N+1;
    d(N1)=0;
    x1(2,:)=d(2:2:N1);
else %si es par llena la fila dos normal
    x1(2,:)=d(2:2:N);
end
lim=round(N/2)%limite de columnas de la matriz
    for i=3:1:N%fila
        n=1;
        for j=1:1:lim%columna
            n=n+1;
            if n<=lim
                x1(i,j)=((x1(i-1,1)*x1(i-2,n))-(x1(i-2,1)*x1(i-1,n)))/x1(i-1,1);  
            end
        end        
    end
 x1=x1
 
 for i=1:1:N
     if x1(i,1)<0
         disp('el sistema es inestable');
     end
 end   

        

