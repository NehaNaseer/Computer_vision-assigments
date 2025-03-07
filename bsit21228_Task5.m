
function main()
    % Test images (Replace these with actual file paths)
    testImages = {'flower.jpeg', 'house.jpeg', 'nature.jpeg'};
    
    % Process each image
    for i = 1:length(testImages)
        fprintf('Processing: %s\n', testImages{i});
        processImage(testImages{i});
    end
end

function processImage(filePath)
    % Read the input image
    image = imread(filePath);
    
    % Step 1: Detect the type of image
    imageType = detectImageType(image);
    fprintf('Image Type: %s\n', imageType);
    
    % Step 2: Analyze the image for issues
    issue = analyzeImageIssues(image);
    fprintf('Detected Issue: %s\n', issue);
    
    % Step 3: Resolve issues and enhance the image
    enhancedImage = resolveIssues(image, issue);
    
    % Display the original and enhanced images
    figure;
    subplot(1, 2, 1);
    imshow(image);
    title('Original Image');
    
    subplot(1, 2, 2);
    imshow(enhancedImage);
    title('Enhanced Image');
end

function imageType = detectImageType(image)
    % Detect whether the image is Binary, Grayscale, or RGB
    if ndims(image) == 2
        uniqueValues = unique(image);
        if length(uniqueValues) == 2
            imageType = 'Binary';
        else
            imageType = 'Grayscale';
        end
    elseif ndims(image) == 3
        imageType = 'RGB';
    else
        imageType = 'Unknown';
    end
end

function issue = analyzeImageIssues(image)
    % Analyze the image for over dark, over bright, low contrast, or normal
    if ndims(image) == 3
        grayImage = rgb2gray(image); % Convert RGB to Grayscale
    else
        grayImage = image;
    end
    
    % Compute mean and standard deviation of pixel intensities
    meanIntensity = mean(grayImage(:));
    stdIntensity = std(double(grayImage(:)));
    
    % Classify the issue based on thresholds
    if meanIntensity < 50
        issue = 'Over Dark';
    elseif meanIntensity > 200
        issue = 'Over Bright';
    elseif stdIntensity < 40
        issue = 'Low Contrast';
    else
        issue = 'Normal';
    end
end

function enhancedImage = resolveIssues(image, issue)
    % Resolve the detected issue in the image
    switch issue
        case 'Over Dark'
            enhancedImage = imadjust(image, [], [], 1.2); % Brighten
        case 'Over Bright'
            enhancedImage = imadjust(image, [], [], 0.8); % Darken
        case 'Low Contrast'
            if ndims(image) == 3 % RGB Image
                labImage = rgb2lab(image);
                L = labImage(:, :, 1);
                L = histeq(L / 100) * 100;
                labImage(:, :, 1) = L;
                enhancedImage = lab2rgb(labImage);
            else % Grayscale Image
                enhancedImage = histeq(image);
            end
        otherwise
            enhancedImage = image; % No enhancement needed
    end
end
