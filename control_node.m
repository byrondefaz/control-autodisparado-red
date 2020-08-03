function control_node(arg)

ttInitKernel('prioDM');% Inicializa el kernel

data.u = 0.0;
deadline=1;
ttCreateTask('controller_task',deadline, 'controlador_codigo',data);
ttAttachNetworkHandler('controller_task')
