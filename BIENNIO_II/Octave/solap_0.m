clear all

winsize = 1024;
h = hanning(winsize)';
olap = 4;
risc = olap/2;
hop = round(winsize/olap);
numwins = 50;

output = zeros(1, (numwins/olap+1)*winsize);

curstart = 1;

for k = (1:numwins)
	output(curstart:curstart+winsize-1) = output(curstart:curstart+winsize-1).+h;
	curstart = curstart+hop;
end

output = output/risc;

plot(output)