fc = 44100;
fc2 = fc/2;
amp = 0.8;
dur = 0.2;
winsize = ceil(fc*dur);
binsize = fc/winsize;

freq = (50*binsize)+3.4;

w0 = freq*2*pi;
sinc = 1/fc;
t = [0:sinc:dur-sinc];

%x = amp*exp(i*w0*t);
%x = amp*cos(w0*t);
x = amp/2*(exp(i*w0*t).+exp(-i*w0*t));
Y = zeros (size(x));

%plot(t, real(x), t, imag(x))

%F = [0:binsize:(fc-binsize)];
F = [-fc/2:binsize:(fc/2-binsize)];

for (k = 1:length(F))
	w = 2*pi*F(k);
	Y(k) = amp/2*sum(exp(i*w0*t).*exp(-i*w*t))+amp/2*sum(exp(-i*w0*t).*exp(-i*w*t));
	
end

plot(F, abs(Y)/winsize)
axis([-1000, 1000])