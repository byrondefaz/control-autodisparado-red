x1=-5:0.1:5;
x2=-5:0.1:5;
Smax=((-K(2)*x1)/K(1))+his;
Smin=((-K(2)*x1)/K(1))-his;
S=(-K(2)*x1)/K(1);
hmax=((-(K(2)^2)/K(1))*U(1))+(K(1)*x1);
hmax_=(-K(1)*x1)+((K(2)^2)/K(1))*(U(2));
Max_x1=1+0*x1;
Min_x1=-1+0*x1;
Max_x2=1+0*x2;
Min_x2=-1+0*x2;
%Filtro de valores Sleep
[Sample,ia,ic] = unique(sleep.data,'stable');
Sampletime=sleep.time(ia,1);


subplot(2,2,1)
plot(x_1,x_2,'b',x1,S,'r',x1,Smax,'r--',x1,Smin,'r--',x_1(1),x_2(1),'*',x_1_,x_2_,'bo')
hold on
plot(x1,hmax,'k',x1,hmax_,'k--',x1,Max_x1,'g--',x1,Min_x1,'g',Max_x2,x2,'m--',Min_x2,x2,'m')
legend('Trayectoria','S','Smax','Smin','x(0)','update control','hmax','hmax*','Max x1','Min x1','Max x2','Min x2')
axis([-3,3,-3,3]);
xlabel('x1'),ylabel('x2');
title('Control autodisparado usando modo deslizante en red')
grid on
subplot(2,2,2)
stem(Sampletime,Sample)
xlabel('Tiempo (s)'),ylabel('Intervalo de muestreo (s)');
title('Intervalos de muestreo')