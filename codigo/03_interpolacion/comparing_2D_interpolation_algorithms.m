% Comparing 2D interpolation methods already implemented in MATLAB
%
% WHO   DATE            WHAT
% DAA   Mar 7, 2010    First algorithm
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net

% Sample points
[x,y] = meshgrid(-3:1:3);
z = peaks(x,y);

% Generate a finer mesh for interpolation:
[xi,yi] = meshgrid(-3:0.25:3);
zi = peaks(xi,yi);

% Interpolate:
zi1 = interp2(x,y,z,xi,yi,'nearest'); % nearest neighbor
zi2 = interp2(x,y,z,xi,yi,'linear');  % bilinear
zi3 = interp2(x,y,z,xi,yi,'cubic');   % bicubic
zi4 = interp2(x,y,z,xi,yi,'spline');  % spline

ax = [-3 3 -3 3 min(min(zi)) max(max(zi))];
figure;
subplot(2,3,1);     surf(xi,yi,zi1);       title('nearest');  axis(ax);
subplot(2,3,2);     surf(xi,yi,zi2);       title('bilinear'); axis(ax);
subplot(2,3,4);     surf(xi,yi,zi3);       title('bicubic');  axis(ax);
subplot(2,3,5);     surf(xi,yi,zi4);       title('spline');   axis(ax);
subplot(2,3,3);     surf(xi,yi,zi);        title('original'); axis(ax);
hold on;
plot3(x,y,z,'k*','MarkerSize',10);
axis(ax);

figure;
subplot(2,3,1);     contour(xi,yi,zi1,20); title('nearest');  axis equal tight;
subplot(2,3,2);     contour(xi,yi,zi2,20); title('bilinear'); axis equal tight;
subplot(2,3,4);     contour(xi,yi,zi3,20); title('bicubic');  axis equal tight;
subplot(2,3,5);     contour(xi,yi,zi4,20); title('spline');   axis equal tight;
subplot(2,3,[3 6]); contour(xi,yi,zi,20);  title('original'); axis equal tight;
hold on;
plot(x,y,'k*','MarkerSize',10);
axis equal tight;