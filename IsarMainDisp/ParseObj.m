function obj = ParseObj(fname)
%UNTÝTLED Summary of this function goes here
%   Detailed explanation goes here
% kepce.obj içinde Vertices ve Faces sayýlarý varken önceden hafýzada yer
% ayýrýlabilir!
% # Vertices: 4618
% # Faces: 9283

if coder.target('MATLAB')
    v = []; vt = []; vn = []; f.v = []; f.vt = []; f.vn = [];
    fid = fopen(fname);
    while 1
        tline = fgetl(fid);
        % Only way to exit from infinite-loop. loop tracking tline
        if ~ischar(tline),   break,   end  % exit at end of file.
        ln = sscanf(tline,'%s',1); % line type
        %disp(ln)
        switch ln
            case 'v'   % mesh vertexs
                v = [v; sscanf(tline(2:end),'%f')'];
            case 'vt'  % texture coordinate
                vt = [vt; sscanf(tline(3:end),'%f')'];
            case 'vn'  % normal coordinate
                vn = [vn; sscanf(tline(3:end),'%f')'];
            case 'f'   % face definition
                fv = []; fvt = []; fvn = [];
                str = textscan(tline(2:end),'%s'); str = str{1};
                
                nf = length(strfind(str{1},'/')); % number of fields with this face vertices
                
                
                [tok, str] = strtok(str,'//');     % vertex only
                for k = 1:length(tok) fv = [fv str2double(tok{k})]; end
                
                if (nf > 0)
                    [tok, str] = strtok(str,'//');   % add texture coordinates
                    for k = 1:length(tok) fvt = [fvt str2double(tok{k})]; end
                end
                if (nf > 1)
                    [tok, ~] = strtok(str,'//');   % add normal coordinates
                    for k = 1:length(tok) fvn = [fvn str2double(tok{k})]; end
                end
                % f.v = [f.v; fv]; f.vt = [f.vt; fvt]; f.vn = [f.vn; fvn];
                f.v = [f.v; fv(:,1:3)];
                if ( ~isempty(fvt)) %length(fvt) > 0
                    f.vt = [f.vt; fvt(:,1:3)];
                end
                if (~isempty(fvn)) %length(fvt) > 0
                    f.vn = [f.vn; fvn(:,1:3)];
                end
        end
    end
    
else
    %#codegen
    coder.cinclude('C:\Users\selcu\Desktop\tez2\TinyObjLoader_CallBackExample\TinyObjLoader_CallBackExample.h');
    coder.updateBuildInfo('addSourceFiles', 'C:\Users\selcu\Desktop\tez2\TinyObjLoader_CallBackExample\TinyObjLoader_CallBackExample.c');
    % Pre-initialize y to double type.
    y = 0;
    y = coder.ceval('foo',x);
end

obj=struct('v',v,'vt',vt,'vn',vn,'f',f);
fclose(fid);

end

