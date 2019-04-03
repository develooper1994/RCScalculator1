function [mat, padded] = vec2mat(vec, matCol, padding)
%VEC2MAT Convert a vector into a matrix. MODIFIED!!!
%   MAT = VEC2MAT(VEC, MATCOL) converts the vector VEC into a matrix with
%   MATCOL columns, creating one row at a time. If the length of VEC is not
%   a multiple of MATCOL, then the function places extra entries of 0 in the
%   last row of MAT.
%
%   MAT = VEC2MAT(VEC, MATCOL, PADDING) is the same as the first syntax,
%   except that the extra entries are taken from the matrix PADDING, in order.
%   If the number of elements in PADDING is insufficient, the last element is
%   used for the remaining entries.
%
%   [MAT, PADDED] = VEC2MAT(...) returns an integer PADDED that indicates
%   how many extra entries were placed in the last row of MAT.
%
%   See also RESHAPE.
%   Copyright 2019 Mustafa Selçuk Çaðlar

narginchk(2,3);	% 2 or 3 inputs required
if ~ismatrix(vec)
%     error(message('comm:vec2mat:InvalidVec'));
    fprintf('comm:vec2mat:InvalidMatcol\n');
elseif (length(matCol) ~= 1 || ~isfinite(matCol) || ~isreal(matCol)...
        || floor(matCol) ~= matCol || matCol < 1)
%     error(message('comm:vec2mat:InvalidMatcol'));
    fprintf('comm:vec2mat:InvalidMatcol\n');
end

[vecRow, vecCol] = size(vec);
vecLen = vecRow*vecCol;
NewVec=zeros(vecRow,vecCol);
if vecCol == matCol
    mat = vec;
    padded = 0;
    return;			% nothing to do
elseif ~isrow(vec) 
    % 1) "vec" her zaman mx1 þeklinde "coloumn vectör" olarak geliyorsa
    % reshape iþlemine gerek yok. Çünkü transpoze zaten bu iþlemi yapýyor.
    fprintf('warning: Vectors should be row vectors (1 x n)\n');
    NewVec=vec.';
elseif vecRow > 1
    % up to seçeneðiyle ->
        % Dimension 2 is fixed on the left-hand side but varies on the right ([:? x 1] ~= [1 x :?]).
    % fixed size seçeneðiyle ->
    % Size mismatch (size [10000 x 1] ~= size [1 x 10000]).
%The size to the left is the size of the left-hand side of the assignment.
    % HATAYI DÜZELT!
    
    % 2) Size mismatch için önceden zeros ile gecici bellekten yer
    % ayýrtabilirim yada daha basit iþlemler kullanabilirim. Ýþte
    % alternatif çözüm.
%     segs=length(vec);
%     M=segs/matCol;
%     Mc=ceil(M);
%     vec=[vec nan(  1, Mc*matCol-segs)];
% 
%     vec=reshape(vec,matCol,Mc).';
    
    % original sadece bu satýr. SAKIN SÝLME!
    NewVec=vec.';
    NewVec = reshape(NewVec, [1 vecLen]);
end

% try
%     if nargin < 3 || isempty(padding)
%         padding = cast(0, class(vec));	% default padding
%     else
%         padding = cast(padding(:).', class(vec));
%     end
% catch exception
%     throw(exception)
% end
if nargin < 3 || isempty(padding)
    padding = cast(0, class(NewVec));	% default padding
else
    padding = cast(padding(:).', class(NewVec));
end


paddingLen = length(padding);
matRow = ceil(vecLen/matCol);
padded = matRow*matCol - vecLen;	% number of elements to be padded
if padded-paddingLen<0
    fprintf('Error: comm:vec2mat:InvalidMatcol\n');
    mat = reshape(NewVec, matCol, matRow).';
else % Looks silly but I will edit.
    NewVec = [NewVec, padding(1:min(padded, paddingLen)),...
       repmat(padding(paddingLen), 1, padded-paddingLen)];	% padding
    mat = reshape(NewVec, matCol, matRow).';
end