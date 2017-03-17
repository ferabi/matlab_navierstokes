function [Ustar,Vstar] = setupinter_vel(Ustar, Vstar,un , vn, dx, dy, dt, rey, Nx, Ny)

%Ustar = zeros(Ny+2,Nx+1);
%Vstar = zeros(Ny+1,Nx+2);
%size(un,1)
%size(un,2)
%constants that are used in the equation
c1 = (dt/(4*dx));
c2 = (dt/(4*dy));
c3 = (dt/(rey*dx*dx));
c4 = (dt/(rey*dy*dy));

%setting up ustar
for i = 2 : Nx%column number
    for j = 2 : Ny+1%row number
        
        Ustar(j,i) = un(j,i)- c1*((un(j,i+1)+ un(j,i))^2 -(un(j,i-1) + un(j,i))^2)  ...
                            - c2*(((un(j,i) + un(j+1,i)) *(vn(j,i+1) + vn(j,i)))-   ...
                                  ((un(j,i) + un(j-1,i)) *(vn(j-1,i) + vn(j-1,i+1)))...
                                  )                                                 ...
                            + c3*(un(j,i+1) -2*un(j,i) + un(j,i-1))                 ...
                            + c4*(un(j+1,i) -2*un(j,i) + un(j-1,i));
    end
end

%setting up vstar
for i = 2: Nx+1%column number
    for j = 2:Ny%row number
        Vstar(j,i) = vn(j,i) - c2*((vn(j+1,i)   + vn(j,i))^2 -(vn(j,i)   + vn(j-1,i))^2)...
                             - c1*(((un(j+1,i)  + un(j,i))   *(vn(j,i+1) + vn(j,i)))-   ...
                                   ((un(j+1,i-1)+ un(j,i-1)) *(vn(j,i)   + vn(j,i-1)))  ...
                                   )                                                    ...
                             + c3*(vn(j,i+1) -2*vn(j,i) + vn(j,i-1))                    ...
                             + c4*(vn(j+1,i) -2*vn(j,i) + vn(j-1,i));
    end
end
end

