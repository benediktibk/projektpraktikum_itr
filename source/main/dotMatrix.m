function [ Matrix ] = dotMatrix( vector )
x = vector(1);
y = vector(2);
z = vector(3);

Matrix = [x y z 0 0 0;0 x 0 y z 0; 0 0 x 0 y z];
end

