fc = 44100;
sync = 1/fc;

dur = 0.65;

t = [0:sync:dur-sync];

winsize = 1024;
binsize = fc/winsize;
h = 1/2-1/2*cos(2*pi*(1/winsize)*[0:winsize-1]);

amps = [0.8 0.3 0.1];
%freqs = [binsize*13 binsize*66 binsize*127];
freqs = [1250 5120 11036];
fasi = [0 pi/4 pi/3];

y0 = amps(1)*cos(2*pi*freqs(1)*t+fasi(1));
y1 = amps(2)*cos(2*pi*freqs(2)*t+fasi(2));
y2 = amps(3)*cos(2*pi*freqs(3)*t+fasi(3));

y = y0.+y1.+y2;

F = [0:binsize:fc-binsize];

YDFTmag = zeros(size(F));
YDFTfasi = zeros(size(F));

for (k=1:winsize)
	anal = exp(-i*2*pi*F(k)*t(1:winsize));
	siganal = anal.*y(1:winsize).*h;
	analsum = sum(siganal);
	YDFTmag(k) = (4*abs(analsum))/(winsize);
	YDFTfasi(k) = arg(analsum);
end

figure(1)
stem(F,YDFTmag);
axis([0 fc/2 0 1])

figure(2)
plot(h)