function [exectime, data] = controlador_codigo(seg, data)
global U
persistent t
switch seg
    
case 1
RecepData = ttGetMsg; % lee valores del nodo 1 sensor
 if isempty(RecepData)
            disp('Error mensaje no recibido controlador!')
 end
 
% rp = ttAnalogIn(1); % read reference analog value
x1= RecepData(1); 
x2= RecepData(2);
t= RecepData(3);
disp('Mensaje recibido del sensor')
s=x2+x1; 
if s>0
data.u=U(1);
else
data.u=U(2);
end

ttAnalogOut(1, data.u); % señal de control
exectime = 0; %Tiempo de ejecucion

 case 2
cont(1)=data.u;
cont(2)=t;
ttSendMsg(2,cont, 80); % send 80 bits with controller output value
disp('Mensaje enviado actuador s:')
exectime = 0;
    case 3
disp('finalizar task controlador')
exectime=-1;
end