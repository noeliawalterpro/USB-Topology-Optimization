%% GIF GRAF

drawnow;
frame = getframe(hh);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,32);
if loop == 1;
    imwrite(imind,cm,strcat(nmetodo,'.gif'),'gif','Loopcount',inf,'DelayTime',0.1);
else
    
    imwrite(imind,cm,strcat(nmetodo,'.gif'),'gif','WriteMode','append','DelayTime',0.1);
end
