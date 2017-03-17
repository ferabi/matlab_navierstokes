clear 
clc

%variables
%the boundaries of the geometry

xmin = 0;
xmax = 1;
ymin = 0;
ymax = 1;

%number of points in each direction for pressure,
%u and v, remember that the variables are staggered
%in space, so visualisation will be a little different
%also used to make the space discretisation
Nx = 40;
Ny = 40;
dx = (xmax-xmin)/Nx;
dy = (ymax-ymin)/Ny;

%time stuff that is required for time iterations
dt =0.000001;
t = 0;
tmax = 4;

%Reynolds number
rey = 100;

%setting up the variables

%the temp variables
ustar = zeros(Ny+2, Nx+1);
vstar = zeros(Ny+1, Nx+2);

%the previous values of velocities at n
un = zeros(Ny+2, Nx+1);
vn = zeros(Ny+1, Nx+2);
%size(un,2)
%un(1,:) = 1;

%the solution velocities at n+1
un1 = zeros(Ny+2, Nx+1);
vn1 = zeros(Ny+1, Nx+2);

%the pressure at old and new time level
pn = zeros(Ny+2, Nx+2);
pn1= zeros(Ny+2, Nx+2);

time_steps = 200;

%maximum iterations and tolerance
maxiter = 1000;
tol = 1e-7;
X = linspace(xmin,xmax + dx,Nx);
%going through the time steps:
for n = 1
     
     %boundary conditions for plug flow
     %pn = boundary_press(pn);
     %vn = boundary_vel_v(vn,Nx,Ny);
     %un = boundary_vel_u(un,Nx,Ny);
     
     %boundary conditions for lid driven cavity problem
     pn = lid_bc_p(pn,Nx,Ny);
     vn = lid_bc_v(vn,Nx,Ny);
     un = lid_bc_u(un,Nx,Ny);
    
     %calculating stuff
     [ustar, vstar] = setupinter_vel(ustar, vstar,un,vn,dx,dy,dt,rey,Nx,Ny);
     pn1            = setuppressure(pn1, pn,ustar,vstar,dx,dy,dt,maxiter,Nx,Ny);
     [un1, vn1]     = setupfinalvelocities(un1, vn1, ustar,vstar, pn1, dx, dy,dt, Nx,Ny); 
     
     %update stuff
     vn = vn1;
     un = un1;
     pn = pn1;
     %contourf(X,X,un1)
    X = linspace(0,1,Nx+1);
    Y = linspace(0,1,Ny+2);
    
    %figure(1);
%    contour(Y,X,un1)
    %figure(2);
%    contour(X,Y,vn1);
    figure(1);
    contourf(X,Y,un1)
    pause(0.001)
 end