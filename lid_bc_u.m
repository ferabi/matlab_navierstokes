function [u] = lid_bc_u(u,Nx,Ny)
    %at the north wall  
    u(1,:) = 2*1 - u(2,:);
    %at the south wall
    u(Ny+2,:) = -u(Ny+1,:);
    %at the west wall
    u(:,Nx+1) = 0;
    %at the east wall
    u(:,1) = 0;
end

