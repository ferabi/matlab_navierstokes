function [pressure] = boundary_press(pressure,Nx,Ny)

%at the north and south boundaries
for i = 1 : Nx+2  
    pressure(i,Ny+2)   = pressure(i,Ny+1);
    pressure(i,1) = pressure(i,2);
end

%at the east and west wall
for j = 1 : Ny+2 
    pressure(Nx+2,j)= -pressure(Nx+1,j);
    pressure(1,j)   = pressure(2,j); 
end

%at the north and south wall #game of thrones references :p




