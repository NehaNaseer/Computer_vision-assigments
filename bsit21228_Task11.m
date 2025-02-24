% Read the image
Coins = imread('coins.png');

% Convert the image to binary
CoinsBW = imbinarize(rgb2gray(Coins));

% Fill holes in the binary image
FilledCoinsBW = imfill(CoinsBW, 'holes');

% Extract boundaries of objects
Boundaries = bwboundaries(FilledCoinsBW);

% Display the original image
imshow(Coins);
hold on;

% Plot the boundary of the 2nd object in red
plot(Boundaries{2}(:,2), Boundaries{2}(:,1), 'r', 'LineWidth', 2);

% Plot the boundary of the 7th object in green
plot(Boundaries{7}(:,2), Boundaries{7}(:,1), 'g', 'LineWidth', 2);

hold off;
