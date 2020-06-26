fx=0;
fy=0;
for i=1:size(F)
    if mod(i,2);%% impar
        fx=F(i)+fx;
    else
        fy=F(i)+fy;
    end
end
        
fx
fy