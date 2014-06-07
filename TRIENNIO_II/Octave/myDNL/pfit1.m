
tabsize=1024;
tabinc = 2/tabsize;
%xaxis = [1:tabsize];
xaxis = [-1:tabinc:1-tabinc];

%shelf=0.7;
shelf=0.6180339;

%X=[-1 -shelf 0 shelf 1];
%X=[-1 -0.5 0 0.5 1];
X=[-1 -0.75 -0.5 0 0.5 0.75 1];

Y=[-shelf -shelf -shelf+0.1 0 shelf-0.1 shelf shelf];

degree = size(X,2);
coeff = polyfit(X,Y,degree);
Fout = polyval(coeff,xaxis);

%plot(xaxis,Fout);
plot(xaxis,Fout,X,Y,'*');
