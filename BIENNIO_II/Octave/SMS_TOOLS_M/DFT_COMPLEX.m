fc = 44100;
sinc = 1/fc;
dur = 0.1;
t = (-dur/2:sinc:dur/2-sinc);

winsize = 4096;
binsize = fc/winsize;

freq = (500*binsize);
amp = 0.8;

x = amp*exp(i*2*pi*freq*t);

F = [-fc/2:binsize:(fc/2-binsize)];

xsize = size(x,2);

x1 = x((xsize/2-winsize/2):(xsize/2+winsize/2)-1);
t1 = t((xsize/2-winsize/2):(xsize/2+winsize/2)-1);

Y = zeros(1, winsize);

for k = 1:winsize
	anal = exp(-i*2*pi*F(k)*t1);
	Y(k) = sum(x1.*anal);
end

plot(F, abs(Y))