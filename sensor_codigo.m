function [exectime, data] = sensor_codigo(seg, data)
global K his U
persistent  x tiempo sens
switch seg
case 1

x(1) = ttAnalogIn(1) % Lee el valor del estado x1
x(2) = ttAnalogIn(2) % Lee el valor del estado x2

exectime = 1e-6; % Tiempo de ejecucion de la lectura
 case 2
d(1)= his;
d(2)= -his;

S =(K(1)*x(1))+(K(2)*x(2));
if S>0
a=(K(1)*U(1))/2;
b=(K(1)*x(2))+(K(2)*U(1));
c=(K(1)*x(1))+(K(2)*x(2))+d(1);
f= b^2-4*a*c;
t1= (-b+sqrt(b^2-4*a*c))/(2*a);   
t2= (-b-sqrt(b^2-4*a*c))/(2*a);
     if t1>t2
         tiempo= t1;
        %disp(t1);
     else 
         tiempo= t2;
     %disp(t2);
     end

else
a= (K(1)*U(2))/2;
b=(K(1)*x(2))+(K(2)*U(2));
c=(K(1)*x(1))+(K(2)*x(2))+d(2); 
f= b^2-(4*a*c);
t1= (-b+sqrt(b^2-4*a*c))/(2*a);   
t2= (-b-sqrt(b^2-4*a*c))/(2*a);
      if t1>t2
        
        tiempo= t1;
        %disp(t1);
     else 
     
     tiempo= t2;
     %disp(t2);
      end    
end
%CONCATENA LOS DATOS
sens(1)=x(1);
sens(2)=x(2);
sens(3)=tiempo;
% ENVIA EL MENSAJE
ttSendMsg(3, sens, 80); % enviar 80 bits al nodo 3
disp('Mensaje enviado controlador')
exectime = 0; % Tiempo de retraso de estas operaciones
case 3
ttAnalogOut(1,sens(1));
ttAnalogOut(2,sens(2));
ttAnalogOut(3,tiempo);
ttSleep(tiempo);  
ttSetNextSegment(1);  
exectime =0;

end
 



