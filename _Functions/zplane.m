%% @re = asse dei reali (vettore)
%% @img = asse dedegli immaginari (vettore)

function zp = zplane(re, img)
	
	zp=zeros(size(img, 2), size(re, 2));
	for r=1:size(re, 2)
		for c=1:size(img,2)
			zp(r,c)=re(r)+(i*img(c));
		end
	end
end