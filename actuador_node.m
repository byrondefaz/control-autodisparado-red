function actuador_node

ttInitKernel('prioDM'); 
deadline =2; % deadline time for node2code execution
startime=0.0;
data.u = 1.0;
data.t = 0.0;
ttCreateTask('actuador_task',startime, deadline,'actuador_codigo',data);
ttAttachNetworkHandler('actuador_task')




