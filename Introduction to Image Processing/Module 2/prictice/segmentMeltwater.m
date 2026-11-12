function [BW,maskedRGBImage] = segmentMeltwater(RGB)


 % 03-Jul-2026
%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2lab(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.385;
channel1Max = 68.819;

% Define thresholds for channel 2 based on histogram settings
channel2Min = -45.075;
channel2Max = -0.971;

% Define thresholds for channel 3 based on histogram settings
channel3Min = -53.178;
channel3Max = 36.028;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
