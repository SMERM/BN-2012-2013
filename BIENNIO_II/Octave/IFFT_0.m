fc=48000;
sinc=1/fc;
winsize=8192;
binsize=fc/winsize;
fcut=5000;
bincut=floor(fcut/binsize);

speck=zeros(1, winsize);
speck(1:bincut)=1+0i;
speck(winsize-bincut:winsize)=1-0i;

ir=ifft(speck);

subplot(2, 1, 1)
plot(real(fftshift(ir)))

subplot(2, 1, 2)
plot(imag(fftshift(ir)))