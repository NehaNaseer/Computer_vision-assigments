
image = imread('Bird.jpg'); 
gamma_values = [0.5, 1.0, 2.0]; 
figure;

for i = 1:length(gamma_values)
    gamma_corrected = imadjust(image, [], [], gamma_values(i));
    subplot(1, length(gamma_values), i);
    imshow(gamma_corrected);
    title(['Gamma = ', num2str(gamma_values(i))]);
end
sgtitle('Gamma Correction Examples');

