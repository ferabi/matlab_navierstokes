function [ Ustar, Vstar ] = setupinter_vel(Ustar, Vstar, un ,vn,Nx,Ny, dx, dy, dt, rey)

%constants that are used in the equation
c1 = (dt/(4*dx));
c2 = (dt/(4*dy));
c3 = (dt/(rey*dx*dx));
c4 = (dt/(rey*dy*dy));

for i = 2 : Nx
    for j = 2 : Ny+1
        %setting up ustar
        Ustar(i,j) = un(i,j) - c1*((un(i+1,j)+ un(i,j))^2 -(un(i-1,j) + un(i,j))^2)  ...
                             - c2*(((un(i,j) + un(i,j+1))*(vn(i+1,j) + vn(i,j)))-    ...
                                   ((un(i,j) + un(i,j-1))*(vn(i,j-1) + vn(i+1,j-1))) ...
                                   )                                                 ...
                             + c3*(un(i+1,j) -2*un(i,j) + un(i-1,j))                 ...
                             + c4*(un(i,j+1) -2*un(i,j) + un(i,j-1));
    end
end
for i = 2 : Nx+1
    for j = 2 : Ny
        %setting up vstar
        
        Vstar(i,j) = vn(i,j) - c2*((vn(i,j+1)+vn(i,j))^2 -(vn(i,j) + vn(i,j-1))^2)   ...
                             - c1*(((un(i,j+1) + un(i,j))*(vn(i+1,j) + vn(i,j)))-    ...
                                   ((un(i-1,j+1) + un(i-1,j))*(vn(i,j) + vn(i-1,j))) ...
                                   )                                                 ...
                             + c3*(vn(i+1,j) -2*vn(i,j) + vn(i-1,j))                 ...
                             + c4*(vn(i,j+1) -2*vn(i,j) + vn(i,j-1));
    end
end

end

