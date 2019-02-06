function [points,points2,videoPlayer] = defineRegion(objectFrame)
%choose regions of tracking 
figure; 
imshow(objectFrame); 
objectRegion=round(getPosition(imrect));
objectRegion2=round(getPosition(imrect));

objectImage = insertShape(objectFrame,'Rectangle',objectRegion,'Color','red');
objectImage = insertShape(objectImage,'Rectangle',objectRegion2,'Color','green');
figure;
imshow(objectImage);
title('Red box shows object region')
videoPlayer = vision.VideoPlayer('Position',objectRegion);
%creates a number of points in the frame that we are tracking
points = detectMinEigenFeatures(rgb2gray(objectFrame),'ROI',objectRegion);
points2 = detectMinEigenFeatures(rgb2gray(objectFrame),'ROI',objectRegion2);

pointImage = insertMarker(objectFrame,points.Location,'+','Color','green');
pointImage = insertMarker(pointImage,points2.Location,'+','Color','red');
figure;
imshow(pointImage);
impixelinfo();
title('Detected interest points');




end

