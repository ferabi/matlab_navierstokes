function [ v ] = boundary_vel_v( v, Nx, Ny)

%at the north and south boundaries
for i = 1 : Nx+2
    v(i,Ny+1)   = 0;
    v(i,1)      = 0;
end

%at the east and west boundaries
for j = 1 : Ny+1
    v(1,j)    = -v(2,j);
    v(Nx+2,j) =  v(Nx+1,j);
end

end

