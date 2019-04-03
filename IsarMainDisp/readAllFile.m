% charArray = readfile(fid)
% Read file 'fid' and return a MATLAB string with the contents
% of the file.
function charArray = readAllFile(fid) %#codegen

narginchk(1,1)

% Call fopen(filename 'r'), but we need to convert the MATLAB
% string into a C type string (which is the same string with the
% NUL (\0) string terminator).
% fid = fopen(filename, 'r'); % zaten dýþarýda dosyayý açýyor.

% Call fseek(fid, 0, SEEK_END) to set file position to the end of
% the file.
fseek(fid, 0, 'eof');

% Call ftell(fid) which will return the length of the file in bytes
% (as current file position is at the end of the file).
filelen = int64(ftell(fid));

% Reset current file position
fseek(fid,0,'bof');

% Initialize a buffer. Must be int32 for portability
maxBufferSize = int64(2^16); % maximum of int32
buffer = zeros(1, maxBufferSize,'uint8');

% Remaining is the number of bytes to read (from the file)
remaining = filelen;

% Index is the current position to read into the buffer
index = int64(1);
bufferAccessed=false;
Nul= int64(0);
CR= int64(0);
LF= int64(0);

while remaining > 0
    % Buffer overflow?
    if remaining + index > size(buffer,2)
        fprintf('Attempt to read file which is bigger than internal buffer.\n');
        fprintf('Current buffer size is %d bytes and file size is %d bytes.\n', maxBufferSize, filelen);
        % Then adjust new buffer but it is not efficient
        newBufferSize = int32(2^16);
        buffer = [buffer, zeros(1, newBufferSize,'uint8')];
        bufferAccessed=true;
        % break
    end
    % Read as much as possible from the file into internal buffer
    
    [dataRead, nread] = fread(fid,remaining, 'char'); %critical
    buffer(index:index+nread-1) = dataRead;
    n = int64(nread);
    if n == 0
        fprintf('Nothing more to read'); % Nothing more to read
        break;
    end
    % Did something went wrong when reading?
    if n < 0
        fprintf('Could not read from file: %d.\n', n);
        break;
    end
    
    % Update state variables
    remaining = remaining - n;
    index = index + n;
end

charArray = char(buffer(1:index-1));
% if bufferAccessed
%     charArray = char(buffer(1:index-1));
% else
%     charArray = char(buffer(1:index-1));
% end

