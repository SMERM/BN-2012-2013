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
