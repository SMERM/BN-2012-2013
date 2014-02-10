%
% fc: frequenza di campionamento
%
fc = 44100;
%
% sinc: periodo di incremento del campionamento
%
sinc = 1/fc;
%
% dur: durata dell'evento audio (in sec)
%
dur = 1;
%
% t: vettore del tempo campionato
%
t = [0:sinc:dur-sinc];
%
% amps: vettore delle ampiezze
%
amps = [0.8 0.3 0.1];
%
% freqs: vettore delle frequenze (in Hz)
%
freqs = [10 30 50];
%
% fasi: vettore delle fasi in radianti
%
fasi = [0 pi/4 pi/3];
%
% yn: componenti parziali della funzione da analizzare
%
y0 = amps(1)*cos(2*pi*freqs(1)*t+fasi(1));
y1 = amps(2)*cos(2*pi*freqs(2)*t+fasi(2));
y2 = amps(3)*cos(2*pi*freqs(3)*t+fasi(3));
%
% y: funzione da analizzare, somma delle parziali
%
y = y0.+y1.+y2;
%
% F: vettore delle frequenze di analisi (in Hz, col passo di 1Hz)
%
F = [0:fc-1];
%
% Vettori YDFT* magnitudini e fasi per ciascuna frequenza analizzata
% inizializzati  a zero
%
YDFTmag = zeros(size(F));
YDFTfasi = zeros(size(F));
%
% winsize limita l'analisi ai primi 100 campioni della funzione
% lo possiamo utilizzare perché siamo avveduti del contenuto frequenziale della funzione(y)
%
winsize=100;
%
% ciclo for che effettua l'analisi per ogni frequenza contenuta in F
% (nel caso dell'uso di winsize questo valore è compreso tra 0 e winsize-1, naturalmente se il passo è 1)
%
for (k=1:winsize)
	%
	% funzione di analisi in forma esponenziale di frequenza F(k)
	%
	anal = exp(-i*2*pi*F(k)*t);
	%
	% prodotto membro a membro tra funzione analizzata e funzioni di analisi
	%
	siganal = anal.*y;
	%
	% sommatoria (o integrale nelle funzioni continue di tutti i campioni del prodotto siganal)
	% analsum è un valore complesso
	%
	analsum = sum(siganal);
	%
	% estrazione della magnitudine
	% k-esimo valore della magnitudine espresso come modulo di "analsum"
	% attraverso l'utilizzo della funzione "abs" normalizzata al nr dei campioni e moltiplicata
	% per due a casa della perdita di ampiezza dovuta all'operazione di moltiplicazione dei segnali
	%
	YDFTmag(k) = (2*abs(analsum))/(dur*fc);
	%
	% estrazione delle fasi
	% k-esimo valore della fase espresso come argomento di "analsum"
	% attraverso l'utilizzo della funzione "arg"
	%
	YDFTfasi(k) = arg(analsum);
end
%
% display vari
%
stem(F(1:winsize),YDFTmag(1:winsize));
fasi
YDFTfasi(11)
YDFTfasi(31)
YDFTfasi(51)