fc=48000;
sinc=1/fc;
dur=0.2;
freq=216;
t=[0:sinc:dur-sinc];

inlet=cos(2*pi*freq*t);

c0=0.5;
c1=0.5;

outlet=c0*inlet.+[c1*inlet(2:size(inlet,2)) 0];

plot(t, inlet, t, outlet)
axis([0.0007 0.0012 -1.1 +1.1])