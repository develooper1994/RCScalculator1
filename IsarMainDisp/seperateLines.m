function tline = seperateLines(charArray) %#codegen
%SEPERATEDLINE
%   tline = all seperated and eliminated from Terminator Characters
%   charArray = not sperated and eliminated from Terminator Characters
%   Tüm satýrlarý beklemeden tek seferde ayýrýr ve Terminator Characters
%   siler. !Write in English

narginchk(1,1)

% charArray=readAllFile(fid);

% readAllFile and split by "Terminator character" with strtok
% örnek:
% str = "A horse! A horse! My kingdom for a horse!";
% [token, remain] = strtok(str,'!')
% [token, remain] = strtok(remain,'!')
% [token, remain] = strtok(remain,'!')
% [token, remain] = strtok(remain,'!')
% and than token and remain is equal to "" .
%
% Yeni karakter þeklinde okuma tamamlandýktan sonra çünkü tüm
% karakterleri hemen okuyor.
% yeni "Terminator character" geldiðinde algýlayacak ve yeni
% listeye ekleyecek

remain = charArray;
tline = strings(0); %strings codegen not supported, sad but true :'(
LF = 0; CR = 0; Nul = 0; space =0;
lt = 0;
% tline = tline(1:end-sum(lt));
while (~isempty(remain))
% while (remain ~= "") %"" olmasý gerekebilir.
    [token,remain] = strtok(remain, char(10)); %newline codegen not supported
    
    if(contains(token,char(10))) % LF. horizantal tab. char(10)== '\n'
        LF = sum(char(token) == char(10));
    elseif(contains(token,char(13))) % CR, vertical tab. '\t'
        CR = sum(char(token) == char(13));
    elseif(contains(token,'\0')) % Nul, fazla kontrol olabilir, sonradan kaldýrýlabilir.
        Nul = sum(char(token) == '\0');
    elseif(contains(token,blanks(1))) % space, fazla kontrol olabilir, sonradan kaldýrýlabilir.
        space = sum(char(token) == blanks(1)); % pek gerekli deðil.
    end
    tline = [tline, token]; % daha sonra preallocation uygularsýn.
    
    lt=[LF CR Nul space]; 
%     disp(['lt: ', lt]) % debug purpose
    token = token(1:end-sum(lt)); % bu iþlemden sonra string 0x0 1x0 oluyor ve vectöre eklenmiyor.
end
disp(0) %for debug
% burada char olarak gönderiyor ama string olarak gelsin þimdilik.
% tline=char(tline);

