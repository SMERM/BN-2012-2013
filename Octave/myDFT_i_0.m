fc = 44100;
sinc = 1/fc;

dur = 1;

t = [0:sinc:dur-sinc];
amps = [0.8 0.3 0.1];
freqs = [10 30 50];
fasi = [0 pi/4 pi/3];

y0 = amps(1)*sin(2*pi*freqs(1)*t+fasi(1));
y1 = amps(2)*sin(2*pi*freqs(2)*t+fasi(2));
y2 = amps(3)*sin(2*pi*freqs(3)*t+fasi(3));

y = y0.+y1.+y2;

F = [0:fc-1];

YDFTmag = zeros(size(F));
YDFTfasi = zeros(size(F));

asums = zeros(size(F));

winsize=100;

for (k=1:winsize)
	anal = exp(-i*2*pi*F(k)*t);
	siganal = anal.*y;
	analsum = sum(siganal);
	asums(k) = analsum;
	YDFTmag(k) = (2*abs(analsum))/(dur*fc);
	YDFTfasi(k) = arg(analsum)+pi/2;
end

subplot(2,1,1);	
stem(F(1:winsize),YDFTmag(1:winsize));

subplot(2,1,2);
stem(F(1:winsize),YDFTfasi(1:winsize));

fasi

asums(11)
YDFTfasi(11)

asums(31)
YDFTfasi(31)

asums(51)	
YDFTfasi(51)		