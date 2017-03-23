function [pn] = setuppressure( pn, ustar, vstar, Nx, Ny, dx, dy, dt, maxiter)

% for i = 2 : Nx + 1
%     for j = 2 : Ny 
%         RHS_p(i,j) = c1 *(ustar(i,j) - ustar(i+1,j)) + c2 * (vstar(i,j) - vstar(i, j+1));
%     end
% end
%writing down some constants
c1 = 1/dx;
c2 = 1/dy;
c3 = dt/(dx*dx);
c4 = dt/(dy*dy);
c5 = 2*dt*(1/(dx*dx)+ 1/(dy*dy));


%setting up the jacobi iterations
for iter = 1: maxiter
    %updating from the previous iteration 
    for i = 2 : Nx+1
        for j = 2 : Ny+1
            pn(i,j) = 1/c5*(  c1 *(ustar(i-1,j) - ustar(i,j))  ...
                             + c2 *(vstar(i,j-1) - vstar(i,j))  ...
                             + c3 *(pn(i+1,j) + pn(i-1,j))      ...
                             + c4 *(pn(i,j+1) + pn(i,j-1))      ...
                            );
        end
    end
    %pn = pn1;
end
                       