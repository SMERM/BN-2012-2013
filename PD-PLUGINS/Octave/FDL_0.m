x=[-10:0.1:10];
inlet=cos(10*x);

c0=0.5;
c1=0.5;

outlet=c0*inlet.+[c1*inlet(2:size(inlet,2)) 0];

plot(x, inlet, x, outlet)
axis([0 pi/2 -1.1 +1.1])