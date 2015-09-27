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
%==============================================================================
%============================================================================== 
n=0;
%para la fila llena de ceros
if x1(3,1:1:lim)==0%pregunta si toda la 3fila es cero
   n=1; 
end
if n==1
    disp('se procede a derivar');
    der=polyder(d)%la derivada
    der(length(der)+1)=0;
    x1(3,:)=der(2:2:length(der)+1);%se llena la 3fila con la derivada
    for i=4:1:N%fila
        n=1;
        for j=1:1:lim%columna
            n=n+1;
            if n<=lim
                x1(i,j)=((x1(i-1,1)*x1(i-2,n))-(x1(i-2,1)*x1(i-1,n)))/x1(i-1,1);  
            end
        end        
    end
end
x1=x1
%==============================================================================
%==============================================================================
n=0;
%para un elemento cero
for i=1:1:N
    if x1(i,1)==0 
        n=1;
        ia=i;
    end
end
if n==1
    disp('existe un elemento de cero');
    E=d;%E igual a el polinomio
    pos=find(d~=0);% se crea un vector con todas las pocisiones diferentes de 0
    E=E(pos);%se crea un vector con los valores de las pocisiones anteriores
    E=min(abs(E))/10;%E toma el valor minimo absoluto dividido entre 10
    ia=ia;
    x1(ia,1)=E;%la pocision del 0 toma el valor de E
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
    if ((x1(ia-1,1)>0 && x1(ia+1,1)>0)||(x1(ia-1,1)<0 && x1(ia+1,1)<0))% si la fila anterior y posterior son de igual signo
        disp('el sistema es criticamente estable');
    end
end
%==============================================================================
%==============================================================================
n=0;
%para estabilidad o inestabilidad
for i=1:1:N
    if x1(i,1)<0     
        n=1;
    end
end    
if n==1
        disp('el sistema es inestable');
else
        disp('el sistema es estable');
end
    


   


        

