function make_sfunc()
%-------------------------------------------------------------------------%
% 
%   Description : MEX-compilation of the daqp solver for simulink with code 
%                 generation. 
%   Author      : Christopher Schulte, RWTH Aachen University, IRT
%                 christopher.schulte@rwth-aachen.de
% 
%-------------------------------------------------------------------------%

current_dir = pwd;

% Get path of this file
this_file = mfilename('fullpath');
this_dir  = fileparts(this_file);

% Get the path of the daqp solver
daqp_root = fullfile('..','..');
include_dir  = {fullfile(daqp_root, 'include')};
source_dir   = fullfile(daqp_root, 'src');
source_files = {'daqp.c', ...
                'factorization.c',...
                'utils.c',...
                'api.c',...
                'auxiliary.c',...
                'daqp_prox.c',...
                'bnb.c'};


sfunc = 'daqp_sfunc.c';
    
% Construct compile command
cmd = [ 'mex ', sfunc ];
for ii = 1:length(source_files)
    cmd = sprintf('%s "%s"', cmd, fullfile(source_dir,source_files{ii}));
end
for ii = 1:length( include_dir )
    cmd = sprintf('%s -I"%s"', cmd, include_dir{ii});
end

% Compile daqp for Simulink
cd(this_dir)
eval(cmd) 
cd(current_dir)

end