% Testing point tracker, working quite good

clear all
clc

% Read video
filename = 'schultz.mp4';
objectFileReader = vision.VideoFileReader(filename);
objectFrame = objectFileReader(); 

% Define regions to track
[points,points2,videoPlayer] = defineRegion(objectFrame);
% Display points

% Display the points on the image
[out,xValues,yValues,xValues2,yValues2,nrOfframes,validity,validity2,points,points2] = point(points, points2,objectFrame,objectFileReader);
% Decide which point to track
[Point2track, Point2track2] = point2track(out,points, points2,validity, validity2);

release(videoPlayer);
release(objectFileReader);

% Calculate velocity (for now pixels/s). The framerate must be known. 
[timeaxis,velocity] = velocity(nrOfframes,xValues, yValues, xValues2,yValues2, Point2track, Point2track2);
close all
figure
plot(timeaxis,velocity)




