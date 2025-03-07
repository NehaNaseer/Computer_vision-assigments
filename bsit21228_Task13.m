% Read the binary image
BW = imread('Circle.png');

% Display original image
imshow(BW);

% Remove interior pixels, leaving only boundary pixels
BW2 = bwmorph(BW, 'remove');

% Display boundary image
figure, imshow(BW2);

% Perform skeletonization
BW3 = bwmorph(BW, 'skel', Inf);

% Display skeletonized image
figure, imshow(BW3);
