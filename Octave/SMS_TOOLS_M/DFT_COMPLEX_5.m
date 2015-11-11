fc = 44100;
sinc = 1/fc;
dur = 0.1;
t = [0:sinc:dur-sinc];

winsize = 512;
binsize = fc/winsize;

freq = 5038;
amp = 0.8;

x = amp*(exp(i*2*pi*freq*t)+exp(-i*2*pi*freq*t))/2;

F = [0:binsize:(fc-binsize)];

xsize = size(x,2);

x1 = x(1:winsize);
t1 = t(1:winsize);

% Y = zeros(1, winsize);
%
% for k = 1:winsize
% 	anal = exp(-i*2*pi*F(k)*t1);
% 	Y(k) = sum(x1.*anal);
% end

Y = fft(x, winsize);

figure(1)
plot(t, x)
axis([-0.001 0.001 -1 1 ])

figure(2)
plot(F, abs(Y)/winsize)
