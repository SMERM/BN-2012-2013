fc=48000;
sinc=1/fc;
dur=0.2;
freq=216;
t=[0:sinc:dur-sinc];

inlet=cos(2*pi*freq*t);
per=1/freq;
per4=per/4;

c0=0.90;
c1=0.1;

outlet=c0*inlet.+[c1*inlet(2:size(inlet,2)) 0];

plot(t, inlet, t, outlet)
axis([per4-0.0001 per4+0.0001 -0.1 +0.1])