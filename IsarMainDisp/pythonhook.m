% Generate Python SWIG wrappers and include wrapper C code in Coder
% build. Designed to be used as a post codegen command:
%
%  cfg = coder.config('dll');
%  cfg.PostCodeGenCommand = 'pythonhook';
%  codegen -config cfg ...

% Call SWIG to generate wrappers
d = 'IsarMainPython';
if exist(d,'dir')
    rmdir(d,'s');
end
mkdir(d);

% % Treat timestwoPython as a package
% !touch IsarMainPython/__init__.py
if ~exist('IsarMainPython/__init__.py')
   fopen('IsarMainPython/__init__.py','w');
else
   delete('IsarMainPython/__init__.py')
end
% fclose('IsarMainPython/__init__.py');
fclose('all');

checkedSystem(['swig -module IsarMain -python -outdir IsarMainPython ' ...
               '-o IsarMainPython/IsarMain_wrap.c IsarMain_dynamic_size.i'])

buildInfo.addSourceFiles('IsarMain_wrap.c',fullfile(pwd, 'IsarMainPython'));

% Update this to match your Python installation by querying python-config:
%
% $ python-config --includes
% -I/usr/include/python2.7 -I/usr/include/x86_64-linux-gnu/python2.7
% , 'C:\\ProgramData\\Anaconda3\\Lib', 'C:\\ProgramData\\Anaconda3\\Lib\\site-packages'
buildInfo.addIncludePaths({'C:\\ProgramData\\Anaconda3\\Include'});

% For libraries
%
% $ python-config --ldflags
% -L/usr/lib/python2.7/config-x86_64-linux-gnu -L/usr/lib -lpython2.7 -lpthread -ldl  -lutil -lm  -Xlinker -export-dynamic -Wl,-O1 -Wl,-Bsymbolic-functions
libPriority = '';
libPreCompiled = true;
libLinkOnly = true;
libName = 'python37.lib';
libPath = 'C:\\ProgramData\\Anaconda3\\libs';
buildInfo.addLinkObjects(libName, libPath, ...
                         libPriority, libPreCompiled, libLinkOnly);