freq = 8.55;

fc = 44100;

sinc = 1/fc;
nsamples = fc;
freqn = 8;
dur = nsamples*sinc;

t = [0:sinc:dur-sinc];

last = size(t, 2);

y = exp(i*2*pi*freq*t);
yn = exp(i*2*pi*freqn*t);

y(last)

ylast = exp(i*2*pi*freq*t(last))
freqr = freqn+(arg(ylast)/(2*pi*t(last)))

plot(t, real(y), t, real(yn))
axis([0 1.1 -1 1])