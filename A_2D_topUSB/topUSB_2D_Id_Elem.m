disp('topUSB_2D_Id_Elem')
hold on
for i=1:ne
    plot(XXC(i),YYC(i),'.','Color','none')
    
    text(XXC(i),YYC(i),num2str(i),'Color','k')
    
end
alpha(0.3) %TRANSPARENCY