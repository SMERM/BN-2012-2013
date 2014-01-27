fc = 44100;
sync = 1/fc;

dur = 1;
freq = 5;

t = [0:sync:dur-sync];
amps = [0.8 0.3 0.1];

y0 = amps(1)*sin(2*pi*freq*t);
y1 = amps(2)*sin(2*pi*freq*3*t);
y2 = amps(3)*sin(2*pi*freq*5*t);

y = y0.+y1.+y2;

plot(t,y);