for j=1:ne
    ce(j)= sum((Ui(edofMat(j,:))'*lK(nuMat(Material(j))))*Ui(edofMat(j,:)));    
    % ce= reshape(sum((Ui(edofMat)*KE).*Ui(edofMat),2),nely,nelx);
end
ce= reshape(ce,nely,nelx);



