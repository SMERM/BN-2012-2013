fc=48000;
sinc=1/fc;
step=sinc/5;
freq=100;

delaymax=0.1;
delaymin=0.0;
delayside=1000; %samples
delayline=[delaymin:step:delaymax-step];
delayfun=zeros(1, size(delayline, 2) + 2 * delayside);
delayfun(delayside:delayside+size(delayline, 2)-1)=delayline;
delayfun(size(delayfun, 2)-delayside:size(delayfun, 2))=delaymax;
dur=size(delayfun, 2)*sinc;

t=[0:sinc:dur-sinc];
x=cos(2*pi*freq*t);

fds=(delaymax*fc);
Y=zeros(size(x));
ccoefs=zeros(size(x));

%plot(t, delayfun)
%axis([.0 dur -0.01 delaymax+0.01])

epsl=1e-20;

for didx=2:size(delayfun, 2)
	fds=(delayfun(didx)*fc);
	ids=floor(fds);
	tau=fds-ids;

	if (fds > epsl)
		c=(1-tau)/(1+tau);
	else
		c=0;
	end

	ccoefs(didx)=c;
	ink=didx-ids;
	Y(didx)=c*x(ink)+x(ink-1)-c*Y(didx-1);
end

subplot(2, 1, 1)
plot(t, x, t, Y)
axis([0. 0.1])

subplot(2, 1, 2)
plot(t, ccoefs)
axis([0.02 0.022])

% subplot(2, 1, 2)
% plot(t, delayfun)
%axis([0.02 0.0325])
