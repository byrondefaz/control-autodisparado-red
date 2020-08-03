function [exectime, data] = actuador_codigo(seg, data)
persistent t
t=0;
switch seg
   
case 1
ud = ttGetMsg;
if  isempty(ud)
     ttSendMsg(1, 0.0001, 80);
     ttAnalogOut(1,1)
     t =0;
     
else
    disp('mensaje recibido controlador')
    data.u=ud(1);
    t =ud(2);
end

ttAnalogOut(1,data.u) % Aplica el valor enviado por el controlador
exectime= t; % tiempo que debe aplicar el actuador

case 2

 exectime =-1; % Finalizo task actuador
end
