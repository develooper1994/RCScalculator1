function DisplayObject(obj,theta,phi)
%UNTÝTLED2 Summary of this function goes here
%   Detailed explanation goes here
theta=theta-90;

object.vertices = obj.v(:,1:3)/1000;
object.faces = obj.f.v;
hh = patch(object,'FaceColor',       [0.5 0.5 0.5], ...
    'EdgeColor',       'none',        ...
    'FaceLighting',    'gouraud',     ...
    'FaceAlpha', .2, ...
    'AmbientStrength', 0.00);

rotate(hh,[0 0 1],phi);
rotate(hh,[0 1 0],theta)  ;

dz = min(hh.Vertices(:,3));

hh.Vertices(:,3)=hh.Vertices(:,3)+abs(dz)*2*ones(size(hh.Vertices(:,3)));


% translate(hh.Faces,[0 0 dz*1.1])


% Add a camera light, and tone down the specular highlighting
camlight('headlight');
material('dull');

% Fix the axes scaling, and set a nice view angle
axis('image');
view([0 90]);
% grid on;
% title(fname);
% set(gca,'FontName', 'Arial', 'FontSize',12,'FontWeight','Bold');
% xlabel('x'); ylabel('y'); zlabel('z');
% %
end

