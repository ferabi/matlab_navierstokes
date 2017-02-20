function [ U, V ] = setupfinalvelocities( ustar, vstar, pressure, dx, dy, dt)
%gives the final velocities taking into consideration the pressure field
Nx = size(ustar,1);
Ny = size(ustar,2);
U = zeros(Nx, Ny);
V = zeros(Nx, Ny);

for i = 2 : Nx-1
    for j = 2 : Ny-1
        U(i,j) = ustar(i,j) - (dt/dx)*(pressure(i,j)- pressure(i-1,j)) ;
        V(i,j) = vstar(i,j) - (dt/dy)*(pressure(i,j)- pressure(i,j-1));
    end
end

end

