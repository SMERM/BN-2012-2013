addpath ../../../_Functions

fc=1;
sinc=1/fc;
ks=[0:16];
l=6;
p=.1;
xy=[-l:p:l];
w=[0:p:2*pi];

zp=e.^(-i*w);
cs=1.998*ks/17-.999;

c=cs(10);
H=(c+zp.^(-1))./(1+c*zp.^(-1));

figure(1)
plot(w, abs(H))

figure(2)
plot(w, angle(H))