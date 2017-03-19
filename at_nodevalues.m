function [u_av,v_av,p_av] = at_nodevalues(un1,vn1,pn1, Nx,Ny)
u_av  = 1/2 * (un1(1:Nx+1,1:Ny+1)+ un1(1:Nx+1,2:Ny+2));
v_av  = 1/2 * (vn1(1:Nx+1,1:Ny+1)+ vn1(2:Nx+2,1:Ny+1));
pav1  = 1/2 * (pn1(1:Nx+1,1:Ny+2)+ pn1(2:Nx+2,1:Ny+2));
p_av  = 1/2 * (pav1(1:Nx+1,1:Ny+1)+ pav1(1:Nx+1,2:Ny+2));
end

