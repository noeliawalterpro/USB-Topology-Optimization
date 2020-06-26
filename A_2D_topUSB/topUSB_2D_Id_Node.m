disp('topUSB_2D_Id_Node')
hold on
for i=1:nodos
    plot(XX(i),YY(i),'.','Color','none')
    
    text(XX(i),YY(i),num2str(i),'Color','b')
    
end
alpha(0.3) %TRANSPARENCY