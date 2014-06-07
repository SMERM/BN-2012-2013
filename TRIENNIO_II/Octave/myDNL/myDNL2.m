
fc=44100;
sinc=1/fc;
dur=2;
freq=300;
%amp = 0.8;

amp0=0;
amp1=1;
t=[0:sinc:dur-sinc];
a=(exp(amp0)-exp(amp1))/(t(1)-dur);
b=exp(amp0)-(a*t(1));
amp=log(a*t+b);

t = [0:sinc:dur-sinc];
%source = amp * cos(2*pi*freq*t);
source = amp .* cos(2*pi*freq*t);

tabsize = 4096;
step = 2/tabsize;
tab = [-1:step:1-step];

tab_sesti=round(tabsize/6);
tab_lim=1/sqrt(2);

tab(1:tab_sesti)=-tab_lim;

tab(tabsize-tab_sesti:tabsize)=tab_lim;

halftab = tabsize/2;

% +1... per far iniziare l'indice di octave da 1
% rescaling... della tabella per farla oscillare tra 0 e 512
% round... perchè servono valori interi come indici con cui leggere la tabella
sourceidx = round(halftab*source+halftab+1);

output = tab(sourceidx);


figure(1);
plot(tab);

figure(2);
plot(t,output);
%axis([0.5 0.55]);

figure(3);
plot(t,amp);

wavwrite(output',fc,16, "ws.wav");


