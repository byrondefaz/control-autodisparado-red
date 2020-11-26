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

[Sample,ia,ib] = unique(Tk.data,'stable');
Sampletime=Tk.time(ia,1);
Sample(1,:)= [];
Sampletime(1,:)= [];

x_1_(x_1_==0|x_1_==X0(1)) = [];
[x_1_,ic,id] = unique(x_1_,'stable');
x_2_(x_2_==0|x_2_==X0(2)) = [];
x_2_=x_2_(ic,1);



subplot(2,2,1)
plot(x_1,x_2,'b',x1,S,'r',x1,Smax,'r--',x1,Smin,'r-.',x_1(1),x_2(1),'c*',x_1_(2:length(x_1_)),x_2_(2:length(x_1_)),'bo')
hold on
plot(x1,hmax,'k',x1,hmax_,'k--',x1,Max_x1,'g--',x1,Min_x1,'g',Max_x2,x2,'m--',Min_x2,x2,'m')
legend('Trayectoria','S','Smax','Smin','x(0)','Actualización de control','FontSize', 10)%,'hmax','hmax*','Max x1','Min x1','Max x2','Min x2')
axis([-2.2,2.2,-2.2,2.2]);
set(gca,'XTick',[-2:0.5:2],'YTick',[-2:0.5:2],'FontSize',15)
xlabel('x_1','FontSize', 15),ylabel('x_2','FontSize', 25);
title('K=[1 1], |u|=1, h=0.5, x(0)=[-1.2  0.7]')
grid off

subplot(2,2,2)


stem(Sampletime,Sample)
xlabel('Tiempo (s)','FontSize',15),ylabel('Intervalo de muestreo (s)','FontSize',15);
set(gca,'FontSize',15)
title('Intervalos de muestreo','FontSize', 20)
hold on
