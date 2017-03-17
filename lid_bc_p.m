function [ pressure ] = lid_bc_p(pressure, Nx, Ny)
%at the north bundary
pressure(1,:) = pressure(2,:);
%at the south boundary
pressure(Ny+2,:) = pressure(Ny+1,:);
%at the east boundary
pressure(:,1) = pressure(:,2);
%at the west boundary
pressure(:,Nx+2) = pressure(:,Nx+1);
end

