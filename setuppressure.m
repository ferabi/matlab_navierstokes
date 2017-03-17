function [pressuren1] = setuppressure( pressuren1, pn, ustar, vstar, dx, dy, dt, maxiter,Nx,Ny)

%calculating the pressure field

%rhs of pressure equations that are esentially constant
%RHS_p = zeros(Nx+2, Ny+2);

% for i = 2: Nx-1
%     for j = 2 : Ny-1
%         RHS_p(i,j) = 1/dx*(ustar(i,j) - ustar(i+1,j)) + 1/dy * (vstar(i,j) - vstar(i,j+1));
%     end
% end
%writing down some constants
c1 = dt/(dx*dx);
c2 = dt/(dy*dy);
c3 = 2*(dt/(dx*dx)+ dt/(dy*dy));

%setting up first iteration for new pressure

%setting up pressure
%pressuren1 = zeros(Nx+2, Ny+2);

%setting up the rest of the matrix entries
% for i = 2 : Nx+1
%     for j = 2 : Nx+1
%         pressuren1(i,j) = 1/c3 * (RHS_p(i,j) + c1*(pn(i+1,j) + pn(i-1,j)) ...
%                                              + c2*(pn(i,j+1) + pn(i,j-1)) ...
%                             );
%     end
% end

%setting up the jacobi iterations
for iter = 1: maxiter
        %updating from the previous iteration
        for i = 3 : Nx-1
            for j = 3 : Ny-1
                pressuren1(j,i) = 1/c3*(  1/dx*(ustar(j,i) - ustar(j,i+1)) ...
                                        + 1/dy*(vstar(j,i) - vstar(j+1,i)) ...
                                        + c1  *(pn(i+1,j)  + pn(i-1,j))    ...
                                        + c2  *(pn(i,j+1)  + pn(i,j-1))    ...
                                        );    
            end
        end
        pn = pressuren1;
end
                       