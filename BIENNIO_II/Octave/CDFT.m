fc = 44100;
amp = 0.8;
dur = 0.2;
winsize = ceil(fc*dur);
binsize = fc/winsize;

freq = (50*binsize)+3.4;
sinc = 1/fc;


t = [0:sinc:dur-sinc];

w0 = freq*2*pi;

x = amp*exp(i*w0*t);

Y = zeros (size(x));

%plot(t, real(x), t, imag(x))

F = [0:binsize:(fc-binsize)];

for (k = 1:length(F))
	w = 2*pi*F(k);
	y(k) = amp*sum(exp(i*(w0-w)*t));
	
end

plot(F, abs(Y)/winsize)
axis([0:1000])