%https://la.mathworks.com/matlabcentral/answers/55720-interpolating-matrices-of-different-sizes-to-the-same-size
function [outputImage] = img_resize(inputImage,Scale) 

scale =Scale* [1 1];         %# The resolution scale factors: [rows columns]
oldSize = size(inputImage);                   %# Get the size of your image
newSize = max(floor(scale.*oldSize(1:2)),1);  %# Compute the new image size

%# Compute an upsampled set of indices:
rowIndex = min(round(((1:newSize(1))-0.5)./scale(1)+0.5),oldSize(1));
colIndex = min(round(((1:newSize(2))-0.5)./scale(2)+0.5),oldSize(2));

%# Index old image to get new image:
outputImage = inputImage(rowIndex,colIndex,:);


end