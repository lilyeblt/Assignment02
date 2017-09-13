% TJ Lilyeblade
% CEC 495A
% 9/13/2017

% Tracking multiple balls of different colors and plotting points

clear all;
close all;
clc;

startFrame = 1;
endFrame = 489;

Xcentroid1 = [];
Ycentroid1 = [];
Xcentroid2 = [];
Ycentroid2 = [];

for k = startFrame : endFrame
    rgb = imread(['balls/img',sprintf('%2.3d',k),'.jpg']);
    [BW1, masked] = createMaskGreen(rgb);
    [labels, number] = bwlabel(BW1,8);
    
     if number > 0
        
        % Get basic stats
        Istats = regionprops(labels,'basic','Centroid');

        [maxVal, maxIndex] = max([Istats.Area]);

        Xcentroid1 = [Xcentroid1 Istats(maxIndex).Centroid(1)];
        Ycentroid1 = [Ycentroid1 Istats(maxIndex).Centroid(2)];
        
     end
end

for k = startFrame : endFrame
    rgb = imread(['balls/img',sprintf('%2.3d',k),'.jpg']);
    [BW2, masked] = createMaskBlue(rgb);
    [labels, number] = bwlabel(BW2,8);
    
     if number > 0
        
        % Get basic stats
        Istats = regionprops(labels,'basic','Centroid');

        [maxVal, maxIndex] = max([Istats.Area]);

        Xcentroid2 = [Xcentroid2 Istats(maxIndex).Centroid(1)];
        Ycentroid2 = [Ycentroid2 Istats(maxIndex).Centroid(2)];
        
     end
end

imshow(['balls/img489.jpg']);
hold on;
scatter(Xcentroid1, Ycentroid1, 'MarkerFaceColor','g');
scatter( Xcentroid2, Ycentroid2, 'MarkerFaceColor', 'b');

