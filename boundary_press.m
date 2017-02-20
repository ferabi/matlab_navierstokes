function [ pressure ] = boundary_press( pressure )

%number of points
Nx = size(pressure,1);
Ny = size(pressure,2);

%at the north and south boundaries
for i = 1 : Nx
    pressure(i,1)   = pressure(i,2);
    pressure(i, Ny) = pressure(i, Ny -1);
end

%at the east and west wall
for j = 1 : Ny 
    pressure(Nx,j)  = -pressure(Nx-1,j);
    pressure(1,j)   =  pressure(2,j); 
end

%at the north and south wall #game of thrones references :p




