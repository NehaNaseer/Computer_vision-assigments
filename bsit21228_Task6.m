
Identify which intensity transformation was used on liftingbody.png to create each of the 
four results below. Write a script to reproduce the results using the intensity transformation 
functions. 
CODE:

function intensityTransformations()
    % Read the original image
    originalImage = imread('house.jpeg');
    
    % Ensure the image is grayscale
    if ndims(originalImage) == 3
        originalImage = rgb2gray(originalImage);
    end
    
    % Apply transformations
    % 1. Darkened image (Result 1)
    result1 = imadjust(originalImage, [], [], 0.5); % Gamma correction with gamma < 1
    % 2. Brightened image (Result 2)
    result2 = imadjust(originalImage, [], [], 1.5); % Gamma correction with gamma > 1
    % 3. High contrast image (Result 3)
    result3 = histeq(originalImage); % Histogram equalization
    % 4. Low contrast image (Result 4)
    result4 = imadjust(originalImage, [0.3 0.7], [0.4 0.6]); % Adjust intensity range
    
    % Display results
    figure;
    subplot(2, 3, 1);
    imshow(originalImage);
    title('Original Image');
    
    subplot(2, 3, 2);
    imshow(result1);
    title('Result 1: Darkened');
    
    subplot(2, 3, 3);
    imshow(result2);
    title('Result 2: Brightened');
    
    subplot(2, 3, 4);
    imshow(result3);
    title('Result 3: High Contrast');
    
    subplot(2, 3, 5);
    imshow(result4);
    title('Result 4: Low Contrast');
end
