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
dx = (xmax - xmin)/Nx;
dy = (ymax - ymin)/Ny;
X = linspace(xmin,xmax,Nx);
Y = linspace(ymin,ymax,Ny);
%time stuff that is required for time iterations
dt = 0.00005;
t = 0;
tmax = 0.5;

%Reynolds number
rey = 1;

%setting up the variables

%the temporary variables
ustar = zeros(Nx+1, Ny+2);
vstar = zeros(Nx+2, Ny+1);

%the previous values of velocities at n
un = zeros(Nx+1, Ny+2);
vn = zeros(Nx+2, Ny+1);

%the solution velocities at n+1
un1 = zeros(Nx+1, Ny+2);
vn1 = zeros(Nx+2, Ny+1);

%the pressure at old and new time level
pn = zeros(Nx+2, Ny+2);
pn1 =zeros(Nx+2, Ny+2);

%variables to help visualize
u_av = zeros(Nx+1,Ny+1);
v_av = zeros(Nx+1,Ny+1);
p_av = zeros(Nx+1,Ny+1);

time_steps = tmax/dt;

%maximum iterations and tolerance
maxiter = 200;
%tol = 1e-7;
%vn(Nx+1,1:Ny+1 ) = 22;
%going through the time steps:
%defining mass conservation in each box
maximum = zeros(Nx,Ny);
 for n = 1:200
     %boundary conditions for pn, un, vn
     pn = boundary_press(pn,Nx,Ny);
     vn = boundary_vel_v(vn,Nx,Ny);
     un = boundary_vel_u(un,Nx,Ny);
     %boundary conditions for pn, un, vn lid driven cavity
%        pn = lid_bc_p(pn,Nx,Ny);
%        vn = lid_bc_v(vn,Nx,Ny);
%        un = lid_bc_u(un,Nx,Ny);
     
     %calculating stuff
     [ustar, vstar] = setupinter_vel(ustar,vstar,un,vn,Nx,Ny,dx,dy,dt,rey);
     pn1            = setuppressure(pn1,pn,ustar,vstar,Nx,Ny,dx,dy,dt, maxiter);
     [un1, vn1]     = setupfinalvelocities(un1,vn1,ustar,vstar,pn1,Nx,Ny,dx,dy,dt); 
     
     %update stuff
     vn = vn1;
     un = un1;
     pn = pn1;
     [u_av, v_av, p_av] = at_nodevalues(un,vn,pn,Nx,Ny);
     figure(1)
     axis equal;
     contourf(X,Y,pn1(2:Nx+1,2:Ny+1)',200)
     %figure(2)
     %axis equal;
     %figure(3)
     %axis equal;
     %surf(X,Y,un1)
     maximum = mass_conservation(un1,vn1,dx,dy,Nx,Ny);
     max(max(maximum))
     pause(0.00001)
 end
 
     