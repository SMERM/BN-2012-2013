
% tabsize = 512;
tabsize = 4096;
% tabsize = 4;

% da -1 a 1
step = 2/tabsize;

tab = [-1:step:1-step];

amp = 0.8;
t = [0:0.01:2];

source = amp * cos(2*pi*4*t);

halftab = tabsize/2;

% +1... per far iniziare l'indice di octave da 1
% rescaling... della tabella per farla oscillare tra 0 e 512
% round... perchè servono valori interi come indici con cui leggere la tabella

sourceidx = round(halftab*source+halftab+1);

output = tab(sourceidx);

plot(t,output);
