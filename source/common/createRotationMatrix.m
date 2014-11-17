function R = createRotationMatrix(phi)
    R_x = [1 0 0; 0 cos(phi(1)) -sin(phi(1)); 0 sin(phi(1)) cos(phi(1))];
    R_y = [cos(phi(2)) 0 sin(phi(2)); 0 1 0; -sin(phi(2)) 0 cos(phi(2))];
    R_z = [cos(phi(3)) -sin(phi(3)) 0; sin(phi(3)) cos(phi(3)) 0; 0 0 1];
    R = inv(R_x*R_y*R_z);
end

