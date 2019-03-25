function [xponto] = lorenz_rk(parametros,x)

%x(1) eixo x
%x(2) eixo y 
%x(3) eixo z

%Parametros(1) sigma
%Parametros(2) r
%Parametros(3) b

xponto(1) = parametros(1)*(x(2)-x(1));
xponto(2) = parametros(2)*x(1)-x(2)-x(1)*x(3);
xponto(3) = x(1)*x(2)-parametros(3)*x(3);

xponto = xponto';


