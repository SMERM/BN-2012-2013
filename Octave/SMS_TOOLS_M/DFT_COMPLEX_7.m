fc = 44100;
sinc = 1/fc;
dur = 0.1;
t = [0:sinc:dur-sinc];

winsize = 512;
winmezzi = floor(winsize/2);

h = hanning(winsize)';

binsize = fc/winsize;

%freq = 5038;
freq = 58*binsize;

amp = 0.8;

x = amp*(exp(i*2*pi*freq*t)+exp(-i*2*pi*freq*t))/2;

F = [0:binsize:(fc-binsize)];

x1 = x(1:winsize).*h;

fftbuffer = zeros(1, winsize);

fftbuffer (1:winmezzi) = x1(winmezzi+1:winsize); % parte destra
fftbuffer (winmezzi+1:winsize) = x1(1:winmezzi); % parte sinistra

Y = fft(x, winsize);

figure(1)
plot(t(1:winsize), fftbuffer)
axis([0 0.0006 -1 1 ])

figure(2)
plot(F, abs(Y)/winsize)

figure(3)
plot(F, unwrap(angle(Y())))
