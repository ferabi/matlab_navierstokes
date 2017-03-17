function [ U, V ] = setupfinalvelocities(U,V,ustar, vstar, pressure, dx, dy, dt,Nx,Ny)
%gives the final velocities taking into consideration the pressure field
%U = zeros(Ny+2, Nx+1);
%V = zeros(Ny+1, Nx+2);

for i = 2 : Nx
    for j = 2: Ny+1
        U(j,i) = ustar(j,i) - dt/dx * (pressure(j,i) - pressure(j,i-1));
    end
end

for i = 2 : Nx+1
    for j = 2: Ny
        V(j,i) = vstar(j,i) - dt/dy * (pressure(j,i) - pressure(j-1,i));
    end
end
end

