
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  analisi di trump.wav
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % leggiamo il file wav e mettiamo in 'y' i valori,
 % in 'fc' la frequenza di campionamento del file,
 % in 'nbits' la risoluzione

 [y fc nbits] = wavread("trump.wav");

 % a partire dal 3° sec
 offset = 3 * fc;   
 
 winsize=16000;
 binsize = fc/winsize;

 y = y(offset:offset+winsize-1)';

 % hanning window
 h = -0.5*cos(2*pi/winsize*[0:winsize-1])+0.5;

 % incremento (periodo di un'onda alla frequenza di campionamento)
 sinc=1/fc;

 dur = winsize*sinc;

 % vettore del tempo per un periodo
 t=[0:sinc:dur-sinc];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % figura-1: il file wav da analizzare
 figure(1);
 plot(t,y);
 xlabel('Frequenza');
 ylabel('Ampiezza');
 title('Ampiezza: Dominio del tempo');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ANALISI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % vettore asse delle X (nel dominio della frequenza)
 F=[0:binsize:fc-binsize];
 
 YDFTFASI=zeros(size(F));
 YDFTMAG=zeros(size(F));
 
 % ciclo che popola YDFT
 for (k=1:size(F,2)) 

 	fcos=cos(2*pi*F(k)*t(1:winsize));
 	fsin=-sin(2*pi*F(k)*t(1:winsize));

  	ywin = y(1:winsize).*h;
 
 	fresult_cos=ywin.*fcos;
 	fresult_sin=ywin.*fsin;
 
        fsum_cos=(4*sum(fresult_cos))/(winsize);
        fsum_sin=(4*sum(fresult_sin))/(winsize);

        % amplitude	
 	YDFTMAG(k)=sqrt((fsum_cos^2)+(fsum_sin^2));

        % phase: arctan(sin/cos)
        YDFTFASI(k)=atan2(fsum_sin,fsum_cos);
 end
 
 figure(2);
 stem(F,YDFTMAG);
 axis([0 10000 0 1]);
 xlabel('Frequenza');
 ylabel('Ampiezza');
 title('Ampiezza: Dominio della frequenza');
 
 figure(3);
 stem(F,YDFTFASI);
 xlabel('Frequenza');
 ylabel('Fase');
 title('Fase: Dominio della frequenza');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

