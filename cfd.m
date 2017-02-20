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
Nx = 100;
Ny = 100;
dx = (xmax - xmin)/Nx;
dy = (ymax - ymin)/ Ny;

%time stuff that is required for time iterations
dt = 0.009;
t = 0;
tmax = 0.009;

%Reynolds number
rey = 1;

%setting up the variables

%the temp variables
ustar = zeros(Nx, Ny);
vstar = zeros(Nx, Ny);

%the previous values of velocities at n
un = zeros(Nx, Ny);
vn = zeros(Nx, Ny);

%the solution velocities at n+1
un1 = zeros(Nx, Ny);
vn1 = zeros(Nx, Ny);

%the pressure at old and new time level
pn = zeros(Nx, Ny);
pn1 =zeros(Nx, Ny);

time_steps = tmax/dt;

%maximum iterations and tolerance
maxiter = 100;
tol = 1e-7;
 
%going through the time steps:
 for n = 1 : time_steps
     
     %boundary conditions for pn, un, vn
     pn = boundary_press(pn);
     vn = boundary_vel_v(vn);
     un = boundary_vel_u(un);
     
     %calculating stuff
     [ustar, vstar] = setupinter_vel(un,vn,dx,dy,dt,rey);
     pn1            = setuppressure(pn,ustar,vstar,dx,dy,dt,maxiter,tol);
     [vn1, un1]     = setupfinalvelocities(ustar,vstar, pn1, dx, dy,dt); 
     
     %update stuff
     vn = vn1;
     un = un1;
     pn = pn1;

 end
 
     