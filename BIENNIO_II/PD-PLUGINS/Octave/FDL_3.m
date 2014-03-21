fc=48000;
sinc=1/fc;
dur=0.2;
freq=100;
t=[0:sinc:dur-sinc];
x=cos(2*pi*freq*t);
delay=0.0027;
fds=(delay*fc);
ids=floor(fds);

tau=fds-ids;

c=(1-tau)/(1+tau);

Y=zeros(size(x));

for k=ids+2:length(x)
	ink=k-ids;
	Y(k)=c*x(ink)+x(ink-1)-c*Y(k-1);
end

plot(t, x, t, Y)
axis([.01 .0127])