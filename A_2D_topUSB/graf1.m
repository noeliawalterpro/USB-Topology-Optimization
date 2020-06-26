yg1=0:paso:nely*paso;
for i=1:nely
    esf1=mean(esf1(i,:));
end
figure
plot(esf1,yg1)