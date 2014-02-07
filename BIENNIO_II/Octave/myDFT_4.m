fc = 44100;
sync = 1/fc;

dur = 1;

t = [0:sync:dur-sync];
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
	sinanal = -sin(2*pi*F(k)*t);
	sinbin = sinanal.*y;
	cosanal = cos(2*pi**F(k)*t);
	cosbin = cosanal.*y;
	sinsum = sum(sinbin);
	cossum = sum(cosbin);
	sinsumnorm = (2*sinsum)/size(y,2);
	cossumnorm = (2*cossum)/size(y,2);
	YDFTmag(k) = sqrt((sinsumnorm**2)+(cossumnorm**2));
	YDFTfasi(k) = atan2(sinsum, cossum);
end

stem(F(1:winsize),YDFTmag(1:winsize));
YDFTfasi(10:12)
YDFTfasi(30:32)
YDFTfasi(50:52)	

fasi