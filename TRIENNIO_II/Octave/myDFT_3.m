fc = 44100;
sync = 1/fc;

dur = 1;
freq = 5;

t = [0:sync:dur-sync];
amps = [0.8 0.3 0.1];
fasi = [pi/3 pi/5 pi/7];


y0 = amps(1)*cos(2*pi*freq*t+fasi(1));
y1 = amps(2)*cos(2*pi*freq*3*t+fasi(2));
y2 = amps(3)*cos(2*pi*freq*5*t+fasi(3));

y = y0.+y1.+y2;

figure(1);
plot(t,y);

F = [0:fc-1];

YFFT = zeros(size(F));

% for (k=1:size(F,2))
for (k=1:100)
	fcos = cos(2*pi*F(k)*t);
	fsin = sin(2*pi*F(k)*t);
	fresult_cos = y.*fcos;
	fresult_sin = y.*fsin;

	fsum_cos = (2*sum(fresult_cos))/(fc*dur);
	fsum_sin = (2*sum(fresult_sin))/(fc*dur);
	
	% YFFT(k) = 2*(sum(fresult))/(fc*dur);
	YFFT(k) = sqrt((fsum_cos^2)+(fsum_sin^2));
	
end
	
figure(2);
stem(F(1:100),YFFT(1:100));
%axis([0 40 -.1 1.1]);

%figure(3);
%stem(F,YFFT);