% % Driver script to show codegen, SWIG, and Python
% cfg = coder.config('dll');
% cfg.PostCodeGenCommand = 'pythonhook';
% 
% % For Python SWIG this must be named _<module> so _timestwo
% codegen timestwo -args coder.typeof(1,[Inf,Inf]) -config cfg -o _timestwo.so

%% Create Dll
% Run test program
IsarMainDll_script('pythonhook');

% Copy module library to Python folder so that code can find it
% copyfile codegen/dll/IsarMain/IsarMain.dll IsarMainPython/
copyfile codegen/dll/IsarMain/_IsarMain.dll IsarMainPython/


% swig generates names with underscore before name
% .pyd files actually %99 same as .dll files except .pyd includespy_init method
movefile('IsarMainPython/_IsarMain.dll','IsarMainPython/_IsarMain.pyd');

% disp(checkedSystem('python timestwoMain.py'));
% system('python timestwoMain.py'); % daha .cs dosyasý derlenmedi.