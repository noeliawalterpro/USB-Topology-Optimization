function [grayImage] = rbgTogray(rgbImage)
try
  [rows, columns, numberOfColorChannels ]= size(rgbImage);
  if numberOfColorChannels  == 3
      % It's color, need to convert it to grayscale.
      redChannel = rgbImage(:, :, 1);
      greenChannel = rgbImage(:, :, 2);
      blueChannel = rgbImage(:, :, 3);
      % Do the weighted sum.
      grayImage = .299*double(redChannel) + ...
                  .587*double(greenChannel) + ...
                  .114*double(blueChannel);
      % You probably want to convert it back to uint8 so you can display it.
      grayImage = uint8(grayImage);
  else
      % It's already gray scale.
      grayImage = rgbImage;  % Input image is not really RGB color.
  end
catch ME
  errorMessage = sprintf('Error in function %s() at line %d.\n\nError Message:\n%s', ...
    ME.stack(1).name, ME.stack(1).line, ME.message);
  fprintf(1, '%s\n', errorMessage);
  uiwait(warndlg(errorMessage));
end