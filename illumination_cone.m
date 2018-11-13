im1 = imread('A1.jpg');
im1 = reshape(im1, 1, []);

T = zeros(5, length(im1));
T(1,:) = im1;

for i = 2:5
    name = strcat(strcat('A',num2str(i)),'.jpg');
    im = imread(name);
    T(i,:) = reshape(im, 1, []);
end

[v,d] = svds(T*T', 3);
B = T'*v*d^(-0.5);

% phi = 250
% theta = 45
% s = [cosd(theta)*sind(phi), sind(theta)*sind(phi), cosd(phi)]';
% b = max(B*s,0);
% final = reshape(b, 808,807);
% imshow(final,[])

for theta = 0:30:360
    for phi = 0:30:360
        s = [cosd(theta)*sind(phi), sind(theta)*sind(phi), cosd(phi)]';
        b = max(B*s,0);
        final = imresize(reshape(b, 808,807),0.75);
        text = sprintf('Phi = %i\tTheta = %i',phi, theta)
        imshow(final,[])
    end
end