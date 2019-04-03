% Generate C# SWIG wrappers, set up JNI include paths, and include
% wrapper C code in Coder build. Designed to be used as a post codegen
% command:
%
%  cfg = coder.config('dll');
%  cfg.PostCodeGenCommand = 'csharphook';
%  codegen -config cfg ...

% Call SWIG to generate wrappers
d = 'IsarMainCsharp';
if exist(d,'dir')
    rmdir(d,'s');
end
mkdir(d);
checkedSystem(['swig -dllimport codegen/dll/IsarMain/IsarMain.dll ' ...
               '-module IsarMaincs -csharp -outdir IsarMainCsharp ' ...
               '-o IsarMainCsharp/IsarMain_wrap.c IsarMain_dynamic_size.i'])

buildInfo.addSourceFiles('IsarMain_wrap.c',fullfile(pwd,'IsarMainCsharp'));

% Build C#
% for mono "mcs"
% checkedSystem('csc IsarMainMain.cs IsarMainCsharp/*.cs') % daha
% IsarMainMain.cs yazmadým.
