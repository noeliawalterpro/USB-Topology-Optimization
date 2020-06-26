if HU==1
    xPhys=xPhysA+mBgrises+mCr+mpt;
else
    xPhys=xPhysA+mBe+mBc+mCr+mpt;
end
NxPhys=length(find(xPhys>0));

