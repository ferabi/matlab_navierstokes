function [mass_cons] = mass_conservation(un,vn,dx,dy,Nx,Ny)
mass_cons = zeros(Nx,Ny);
for i = 2 : Nx + 1 
    for j = 2 : Ny+1
        mass_cons(i-1,j-1) = (un(i,j) - un(i-1,j))/dx + (vn(i,j) - vn(i,j-1))/dy;
    end
end
end

