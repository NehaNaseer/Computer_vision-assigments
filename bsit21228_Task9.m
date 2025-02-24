A = zeros(100, 100);
Cx = 50;  % Center X-coordinate
Cy = 50;  % Center Y-coordinate
Radius = 20;  % Radius

for i = 1:100
    for j = 1:100
        if sqrt((Cx - i)^2 + (Cy - j)^2) <= Radius
            A(i, j) = 255;  % Assign value for Euclidean distance
        end
    end
end

imshow(A);
title('Euclidean Distance');
