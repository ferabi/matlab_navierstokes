function [v] = lid_bc_v(v,Nx,Ny )

for i = 2 : Nx+1
    v(i,Ny+1)   = 0;
    v(i,1)      = 0;
end

for j = 1 : Ny+1
    v(1,j)    = -v(2,j);
    v(Nx+2,j) = -v(Nx+1,j);
end

end

