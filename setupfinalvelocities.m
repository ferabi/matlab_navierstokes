function [ U, V ] = setupfinalvelocities(U,V, ustar, vstar, pressure,Nx,Ny, dx, dy, dt)
%gives the final velocities taking into consideration the pressure field

for i = 1 : Nx+1
    for j = 1 : Ny+2
        U(i,j) = ustar(i,j) - (dt/dx)*(pressure(i+1,j)- pressure(i,j)) ;  
    end
end

for i = 1 : Nx+2
    for j = 1 : Ny+1
        V(i,j) = vstar(i,j) - (dt/dy)*(pressure(i,j+1)- pressure(i,j));
    end
end

end

