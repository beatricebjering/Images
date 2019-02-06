function [out,xValues,yValues,xValues2,yValues2,nrOfframes,validity,validity2,points,points2] = point(points, points2,objectFrame,objectFileReader)

% MaxBidirectionalError should be set to 1 since it then tracks the correct
% pixel
tracker1 = vision.PointTracker('MaxBidirectionalError',1);
initialize(tracker1,points.Location,objectFrame);
tracker2 = vision.PointTracker('MaxBidirectionalError',1);
initialize(tracker2,points2.Location,objectFrame);
i=1;
nrOfframes =0;

while ~isDone(objectFileReader)
      frame = objectFileReader();
      nrOfframes = nrOfframes +1;
      % Points gives an array of x- and y-values of the points which can
      % be more of less. validity shows if the values of the points are
      % valid or not. If they aren't valid they fall out. 
      
      %% Object1
      [points,validity] = tracker1(frame);
      out = insertMarker(frame,points(validity, :),'+','Color','red');
      % Save the xy coordinates in array for object 1
      xValues(:,i)=points(:,1);
      yValues(:,i)=points(:,2);

      
      %% Object2
      [points2,validity2] = tracker2(frame);
      % Insert the points in "out" image
      out = insertMarker(out,points2(validity2, :),'+','Color','green');
      % Save the xy coordinates in array for object 1
      xValues2(:,i)=points2(:,1);
      yValues2(:,i)=points2(:,2);
imshow(out);
      impixelinfo();
      %videoPlayer(out);
      i=i+1;     
      
end
figure;
imshow(out);
impixelinfo();

end

