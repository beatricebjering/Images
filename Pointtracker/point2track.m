function [Point2track, Point2track2] = point2track(out,points, points2,validity, validity2)
%POINT2TRACK Summary of this function goes here
%   Detailed explanation goes here
%%  Object 1
figure;
imshow(out);
title('choose which one of the red points to follow');
[x,y] = getpts();
nrOfmarkers = size(points,1);
Point2track=0;
loop=false;
%hitta den korrekta punkten truePoint mha minsta kvadratmetoden
for k=1:nrOfmarkers
    if validity(k,:) == 1
        deltaxx=points(k,1)-x(1);
        deltayy=points(k,2)-y(1);
        z=sqrt(deltaxx.^2+deltayy.^2);
        if loop==false || z<Point2track
        Point2track=k;
        loop=true;
        end
    end
end
%% Object 2
figure;
imshow(out);
title('choose which one of the green points to follow');
[x2,y2] = getpts();
nrOfmarkers2 = size(points2,1);
Point2track2=0;
loop2=false;
%hitta den korrekta punkten truePoint mha minsta kvadratmetoden
for l=1:nrOfmarkers2
    if validity2(l,:) == 1
        deltaxx2=points2(l,1)-x2(1);
        deltayy2=points2(l,2)-y2(1);
        z2=sqrt(deltaxx2.^2+deltayy2.^2);
        if loop2==false || z2<Point2track2
        Point2track2=l;
        loop2=true;
        end
    end
end
end

