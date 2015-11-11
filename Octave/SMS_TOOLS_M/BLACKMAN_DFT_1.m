fc = 44100;
sinc = 1/fc;
outwin = 4096;
dur = outwin/fc;
freq = 300;

t = [-dur/2:sinc:dur/2-sinc];
binsize = fc/outwin;

halfx = round(outwin/2);

inwin = 511;
winmezzi = floor(inwin/2);

x = exp(i*2*pi*freq*t);
%x = ones(1, outwin);

h = triang(inwin)';

x1 = zeros(1, outwin);
x1(halfx-winmezzi:halfx+winmezzi) = x(halfx-winmezzi:halfx+winmezzi).*h;

F = [-fc/2:binsize:fc/2-binsize];

fftbuffer = zeros(1, outwin);
fftbuffer (1:halfx) = x1(halfx+1:outwin); % parte destra
fftbuffer (halfx+1:outwin) = x1(1:halfx); % parte sinistra

Y = fft(fftbuffer, outwin);

figure(1)
plot(t, x1)
axis([-dur/2*1.2 dur/2*1.2 -1.1 1.1 ])

figure(2)
plot(F, 20*log10(abs(fftshift(Y))/inwin))
axis([-1000+freq +1000+freq -90 0.1])
%
% figure(3)
% plot(F, unwrap(angle(Y())))