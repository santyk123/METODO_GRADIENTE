%%------------------------------------------------------------------------
%% UNIVERSIDAD INTERNACIONAL DE LA RIOJA
%% Máster en Ingeniería Matemática y Computación
%% AUTOR: Santiago Alexander Rojas Porras
%%----------------------------------------------------------------
%% MÉTODO DE GRADIENTE DECRECIENTE
% Número de puntos a evaluar
res=100;
xx= linspace(-2,2,res);
yy= linspace(-2,2,res);
[x,y]=meshgrid(xx,yy); % Mallado

%% FUNCION A MINIMIZAR
z=(sin(((1/2).*(x.^2))-((1/4).*(y.^2))+3)).*(cos((2.*x)+1));

% GRÁFICA DE LA FUNCIÓN A MINIZAR
contourf(xx,yy,z)
colorbar
hold on
% GRÁFICA DE UNA SEMILLA ALEATORIA
th=rand(2)*4-2;
xp=th(1);
yp=th(2);
plot(xp,yp,'w*')
hold on

%% Desarrollo del Metodo de Gradiente

X=[xp;yp] % SEMILLA
h=0.001; % Ratio de Aprendizaje
iter=1000; % Iteraciones
n=0;    % contador para graficar
syms x y
f= (sin(((1/2).*(x.^2))-((1/4).*(y.^2))+3)).*(cos((2.*x)+1));
VF=inline([diff(f,x);diff(f,y)]);
    
for i=1:iter
    X=X-h*VF(X(1),X(2));
    n=i;
    if (mod(n,1)==0)
    plot(X(1),X(2),'r-o')
    hold on
    else
    n=i+1;
    end
end

% VALORES OPTIMOS
disp (['Los valores Optimos son (',num2str(X(1)),',',num2str(X(2)),')']);
% La funcion objetivo es
Fobj=inline(f);
Fobj(X(1),X(2));
disp (['La funcion evaluada en este punto es (',num2str(Fobj(X(1),X(2))),')']);
plot(xp,yp,'w*') %Punto Inicial
plot(X(1),X(2),'g*') %Punto Final
