function [u] = lid_bc_u(u,Nx,Ny)
%at the north and south boundaries
for i = 1 : Nx+1
    u(i,1)    =   -u(i,2)    ;
    u(i,Ny+2) = 2 -u(i, Ny+1);
end

%at the east and west boundary
for j = 2 : Ny+1
    u(1,j)  = 0 ;
    u(Nx+1,j) = 0;
end

