disp('topUSB_2D_Id_GDL')
hold on
for i=1:nodos
    plot(XX(i),YY(i),'.','Color','none')
    hold on
    text(XX(i),YY(i),{'','',strcat('(',num2str(2*i),',',num2str(2*i-1),')')},'Color','green')
    
end
alpha(0.3) %TRANSPARENCY
axis off