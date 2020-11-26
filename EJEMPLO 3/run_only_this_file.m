%% CONDICIONES EJEMPLO NUMERICO
clear all, close all, clc
init_truetime %Inicializa TrueTime
global A B C D K  his U X0
syms s
%Espacio de estado doble integrador
A = [0 1; 0 0];  %nxn
B = [0; 1];     %nxp
C = [1 0;0 1];  %qxn
D = [0;0];      %qxp

% Variables 'his' (banda de histeresis) y los estados iniciales X(0)
X0 = [-1.2 0.7];
his= 0.5; % Establecer banda de histeresis


K = [1 1]; % Establecer vector para la superficie de deslizamiento
U= [-1 1]; % Señal de control para S+(1)primera pos y  S-(2) segunda pos 

%% Respuesta del sistema
sys = ss(A, B, C, D)
[num,den]=ss2tf(A, B, C, D)
t = 0:0.01:5;
y = step(num,den,t);
plot(t,y)
grid
title('Respuesta escalón unitario')
xlabel('t Seg') 
ylabel('Salida y')
I=eye(size(A));
O=ilaplace(inv(I*s-A))
%% CONTROLABILIDAD
P=[A*B]
q=rank(P)
R=[1;0]
simout=sim('simulink_tesis');
fig = get_param('simulink_tesis','Handle');
saveas(fig,'MySimulinkDiagram.pdf');
graficas3



