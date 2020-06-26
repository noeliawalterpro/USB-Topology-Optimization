disp('topUSB_2D_Id_Fixed')
forceA=find(F~=0);
hold on
for j=1:length(U(:))
    if mod(j,2);%% impar
    else
        k=j/2;
        
        i=k;
        if U(j-1)==0;
            quiver(XX(i),YY(i),-paso/2,0,'LineWidth',3,'color',[0 0 0])
        end
        if U(j)==0;
            quiver(XX(i),YY(i),0,-paso/2,'LineWidth',3,'color',[0 0 0])
        end
        
        
    end
end
alpha(0.5) %transparency

axis off