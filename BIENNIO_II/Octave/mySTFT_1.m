clear all

[ystereo fc nbits] = wavread("fft_Clip.wav");
y = ystereo(:, 1);

sinc = 1/fc;
dur = size(y, 1)/fc;
offset = .0;
offsamp = round(offset*fc)+1; 
winsize = 4096;
binsize = fc/winsize;
h = hanning(winsize);
F = [0:binsize:fc-binsize];
olap = 8;
risc = olap/2;
hop = round(winsize/olap);
hopt = hop/fc;
numwins = floor(dur/hopt)-(olap-1);

duranal = ((numwins/olap)*winsize)/fc;
output = zeros(winsize, numwins);
t = [0:hopt:duranal-(hopt)];

curstart = offsamp;

for k = (1:numwins)
	curend = curstart+winsize-1;
	thisFFT = fft(y(curstart:curend).*h, winsize);
	winMAG = (4*abs(thisFFT)/winsize);
	output(:,k) = winMAG;
	curstart = curstart+hop;
end

mesh(t, F, output)
axis([0 duranal 0 2000 0 .1])
view([60 20])