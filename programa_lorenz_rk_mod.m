clc; close all; clear all;

%Parâmetros das equações
sigma = 10;
r = 28;
b = 8/3;

%vetor com os parâmetros, para "despoluir" a entrada da função
parametros = [sigma;r;b];

%Condições iniciais
condicoesiniciais = [1;  1;  1]; 
x(1,:) = condicoesiniciais';

%Passos da Integração
deltat = 0.001;
npontos = 50000;

%Cálculo dos argumentos do Runge-Kutta 

for i = 2:npontos,
   
        k1 = lorenz_rk(parametros,x(i-1,:)')*deltat;
        k2 = lorenz_rk(parametros,x(i-1,:)'+0.5*k1)*deltat;
        k3 = lorenz_rk(parametros,x(i-1,:)'+0.5*k2)*deltat;
        k4 = lorenz_rk(parametros,x(i-1,:)'+k3)*deltat;
     
    % Passo para atualizar o novo valor do vetor x  
    x(i,:) = x(i-1,:)' +(k1+2*k2+2*k3+k4)/6;
    t(i) = deltat*i;
end

%GRÁFICOS
%Atrator de Lorenz
letra = 16;
graf = 12.5;

figure(1);
subplot(221); plot3(x(:,1),x(:,2),x(:,3));
%title('Atrator de Lorenz');
set(gca,'FontSize',graf)
xlabel('$x(t)$','Interpreter','LaTex','FontSize',letra)
ylabel('$y(t)$','Interpreter','LaTex','FontSize',letra)
zlabel('$z(t)$','Interpreter','LaTex','FontSize',letra)
grid on

subplot(222)
plot(x(:,1),x(:,2));
%title('Atrator de Lorenz');
set(gca,'FontSize',graf)
xlabel('$x(t)$','Interpreter','LaTex','FontSize',letra)
ylabel('$y(t)$','Interpreter','LaTex','FontSize',letra)
grid on

subplot(223)
plot(x(:,1),x(:,3));
%title('Atrator de Lorenz');
set(gca,'FontSize',graf)
xlabel('$x(t)$','Interpreter','LaTex','FontSize',letra)
ylabel('$z(t)$','Interpreter','LaTex','FontSize',letra)
grid on

subplot(224)
plot(x(:,2),x(:,3));
%title('Atrator de Lorenz');
set(gca,'FontSize',graf)
xlabel('$y(t)$','Interpreter','LaTex','FontSize',letra)
ylabel('$z(t)$','Interpreter','LaTex','FontSize',letra)
grid on

print -depsc lorenz_xyz


%GRÁFICOS
%Atrator de Lorenz - x vs t
figure(2);
plot (t,x(:,1));
title('Componente x do atrator de Lorenz no tempo');
xlabel('t');
ylabel('x');
grid on

%GRÁFICOS
%Atrator de Lorenz - y vs t
figure(3);
plot (t,x(:,2));
title('Componente y do atrator de Lorenz no tempo');
xlabel('t');
ylabel('y');
grid on

%GRÁFICOS
%Atrator de Lorenz - z vs t
figure(4);
plot (t,x(:,3));
title('Componente z do atrator de Lorenz no tempo');
xlabel('t');
ylabel('z');
grid on

figure(5);
plot3(x(:,1),x(:,2),x(:,3));
%title('Atrator de Lorenz');
xlabel('x');
ylabel('y');
zlabel('z');
grid on

figure(6);
subplot(311)
plot(x(:,1),x(:,2));
%title('Atrator de Lorenz');
xlabel('x');
ylabel('y');
grid on

subplot(312)
plot(x(:,1),x(:,3));
%title('Atrator de Lorenz');
xlabel('x');
ylabel('z');
grid on

subplot(313)
plot(x(:,2),x(:,3));
%title('Atrator de Lorenz');
xlabel('y');
ylabel('z');
grid on

print -depsc Lorenz_xy_xz_xz





