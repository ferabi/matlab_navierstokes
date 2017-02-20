function [pressuren1] = setuppressure( pn, ustar, vstar, dx, dy, dt, maxiter, tol)

%i hate this implementation,
%its gonna be so slow :(

Nx = size(pn,1);
Ny = size(pn,2);

%rhs of pressure equations that are esentially constant
RHS_p = zeros(Nx, Ny);


for i = 2: Nx -1
    for j = 2 : Ny -1
        RHS_p(i,j) = 1/dx*(ustar(i,j) - ustar(i+1,j)) + 1/dy * (vstar(i,j) - vstar(i, j+1));
    end
end
%writing down some constants
c1 = dt/(dx*dx);
c2 = dt/(dy*dy);
c3 = 2*(dt/(dx*dx)+ dt/(dy*dy));

%setting up first iteration for new pressure

%setting up pressure
pressuren1 = zeros(Nx, Ny);

%the boundaries obviously need to be the same as the previous pressure
%can become redundant when I set up pressure BCs
pressuren1(1,:)  = pn(1,:);
pressuren1(Nx,:) = pn(Nx,:);
pressuren1(:,1)  = pn(:,1);
pressuren1(:, Ny)= pn(:, Ny);

%setting up the rest of the matrix entries
for i = 2 : Nx-1
    for j = 2 : Nx-1
        pressuren1(i,j) = 1/c3 * (RHS_p(i,j) + c1*(pn(i+1,j) + pn(i-1,j)) ...
                                             + c2*(pn(i,j+1) + pn(i,j-1)) ...
                            );
    end
end

%setting up the jacobi iterations
for iter = 1: maxiter
    while(norm(pressuren1 - pn) > tol)
        %updating from the previous iteration
        pn = pressuren1;
        for i = 2 : Nx-1
            for j = 2 : Ny-1
                pressuren1(i,j) = 1/c3*(RHS_p(i,j) + c1*(pn(i+1,j) + pn(i-1,j)) ...
                                                  +  c2*(pn(i,j+1) + pn(i,j-1))  ...
                                       );
            end
        end
    end
end
                       