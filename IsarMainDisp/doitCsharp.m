% % Driver script to show codegen, SWIG, and C#
% cfg = coder.config('dll');
% cfg.PostCodeGenCommand = 'csharphook';
%
% codegen timestwo -args 1 -config cfg -o timestwo.dll
%
% % Run test program
% disp(checkedSystem('./timestwoMain.exe'))

%% Create Dll
IsarMainDll_script('csharphook');
% disp(checkedSystem('./timestwoMain.exe'))
% system('timestwoMain.exe'); % daha .cs dosyasý derlenmedi.