function sensor_node

ttInitKernel('prioDM');% Inicializa el kernel

starttime=0.0;
deadline=1;

ttCreateTask('sensor_task',starttime, deadline, 'sensor_codigo');
ttAttachNetworkHandler('sensor_task')


