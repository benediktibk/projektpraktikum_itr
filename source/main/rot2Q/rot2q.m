%/*****************************************************************************/
%/*                                                                           */
%/* Collaborative Research Centre of the DFG:                                 */
%/*                                                                           */
%/*   SFB453 High-Fidelity Telepresence and Teleaction                        */
%/*                                                                           */
%/*   Project I1: Integrated Mobile and Bimanual Multi-User Telepresence and  */
%/*               Teleaction Systems with Haptic Feedback                     */
%/*                                                                           */
%/*                                                                           */
%/*****************************************************************************/
%/*                                                                           */
%/* Transformation of Quaternion to rotation matrix                           */
%/*                                                                           */
%/* Organization: Institute of Automatic Control Engineering (LSR)            */
%/* Authors:      Angelika Peer                                               */
%/*               Kwang Kyu Leer                                              */  
%/* Contact:      mailto: Angelika.Peer@tum.de                                */
%/*                        					              */
%/* Date:	  12.2004                                                     */
%/* (C) 2002 - 2007, Technische Universitaet Muenchen. All rights reserved.   */
%/*                                                                           */
%/*****************************************************************************/

function Q=rot2q(r)
%Q=zeros(1,4);
%Q(1)=0.5*sqrt(r(1,1)+r(2,2)+r(3,3)+1);
%Q(2)=0.5*sign(r(3,2)-r(2,3))*sqrt(r(1,1)-r(2,2)-r(3,3)+1);
%Q(3)=0.5*sign(r(1,3)-r(3,1))*sqrt(r(2,2)-r(3,3)-r(1,1)+1);
%Q(4)=0.5*sign(r(2,1)-r(1,2))*sqrt(r(3,3)-r(1,1)-r(2,2)+1);

if all(size(r) == [4 4])
   r = r(1:3,1:3);
end 

qs = sqrt(trace(r)+1)/2.0;
kx = r(3,2) - r(2,3);	% Sz - Ay
ky = r(1,3) - r(3,1);	% Ax - Nz
kz = r(2,1) - r(1,2);	% Ny - Sx

if (r(1,1) >= r(2,2)) & (r(1,1) >= r(3,3)) 
	kx1 = r(1,1) - r(2,2) - r(3,3) + 1;	% Nx - Sy - Az + 1
	ky1 = r(2,1) + r(1,2);			% Ny + Sx
	kz1 = r(3,1) + r(1,3);			% Nz + Ax
	add = (kx >= 0);
elseif (r(2,2) >= r(3,3))
	kx1 = r(2,1) + r(1,2);			% Ny + Sx
	ky1 = r(2,2) - r(1,1) - r(3,3) + 1;	% Sy - Nx - Az + 1
	kz1 = r(3,2) + r(2,3);			% Sz + Ay
	add = (ky >= 0);
else
	kx1 = r(3,1) + r(1,3);			% Nz + Ax
	ky1 = r(3,2) + r(2,3);			% Sz + Ay
	kz1 = r(3,3) - r(1,1) - r(2,2) + 1;	% Az - Nx - Sy + 1
	add = (kz >= 0);
end

if add
	kx = kx + kx1;
	ky = ky + ky1;
	kz = kz + kz1;
else
	kx = kx - kx1;
	ky = ky - ky1;
	kz = kz - kz1;
end
nm = norm([kx ky kz]);
if nm == 0,
	Q = [1 0 0 0];
else
	s = sqrt(1 - qs^2) / nm;
	qv = s*[kx ky kz];
	Q = [qs qv];
end
