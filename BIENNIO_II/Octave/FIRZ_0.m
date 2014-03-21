p=0.1;
l=3;
img=[-1:p:1];
re=[-1:p:1];
z=zeros(size(img, 2), size(re, 2));

for r=1:size(re, 2)
	for c=1:size(img,2)
		z(r,c)=re(r)+(i*img(c));
	end
end

a0=0.5;
a1=0.5;
fz=a0+a1*z.^(-1);

figure(1);
mesh(re,img,abs(fz));
axis([-l l -l l 0 4])

figure(2);
radici=roots([a1 a0]);
w=[0:p:2*pi];
cerchio=e.^(i*w);
plot(cerchio);
hold on
plot(radici, 0i, "o");
hold off