% Interpolation of scattered data
%
% Parker, R. L., Shure, L. & Hildebrand, J.,
% The application of inverse theory to seamount magnetism
% Reviews of Geophysics vol 25, pp 17-40, 1987.
% x is latitude (degrees),
% y is longitude (degrees),
% z is negative depth (meters).
%
%
% WHO   DATE            WHAT
% DAA   Mar 7, 2010    First algorithm (based on the one already
%                      implemented in MATLAB)
%
% DAA - Diego Andrés Alvarez Marín - diegoandresalvarez@gmx.net

load seamount          % reads x, y, z, caption
k = convhull(x,y);     % calculates indices of convex hull

% Where do the readings were done?
figure
plot(x,y,'.','MarkerSize',10);
hold on;
plot(x(k),y(k),'r-');  % plots convex hull
grid on;
xlabel('Longitude (degrees)');
ylabel('Latitude (degrees)');

% The dataset in 3D
figure
hidden on
tri = delaunay(x,y);   % Delaunay triangulation
trimesh(tri,x,y,z);
grid on
xlabel('Longitude (degrees)');
ylabel('Latitude  (degrees)');
zlabel('Depth in meters');

% The dataset in 3D
figure
hidden on
tri = delaunay(x,y);   % Delaunay triangulation
trisurf(tri,x,y,z);
grid on
xlabel('Longitude (degrees)');
ylabel('Latitude  (degrees)');
zlabel('Depth in meters');

% Contours
figure
[xi,yi] = meshgrid(210.8:.01:211.8,-48.5:.01:-47.9);
zi = griddata(x,y,z,xi,yi,'cubic');
[c,h] = contour(xi,yi,zi,'b-');
clabel(c,h);
xlabel('Longitude (degrees)');
ylabel('Latitude  (degrees)');