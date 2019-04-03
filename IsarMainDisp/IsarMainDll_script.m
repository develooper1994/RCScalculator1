function IsarMainDll_script(PostCodeGen_Command)

% IsarMainDll_script   Generate dynamic library timestwo from timestwo.
%
% Script generated from project 'IsarMain.prj' on 15-Feb-2019.
%
% See also CODER, CODER.CONFIG, CODER.TYPEOF, CODEGEN.

%% Create configuration object of class 'coder.EmbeddedCodeConfig'.
cfg = coder.config('dll','ecoder',true);
cfg.ConvertIfToSwitch = true;
cfg.GenerateCodeMetricsReport = true;
cfg.GenerateCodeReplacementReport = true;
cfg.HighlightPotentialDataTypeIssues = true;
cfg.CodeExecutionProfiling = true;
cfg.GenerateReport = true;
cfg.DynamicMemoryAllocation = 'AllVariableSizeArrays';
cfg.MATLABSourceComments = true;
% cfg.FilePartitionMethod = 'SingleFile';
cfg.RuntimeChecks = true;
cfg.Toolchain = 'Microsoft Visual C++ 2017 v15.0 | nmake (64-bit Windows)';
cfg.BuildConfiguration = 'Faster Runs';
cfg.MultiInstanceCode = true;
cfg.DataTypeReplacement = 'CoderTypedefs';
cfg.PostCodeGenCommand = PostCodeGen_Command;
cfg.GenerateReport = true;
cfg.ReportPotentialDifferences = false;

%% Define argument types for entry-point 'timestwo'.
ARGS = cell(1,1);
ARGS{1} = cell(1,1);
ARGS{1}{1} = coder.typeof(0,[Inf Inf],[1 1]);

%% Invoke MATLAB Coder.
if ~all(strcmp(PostCodeGen_Command, "pythonhook"))
    codegen -config cfg IsarMain -args ARGS{1} -nargout 8
else
    codegen -config cfg IsarMain -args ARGS{1} -nargout 8 -o _IsarMain.dll
end
% Run test program
% disp(checkedSystem('./timestwoMain.exe'))
% sadece matlab bu þekilde dýþarýdan .exe çalýþtýramýyor. Program derlendi
% ve çalýþýyor :)

end
