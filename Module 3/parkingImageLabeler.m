% Write an automation function for the parking images
% using the detector from parkingYoloXDetectorSolution.mat
%
% Remember to:
% - Align the function name with the file name
% - Use a persistent variable for the detector for greater efficiency
%
% For each input image, save the output as a structure with 
%    the following fields for each label type:
% - "Name" containing the label name
% - "Type" containing the label type/shape
% - "Position" containing all bounding boxes with that label
% 
% If you get stuck, refer to FastenersImageLabeler.m for an example

function autoLabels = parkingImageLabeler(I)
% Add your code here
% set up the persistent variable for the detector

persistent detector
if isempty(detector)
    load ParkingYoloXDetectorSolution.mat detector

end 

% detect object and save the bounding boxes and labels
[bbox, ~, labels] = detect(detector, I);

detectedLabels = unique(labels);

autoLabels (length(detectedLabels)) = struct();

for i = 1 : length(detectedLabels)
    label = string (detectedLabels(i));
    autoLabels(i).Name = label;
    autoLabels(i).Type = labelType("Rectangle");
    autoLabels(i).Position = bbox(labels==label,:);

end

end
