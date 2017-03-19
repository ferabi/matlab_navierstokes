function [ pressure ] = lid_bc_p(pressure, Nx, Ny)
%at the west bundary
pressure(1,:) = pressure(2,:);
%at the east boundary
pressure(Nx+2,:) = pressure(Nx+1,:);
%at the south boundary
pressure(:,1) = pressure(:,2);
%at the north boundary
pressure(:,Ny+2) = pressure(:,Ny+1);
end

