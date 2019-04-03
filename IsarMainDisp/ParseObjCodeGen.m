function obj = ParseObjCodeGen(fname)%#codegen
%UNTİTLED Summary of this function goes here
%   Detailed explanation goes here
% kepce.obj içinde Vertices ve Faces sayıları varken önceden hafızada yer
% ayırılabilir!
% # Vertices: 4618
% # Faces: 9283

v = []; vt = []; vn = []; f.v = []; f.vt = []; f.vn = [];

fid = fopen(fname);
% begin = !TEST ET
y=readAllFile(fid);
tlineAll=seperateLines(y); % string veriyorsa döngü içinde char ile çevir
% end
for tline=tlineAll % tüm satırları böylece gezmesi gerekiyor.
% while 1
%     tline = fgetl(fid);
    % Only way to exit from infinite-loop. loop tracking tline
    tline=char(tline);
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

obj=struct('v',v,'vt',vt,'vn',vn,'f',f);
fclose(fid);

end

