fc=44100;
sinc=1/fc;
dur=1;

freq1=36;
freq0=5;
t=[0:sinc:dur-sinc];
amps=[0.6 0.8];
y0=amps(1)*cos(2*pi*freq0*t);
y1=amps(2)*cos(2*pi*freq1*t);
y=y0.*y1;
figure(1);
plot(t,y0, t,y1, t,y);

winsize=32768;
binsize=fc/winsize;
F=[0:binsize:fc-binsize];
yfft=fft(y, winsize);
figure(2);
stem(F,2*abs(yfft)/winsize);
axis([-1 50 0 .5]);