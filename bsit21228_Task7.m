C = zeros(100, 100); 
Cx = 50; % Center X-coordinate (you can change as per your requirement)
Cy = 50; % Center Y-coordinate (you can change as per your requirement)
Radius = 30; % Radius (adjust as needed)

for i = 1:100
    for j = 1:100
        if max(abs(Cx - i), abs(Cy - j)) <= Radius
            C(i, j) = 255; 
        end
    end
end

figure;
imshow(C);
title('Chessboard Distance');
