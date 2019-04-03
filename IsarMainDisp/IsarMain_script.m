% ISARMAIN_SCRIPT   Generate static library IsarMain from IsarMain.
% 
% Script generated from project 'IsarMain.prj' on 18-Feb-2019.
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
cfg.FilePartitionMethod = 'SingleFile';
cfg.RuntimeChecks = true;
cfg.Toolchain = 'Microsoft Visual C++ 2017 v15.0 | nmake (64-bit Windows)';
cfg.BuildConfiguration = 'Faster Runs';
cfg.MultiInstanceCode = true;
cfg.DataTypeReplacement = 'CoderTypedefs';

%% Define argument types for entry-point 'IsarMain'.
ARGS = cell(1,1);
ARGS{1} = cell(1,1);
ARGS{1}{1} = coder.typeof(0,[Inf Inf],[1 1]);

%% Invoke MATLAB Coder.
codegen -config cfg IsarMain -args ARGS{1} -nargout 8

