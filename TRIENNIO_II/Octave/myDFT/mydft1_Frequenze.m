 
 fc=44100;
 sinc=1/fc;
 
 dur=1;
 freq=5;
 
 t=[0:sinc:dur-sinc];
 amps=[0.8 0.3 0.1];
 
 y0=amps(1)*cos(2*pi*freq*t);
 y1=amps(2)*cos(2*pi*freq*3*t);
 y2=amps(3)*cos(2*pi*freq*5*t);
 
 y=y0.+y1.+y2;
 
 figure(1);
 plot(t,y);
 
 F=[0:fc-1];
 
 YDFT=zeros(size(F));
 
 for (k=1:size(F,2)) 
 
 	fanal=cos(2*pi*F(k)*t);
 	fresult=y.*fanal;
 	
 	YDFT(k)=(2*sum(fresult))/(dur*fc);
 end
 
 figure(2);
 % plot(F,YDFT);
 stem(F,YDFT);
 axis([0 40 -.1 1.1]);
 
 figure(3);
 stem(F,YDFT);
