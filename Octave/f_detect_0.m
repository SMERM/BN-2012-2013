freq = 8.3;

fc = 44100;

sinc = 1/fc;
nsamples = fc;
freqn = 8;
dur = nsamples*sinc;

t = [0:sinc:dur-sinc];

last = size(t, 2);

y = cos(2*pi*freq*t);
yn = cos(2*pi*freqn*t);

y(last)

ylast = cos(2*pi*freq*t(last))
freqr = freqn+(acos(ylast)/(2*pi*t(last)))

acos(ylast)

plot(t, y, t, yn)
axis([0 1.1 -1 1])