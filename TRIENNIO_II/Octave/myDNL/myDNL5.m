
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% test sine
fc=44100;
sinc=1/fc;
dur=0.5;
t=[0:sinc:dur-sinc];
freq=138;
%amp=0.99;
% 65536 = tabsize
amp=1-2/65536;
y=amp*cos(2*pi*freq*t);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% chebishev tab
tabsize=65536;
step=2/tabsize;
x=[-1:step:1-step];

T1=x;
T2=2*(x.^2)-1;
T5=16*(x.^5)-20*(x.^3)+5*x;
T7=64*(x.^7)-112*(x.^5)+56*(x.^3)-7*x;

%Ttot=0.7*T1+0.9*T2+0.65*T5+0.32*T7;
Ttot=0.65*T5;

scale_fact=max(abs(Ttot));

%Ttotnorm = Ttot/scale_fact;
% not normalized
Ttotnorm = Ttot;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1);
plot(x,Ttotnorm);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% chebishev tab normalize and read

htabsize=tabsize/2;
y2=round(htabsize*y+htabsize+1);

% legge la tabella prendendo l'indice da ycond
out=Ttotnorm(y2);   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FFT
winsize=8192;
binsize=fc/winsize;
F=[0:binsize:fc-binsize];
h=hanning(winsize)';
outfft=fft(out(1:winsize).*h,winsize);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2);
%plot(F,2*abs(outfft)/winsize);
stem(F,4*abs(outfft)/winsize);
axis([0 2000]);

