function [u] = boundary_vel_u(u,Nx,Ny)
%at the north and south boundaries
for i = 1 : Nx
    u(i,1)  = -u(i,2);
    u(i,Ny) = -u(i, Ny-1);
end

%at the east and west boundary
for j = 1 : Ny
    u(1,j)  = 1 ;%put the speed of inflow here, its a good idea to put into the parameters of the function
    u(Nx,j) = u(Nx-2,j);
end





