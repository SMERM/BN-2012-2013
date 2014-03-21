addpath ../../../_Functions

fc=1;
sinc=1/fc;
ks=[0:16];
l=6;
p=.5;
xy=[-l:p:l];

zp=zplane(xy, xy); 
c=1.998*ks(8)/17-.999;

H=(c+zp.^(-1))./(1+c*zp.^(-1));

figure(1);
mesh(xy, xy, abs(H))

figure(2);
zeri=roots([c 1]);
poli=roots([1 c]);
w=[0:p:2*pi];
cerchio=e.^(i*w);
plot(cerchio);
hold on
plot(real(zeri), imag(zeri), "o", real(poli), imag(poli), "x");
axis([-6 6 -6 6]);
hold off