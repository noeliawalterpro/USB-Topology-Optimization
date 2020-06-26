disp('topUSB_2D_Id_Force')
forceA=find(F~=0);
hold on
for j=1:length(F(:))
    if mod(j,2);%% impar
    else
        k=j/2;
        i=k;
        %% FZ
        quiver(XX(i),YY(i),-sign(F(j-1))*paso*2,0,'LineWidth',2,'color','b')
        %% FY
        quiver(XX(i),YY(i),0,sign(F(j))*paso*2,'LineWidth',2,'color','b')
         
        
        
    end
end
alpha(0)% transparencey

axis off