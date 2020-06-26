yg1=0:paso:(nely-1)*paso;
graf2=(1-graf1);
esf1=esfv.*graf2;
for i=1:nely
    yesf1(i)=sum(esf1(i,:))/sum(graf2(i,:));
end
figure
plot(yesf1,yg1)
