fc = 44100;
sinc = 1/fc;
outwin = 4096;
dur = outwin/fc;

t = [-dur/2:sinc:dur/2-sinc];
binsize = fc/outwin;

halfx = round(outwin/2);

winsize = 512;
winmezzi = floor(winsize/2);

x = zeros(1, outwin);
x(1, halfx-winmezzi:halfx+winmezzi) = 1;

%x1 = x(1, halfx-winmezzi:halfx+winmezzi);

F = [-fc/2:binsize:fc/2-binsize];

fftbuffer = zeros(1, outwin);
fftbuffer (1:halfx) = x(halfx+1:outwin); % parte destra
fftbuffer (halfx+1:outwin) = x(1:halfx); % parte sinistra

Y = fft(x, outwin);

figure(1)
plot(t, x)
axis([-dur/2*1.1 dur/2*1.1 -0.1 1.1 ])

figure(2)
plot(F, 20*log10(abs(fftshift(Y))/winsize))
axis([-1000 +1000 -40 0.1])
%
% figure(3)
% plot(F, unwrap(angle(Y())))