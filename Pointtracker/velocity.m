function [timeaxis,velocity] = velocity(nrOfframes,xValues, yValues, xValues2,yValues2, Point2track, Point2track2)
frameRate=30;
t=1/frameRate; %tiden för hela videon
timeaxis=zeros([1,nrOfframes-1]);
velocity=zeros([1,nrOfframes-1]);
velocity2=zeros([1,nrOfframes-1]);
time=t;

for j=1:nrOfframes-1
    %% Object 1
    deltaX=(xValues(Point2track,j+1)- xValues(Point2track,j));
    deltaY=(yValues(Point2track,j+1)- yValues(Point2track,j));
    
    %% Object 2
    deltaX2=(xValues2(Point2track2,j+1)- xValues2(Point2track2,j));
    deltaY2=(yValues2(Point2track2,j+1)- yValues2(Point2track2,j));
    
    %% pixel length
    
    
    
    %% Velocity - det blir i enheten pixel/s - måste konvertera om det till m/s
    %är det rätt att dela på t eller rätt att dela på 30 (frames/s)
    test1=(deltaX)-(deltaX2);
    test2=(deltaY)-(deltaY2);
    velocity(1,j)= (sqrt(((deltaX)-(deltaX2)).^2+((deltaY)-(deltaY2)).^2))/t;
    % velocity2(1,j)= sqrt((deltaX2).^2+(deltaY2).^2)/t;
    % Time
    timeaxis(1,j)=time;
    time=time+t;
end
end



