clear all

[ystereo fc nbits] = wavread("fft_Clip.wav");
y = ystereo(:, 1);

sinc = 1/fc;
dur = size(y, 1)/fc;
t = [0:sinc:dur-sinc];
offset = .7;
offsamp = round(offset*fc)+1; 
winsize = 1024;
binsize = fc/winsize;
h = hanning(winsize);
F = [0:binsize:fc-binsize];

YFFT = fft(y(offsamp:offsamp+winsize-1).*h, winsize);
YFFTmag = (4*abs(YFFT)/winsize);
YFFTfasi = arg(YFFT);

figure(1)
subplot(2,1,1)
plot(t(offsamp:offsamp+winsize-1), y(offsamp:offsamp+winsize-1))
subplot(2,1,2)
stem(F,YFFTmag);
%axis([0 fc/2 0 1])
axis([0 3500 0 .4])