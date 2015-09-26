close all;
clear all;
clc;
disp('Ruht Horwihts')
d=input('ingresar el polinomio entre []');
poly2sym(d)
N=length(d);%numero de elementos del vector
N1=N+1;
d(N1)=0;
mo=mod(N-1,2);
x1(1,:)=d(1:2:N);
if mo==0
x1(2,:)=d(2:2:N1);
end
    for i=3:1:N%fila
        n=1;
        for j=1:1:N-2%columna
            n=n+1;
            if n<=N-2
                x1(i,j)=((x1(i-1,1)*x1(i-2,n))-(x1(i-2,1)*x1(i-1,n)))/x1(i-1,1)
                
            end
        end
        
    end

        

