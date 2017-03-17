function [v] = lid_bc_v( v,Nx,Ny )
    %at the north boundary
    v(1,:) = 0;
    %at the  south boundary
    v(Ny+1,:) = 0;
    %at the west boundary
    v(:,Nx+2) = -v(:,Nx+1);
    %at the east boundary
    v(:,1) = -v(:,2);
end

