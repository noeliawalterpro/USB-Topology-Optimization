% https://www.geeksforgeeks.org/matlab-converting-a-grayscale-image-to-binary-image-using-thresholding/

function [binary] = convert2gray(img) 

	[x, y, z]=size(img); 

	% if Read Image is an RGB Image then convert 
	% it to a Gray Scale Image For an RGB image 
	% the value of z will be 3 and for a Grayscale 
	% Image the value of z will be 1 

	if z==3 
		img=rbgTogray(img); 
	end

	% change the class of image 
	% array from 'unit8' to 'double' 
	img=double(img); 

	% Calculate sum of all the gray level 
	% pixel's value of the GraySacle Image 
	sum=0; 
	for i=1:x 
		for j=1:y 
		sum=sum+img(i, j); 
	end
	end


	binary=img/max(max(img)); 


end



