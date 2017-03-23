function [ U, V ] = setupfinalvelocities(U,V, ustar, vstar, pressure,Nx,Ny, dx, dy, dt)
%gives the final velocities taking into consideration the pressure field

for i = 2 : Nx
    for j = 2 : Ny+1
        U(i,j) = ustar(i,j) - (dt/dx)*(pressure(i+1,j)- pressure(i,j)) ;  
    end
end

for i = 2 : Nx+1
    for j = 2 : Ny
        V(i,j) = vstar(i,j) - (dt/dy)*(pressure(i,j+1)- pressure(i,j));
    end
end
U = boundary_vel_u(U,Nx,Ny);
V = boundary_vel_v(V,Nx,Ny);
end

