 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mydft7.m: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 % frequenza di campionamento

 winsize=500;
 fc=44100;
 binsize = fc/winsize;
 
 % incremento (periodo di un'onda alla frequenza di campionamento)
 sinc=1/fc;

 % durata (1 sec)
 dur=1;
 
 % vettore del tempo per un periodo
 t=[0:sinc:dur-sinc];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  suono da analizzare: 3 sinusoidi (una fondamentale + 2 parziali)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 freq=1000;
 amps=[0.8 0.3 0.1];
 fasi=[pi/3 pi/5 pi/7];
 
 y0=amps(1)*cos(2*pi*freq*t+fasi(1));
 y1=amps(2)*cos(2*pi*freq*3*t+fasi(2));
 y2=amps(3)*cos(2*pi*freq*5*t+fasi(3));
 
 y=y0.+y1.+y2;
 
 % figura-1: suono da analizzare
 figure(1);
 plot(t,y);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ANALISI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % vettore asse delle X  (nel dominio della frequenza)
 F=[0:binsize:fc-binsize];
 
 YDFTFASI=zeros(size(F));
 YDFTMAG=zeros(size(F));
 
 
 % ciclo che popola YDFT
 for (k=1:size(F,2)) 
 
 	fcos=cos(2*pi*F(k)*t(1:winsize));
 	fsin=-sin(2*pi*F(k)*t(1:winsize));
 
 	fresult_cos=y(1:winsize).*fcos;
 	fresult_sin=y(1:winsize).*fsin;
 
        fsum_cos=(2*sum(fresult_cos))/(dur*fc);
        fsum_sin=(2*sum(fresult_sin))/(dur*fc);

        % amplitude	
 	YDFTMAG(k)=sqrt((fsum_cos^2)+(fsum_sin^2));

        % phase: arctan(sin/cos)
        YDFTFASI(k)=atan2(fsum_sin,fsum_cos);
 end
 
 figure(2);
 %stem(F(1:100),YDFTMAG(1:100));
 stem(F,YDFTMAG);
 %axis([0 40 -.1 1.1]);
 
 %figure(3);
 %stem(F(1:100),YDFTFASI(1:100));
 %stem(F,YDFT);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


