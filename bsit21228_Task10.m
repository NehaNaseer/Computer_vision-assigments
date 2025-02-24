% Read the image
Coins = imread('Coin.png');

% Convert the image to binary
CoinsBW = imbinarize(Coins);

% Find the boundary of the object (coin) at coordinate (27,60)
CoinBoundary = bwtraceboundary(CoinsBW, [27, 60], 'N');

% Display the original image
imshow(Coins);
hold on;

% Plot the detected boundary in red
plot(CoinBoundary(:,2), CoinBoundary(:,1), 'r', 'LineWidth', 2);

hold off;
